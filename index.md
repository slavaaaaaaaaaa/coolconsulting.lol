---
layout: home
description: >
  A boutique engineering consultancy in Seattle. We build and run GCP and AWS
  platforms — Terraform, Cloud Run, CI/CD — and ship LLM and retrieval products
  that survive production.
---

<section class="hero full-bleed">
<span class="hero__eyebrow">Cool Consulting, LLC</span>
<h1 class="hero__title">Engineering across the spectrum.</h1>
<p class="hero__tagline">Oui, c'est cool.</p>
<p class="hero__lead">A boutique engineering consultancy. From reliability to AI, we take you from A to B &mdash; pragmatically, and with the receipts.</p>
<div class="hero__cta">
<a class="btn btn--primary" href="/projects/">See our work</a>
<a class="btn btn--ghost" href="/contact/">Get in touch</a>
</div>
</section>

<section class="section">
<div class="section__head">
<h2 class="section__title">What you hire us for</h2>
<p class="section__sub">Two things we do repeatedly, and have the engagements to show for it.</p>
</div>
<div class="offer-grid">
{% include offer-card.html accent="cloud" tag="Platform engineering" title="Cloud platforms on GCP & AWS" url="/clients/engagement-2/" blurb="Environments you can reproduce, a delivery path you can trust, and infrastructure your own team can operate after we leave." points="Terraform-built multi-environment foundations|Cloud Run, Kubernetes, and managed load balancing|CI/CD with keyless auth and real smoke tests|CDN and edge auth for private media|Runbooks, diagrams, and ownership maps" %}
{% include offer-card.html accent="ai" tag="Applied AI" title="LLM & retrieval products that survive production" url="/clients/ai-chatbot/" blurb="Not a demo. Retrieval that stays accurate, an evaluation suite that catches regressions, and the security posture an enterprise will actually approve." points="Hybrid vector + full-text retrieval with RRF fusion|LangGraph orchestration and streaming answers|Golden-question evaluation suites, incl. multilingual|MFA, rate limiting, and region-pinned data|Terraform, Cloud Run, and pgvector underneath" %}
</div>
</section>

<section class="section">
<div class="section__head">
<h2 class="section__title">How we engage</h2>
<p class="section__sub">Pick the shape that fits the problem &mdash; we'll tell you honestly if it's the wrong one.</p>
</div>
<div class="cap-grid">
{% include cap-card.html accent="devops" icon="📦" title="Project" blurb="A scoped build with milestones you can hold us to. Best when the destination is clear and you need it built right the first time." %}
{% include cap-card.html accent="cloud" icon="🔁" title="Retainer" blurb="Ongoing ownership of a platform, a pipeline, or an on-call posture. Best when the thing exists and now has to keep working." %}
{% include cap-card.html accent="fullstack" icon="🧭" title="Fractional" blurb="An embedded senior engineer or engineering lead, part-time. Best when you need the judgment more than the headcount." %}
</div>
</section>

<section class="section">
<div class="section__head">
<h2 class="section__title">Client work</h2>
<p class="section__sub">Engagements we've shipped. Anonymized, but the architecture is real.</p>
</div>
<div class="proj-grid">
{% include proj-card.html accent="ai" tag="2026 (ongoing)" title="Enterprise AI chatbot" url="/clients/ai-chatbot/" blurb="A MFA-protected RAG assistant on GCP — Claude answers grounded in a curated knowledge corpus." %}
{% include proj-card.html accent="cloud" tag="2025" title="Music streaming platform" url="/clients/engagement-2/" blurb="Laptop prototype to multi-env GCP: Cloud Run API, Fastly media CDN with signed private paths, Terraform and CI." %}
{% include proj-card.html accent="devops" tag="Sep – Nov 2025" title="GCP & Workspace migration" url="/clients/engagement-3/" blurb="Led a large migration from the PM, leadership, and SRE seat, alongside an overseas delivery partner." %}
</div>
</section>

<section class="section">
<div class="section__head">
<h2 class="section__title">Field notes &amp; R&amp;D</h2>
<p class="section__sub">Why we're worth hiring: the radio work, the talks, and the code we publish.</p>
</div>
<div class="proj-grid">
{% include proj-card.html accent="sre" tag="Upcoming · BSidesLV '26" title="Broadcast, Don't Chat" url="/talks/bsideslv-26/" blurb="Hyperlocal emergency status over one-way LoRa with LoRaCast — receivers from $11 that never transmit." %}
{% include proj-card.html accent="fullstack" tag="Workshop · BSidesPDX '25" title="Hands-on Meshtastic, start to finish" url="/workshops/bsidespdx-25/" blurb="Custom Heltec v3 firmware, hardware kits, a telemetry pipeline, and a mesh BBS — every resource published." %}
{% include proj-card.html accent="devops" tag="Open source · R&amp;D" title="why-am-i" url="https://github.com/Cool-Consulting-LLC/why-am-i" external=true blurb="A pocket LoRa social radar: direction and distance to your group from RSSI and SNR alone — no GPS, no phones." cta="View on GitHub" %}
</div>
<div class="section__more"><a class="btn btn--ghost" href="/projects/">See all projects</a></div>
</section>

<section class="section">
<div class="section__head">
<h2 class="section__title">The full spectrum</h2>
<p class="section__sub">Senior people who have actually run the thing they're advising you on, assembled per engagement. Everything we take on sits somewhere along here.</p>
</div>
<div class="cap-grid">
{% include cap-card.html accent="sre" icon="🛡️" title="SRE" blurb="Production you can sleep through. SLOs, observability, incident response, and toil reduction that keep systems fast and on their feet." %}
{% include cap-card.html accent="devops" icon="♾️" title="DevOps" blurb="Ship faster, safely. CI/CD pipelines, infrastructure as code, and release automation that turn deploys into non-events." %}
{% include cap-card.html accent="cloud" icon="☁️" title="Cloud" blurb="Right-sized foundations, architecture, migration, cost control, and security across AWS, GCP, and Kubernetes." %}
{% include cap-card.html accent="fullstack" icon="🧩" title="Full-stack engineering" blurb="From database to UI. Well-tested services, clean APIs, and interfaces your users and your team will actually enjoy." %}
{% include cap-card.html accent="ai" icon="🤖" title="AI" blurb="Practical AI that ships. LLM apps, agents, and retrieval built on the latest models — grounded in real evaluation, not hype." %}
</div>
</section>

<section class="cta-band full-bleed">
<h2 class="cta-band__title">Let's build something cool.</h2>
<p class="cta-band__sub">Tell us where you're headed &mdash; we'll help you get there.</p>
<a class="btn btn--ghost" href="/contact/">Start a conversation</a>
</section>
