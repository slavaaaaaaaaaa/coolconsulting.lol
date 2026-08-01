---
layout: home
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
<h2 class="section__title">A broad spectrum of delivery</h2>
<p class="section__sub">Five practices, one team. We plug in wherever your roadmap needs the most horsepower.</p>
</div>
<div class="cap-grid">
{% include cap-card.html accent="sre" icon="🛡️" title="SRE" blurb="Production you can sleep through. SLOs, observability, incident response, and toil reduction that keep systems fast and on their feet." %}
{% include cap-card.html accent="devops" icon="♾️" title="DevOps" blurb="Ship faster, safely. CI/CD pipelines, infrastructure as code, and release automation that turn deploys into non-events." %}
{% include cap-card.html accent="cloud" icon="☁️" title="Cloud" blurb="Right-sized foundations, architecture, migration, cost control, and security across AWS, GCP, and Kubernetes." %}
{% include cap-card.html accent="fullstack" icon="🧩" title="Full-stack engineering" blurb="From database to UI. Well-tested services, clean APIs, and interfaces your users and your team will actually enjoy." %}
{% include cap-card.html accent="ai" icon="🤖" title="AI" blurb="Practical AI that ships. LLM apps, agents, and retrieval built on the latest models — grounded in real evaluation, not hype." %}
</div>
</section>

<section class="section">
<div class="section__head">
<h2 class="section__title">Work we deliver</h2>
<p class="section__sub">A sample of what we build and run in the wild.</p>
</div>
<div class="proj-grid">
{% include proj-card.html accent="ai" tag="Client · 2026 (ongoing)" title="Enterprise AI chatbot" url="/clients/ai-chatbot/" blurb="A MFA-protected RAG assistant on GCP — Claude answers grounded in a curated knowledge corpus." %}
{% include proj-card.html accent="cloud" tag="Upcoming talk" title="Broadcast, Don't Chat — BSidesLV '26" url="/talks/bsideslv-26/" blurb="Hyperlocal emergency status over one-way LoRa with LoRaCast — receivers from $11 that never transmit." %}
{% include proj-card.html accent="devops" tag="Workshop" title="Meshtastic workshop at BSidesPDX '25" url="/meshsides/" blurb="Hands-on Meshtastic at BSidesPDX — custom firmware, hardware kits, and telemetry, all documented." %}
</div>
<div class="section__more"><a class="btn btn--ghost" href="/projects/">See all projects</a></div>
</section>

<section class="cta-band full-bleed">
<h2 class="cta-band__title">Let's build something cool.</h2>
<p class="cta-band__sub">Tell us where you're headed &mdash; we'll help you get there.</p>
<a class="btn btn--ghost" href="/contact/">Start a conversation</a>
</section>
