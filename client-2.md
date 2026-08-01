---
layout: page
title: Music streaming platform
permalink: /clients/engagement-2/
toplink: false
---

**Client engagement · 2025** · Anonymized

A music streaming startup building a listener app, artist tools, and the cloud platform underneath. We embedded for the year to take them from “prototype on a laptop” to a deployable, multi-environment stack on GCP — the kind of foundation a streaming product actually needs before the catalog and the CDN matter.

### The story

Early in the engagement the product already had a Go API (Connect/gRPC over protobuf), a React Native client, and a clear sense of the domains — auth, listener catalog, artist portal, media. What it didn’t have was durable infrastructure: no real environments, no continuous delivery into Artifact Registry, no edge path for private audio, and no repeatable way to stand up the same stack twice.

We started with the boring, load-bearing pieces. Terraform carved out **dev** and **prod** GCP projects (plus a thin **global** layer for shared DNS), Cloud SQL and Memorystore, Secret Manager, and a Cloud Run backend behind a managed HTTPS load balancer. GitHub Actions gained Workload Identity Federation so container builds could push to Artifact Registry without long-lived keys — first for the API, later for frontend Cloud Run services.

The streaming-specific work was the edge. Audio and image objects live in regional GCS buckets; a **Fastly** CDN sits in front with custom VCL that authenticates private paths (HMAC-signed tokens, secrets rotated into Secret Manager) while still serving public assets cleanly. Logging from the CDN lands back in GCS so edge behaviour is inspectable. Along the way we documented the request and auth flows as diagrams the rest of the team could actually use.

By mid-year the path from merge to a smoke-tested Cloud Run revision was real, the CDN could gate private media, and the environments were identical enough that “works in dev” meant something. The product kept evolving on top of that platform — we left them with infra they could operate, not a one-off demo deploy.

### What we delivered

- **Multi-env GCP foundation** — projects, VPC, Cloud SQL (Postgres), Redis, Secret Manager, DNS, branch-driven Terraform for `dev` / `prod` / `global`
- **API platform** — Cloud Run + HTTPS load balancer, Artifact Registry, GitHub Actions CI with WIF, smoke tests
- **Media edge** — Fastly in front of GCS for audio/images, signed private-path auth, managed TLS, CDN → GCS logging
- **Frontend deploys** — Cloud Run packaging and push pipelines for web surfaces alongside the API
- **Operability** — infrastructure diagrams, CDN auth/request-flow docs, and make-wrapped plan/apply so the team owned the loop

### Stack at a glance

| Layer | Choice |
|-------|--------|
| API | Go · Connect / protobuf |
| Clients | React Native (Expo) · web portals |
| Compute | GCP Cloud Run · HTTPS LB |
| Data | Cloud SQL (Postgres) · Memorystore (Redis) |
| Media | GCS · Fastly CDN (VCL auth) |
| Delivery | Terraform · GitHub Actions · Artifact Registry · WIF |

Details of the client organization are withheld under NDA. Want a similar platform build for your team? [Get in touch](/contact/).
