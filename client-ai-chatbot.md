---
layout: page
title: Enterprise AI chatbot
permalink: /clients/ai-chatbot/
toplink: false
description: >
  How we built an MFA-protected RAG assistant on GCP: FastAPI and LangGraph,
  hybrid pgvector plus full-text retrieval with RRF fusion, Claude answers over
  SSE, and Terraform on Cloud Run.
---

**Client engagement · 2026 (ongoing)** · Anonymized

A chatbot for an organization's multinational program. Users ask natural-language questions; the system retrieves from a curated knowledge corpus and answers using a major LLM provider. Hosted on GCP on Cloud Run.

### Outcomes

<div class="outcomes outcomes--ai">
{% include outcome.html value="10.1 s" label="p95 time to first token, at 40 concurrent users" note="↓ from 160.1 s before tuning" %}
{% include outcome.html value="16.7 s" label="p95 to a complete streamed answer" note="↓ from 164.9 s" %}
{% include outcome.html value="200 / 200" label="requests served under that load, with zero fallback replies" %}
{% include outcome.html value="2.3 min" label="median commit-to-deployed pipeline" note="1.8 min typical, 6.8 min at p90" %}
</div>

Measured July 2026. Latency figures come from our own load harness driving 40 concurrent virtual users through the live API; the pipeline figure is measured across 132 successful production runs. The engagement is ongoing, so these move.

The headline improvement was not model choice — it was discovering that naive concurrency was converting into provider 429s, each costing 5–30 s of backoff. Client-side rate limiting coordinated service-wide, tuned to sit deliberately under the provider's per-bucket ceiling, turned a two-and-a-half-minute worst case into ten seconds.

### High-level architecture

<div class="diagram">{% include diagram-ai-chatbot.svg %}</div>

A browser SPA (login + MFA) talks to a FastAPI service over an HTTPS load balancer. The API runs a LangGraph orchestrator that plans the query, embeds it (Vertex AI), retrieves from a hybrid pgvector + full-text store, and streams the answer from Claude. Knowledge files live in GCS and are ingested by Cloud Run jobs; auth state sits in a separate Cloud SQL instance, with secrets and health reporting handled by Secret Manager and Cloud Logging.

### What we built

- **Streaming chat UI** — TypeScript SPA (Vite, Tailwind) with login, MFA enrollment, idle session timeout, feedback capture, and an optional retrieval/debug panel for operators
- **RAG API** — Python FastAPI with LangGraph orchestration: query contextualization, pipeline routing across corpus namespaces, hybrid full-text + vector retrieval (RRF fusion), and Claude answer generation over SSE
- **Knowledge pipeline** — document ingest (extract → chunk → embed → store), glossary-aware multilingual answers (English corpus; French and Spanish query paths), and tunable chunk/embedding config
- **Security posture** — JWT sessions, rate-limited login with lockout, CORS/TLS hardening, region-pinned data (`us-central1`), and production flags that strip debug payloads
- **Infrastructure** — Terraform on GCP (Cloud Run, Cloud SQL / pgvector, GCS, Vertex AI embeddings), GitHub Actions CI, golden-question evaluation suites for English and multilingual quality

### Retrieval, in detail

"Vector search" undersells it. Every query runs **hybrid retrieval** — Postgres full-text and pgvector similarity searched as separate channels, then fused with reciprocal rank fusion — because lexical and semantic search fail on different questions, and a coach asking about a specific form field needs the lexical hit that embeddings alone will miss.

Around that sits the machinery that decides *what* to search:

- **Namespace routing** — the corpus is split into distinct retrieval namespaces (core program documents, supplementary material, translations), and a router classifies each question into the right branch before any retrieval happens
- **Query contextualization** — multi-turn questions are rewritten against conversation history, so "what about the second one?" resolves to something retrievable
- **Doc-type-aware chunking** — chunks are sized to be self-contained semantic units (a Q&A pair, a form tab, a rubric row group) rather than uniform token windows, with title and section-path prefixes carried into the embedding
- **Multilingual without frontend i18n** — query-language detection, a translations namespace, per-document glossary indexing, and reserved translation slots inside the result set, against an English-authored corpus

The corpus is **60 documents across four languages**, spanning DOCX, PDF and plain text.

### Tuned, not hardcoded

Retrieval quality lives in the tuning, so the tuning is a reviewable artifact rather than scattered constants. A single settings file carries roughly two dozen knobs — RRF constant, candidate over-fetch multiplier, per-document chunk caps, quality-floor gating, translation reserve, document-version preference, chunk size bands, embedding model and dimensions — and they are split into two classes with different blast radii:

- **Retrieval, generation, language and model settings** deploy with the API alone
- **Chunking and embedding settings** trigger a full corpus re-index in CI, because changing them invalidates every stored vector

Model selection is per orchestrator step, not global: each of the six steps names its own model, so a cheap fast model handles query rewriting while a stronger one handles routing and answer generation. Each step declares an equivalent on a **second provider**, giving cross-provider failover rather than a single vendor dependency.

### Proving it before go-live

- **Configurable load harness** — one runner drives golden-question, multi-turn conversation, and stress modes against the live API, parameterized by virtual users, request interval, rounds, stagger, and endpoint. It emits per-request JSONL (status, time to first byte, total, fallback flag) so a run is analyzable after the fact rather than a pass/fail feeling. Every number in the outcomes above came out of it.
- **Continuous evaluation** — golden-question, multilingual, and multi-turn conversation suites run as scheduled CI workflows, plus a duplicate-chunk check on the corpus. **66 English and 25 multilingual golden questions**, so a retrieval-tuning change that quietly regresses answers is caught by the pipeline, not by a user.
- **Go-live readiness** — an end-to-end health report exercises the real user path (login, MFA, chat, retrieval) against a deployed environment as a single command.

### Stack at a glance

| Layer | Choice |
|-------|--------|
| Frontend | Vite + TypeScript SPA |
| API | FastAPI, LangGraph, Anthropic Claude |
| Embeddings | Google Vertex AI |
| Vector / search | PostgreSQL + pgvector (hybrid FTS) |
| Auth | Separate Postgres (users, MFA, sessions) |
| Cloud | GCP Cloud Run · Terraform |

Details of the client organization and complete application architecture are withheld under NDA. Want something in this shape for your team? [Get in touch](/contact/).
