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

### High-level architecture

<div class="diagram">{% include diagram-ai-chatbot.svg %}</div>

A browser SPA (login + MFA) talks to a FastAPI service over an HTTPS load balancer. The API runs a LangGraph orchestrator that plans the query, embeds it (Vertex AI), retrieves from a hybrid pgvector + full-text store, and streams the answer from Claude. Knowledge files live in GCS and are ingested by Cloud Run jobs; auth state sits in a separate Cloud SQL instance, with secrets and health reporting handled by Secret Manager and Cloud Logging.

### What we built

- **Streaming chat UI** — TypeScript SPA (Vite, Tailwind) with login, MFA enrollment, idle session timeout, feedback capture, and an optional retrieval/debug panel for operators
- **RAG API** — Python FastAPI with LangGraph orchestration: query contextualization, pipeline routing across corpus namespaces, hybrid full-text + vector retrieval (RRF fusion), and Claude answer generation over SSE
- **Knowledge pipeline** — document ingest (extract → chunk → embed → store), glossary-aware multilingual answers (English corpus; French and Spanish query paths), and tunable chunk/embedding config
- **Security posture** — JWT sessions, rate-limited login with lockout, CORS/TLS hardening, region-pinned data (`us-central1`), and production flags that strip debug payloads
- **Infrastructure** — Terraform on GCP (Cloud Run, Cloud SQL / pgvector, GCS, Vertex AI embeddings), GitHub Actions CI, golden-question evaluation suites for English and multilingual quality

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
