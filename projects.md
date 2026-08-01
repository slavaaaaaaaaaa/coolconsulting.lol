---
layout: page
title: Projects
permalink: /projects/
toplink: true
description: >
  Client platform builds, conference talks and workshops, and the open-source
  LoRa and Meshtastic work we run in the open — a full look at what we deliver.
---

The work we deliver, in the open. Workshops and talks we run, client engagements we ship, and tools we build — a broad spectrum of engineering.

Each card is colour-coded by the practice it belongs to:

<ul class="chips">
<li class="chip chip--sre">Reliability &amp; resilient comms</li>
<li class="chip chip--devops">DevOps &amp; tooling</li>
<li class="chip chip--cloud">Cloud platforms</li>
<li class="chip chip--fullstack">Product engineering</li>
<li class="chip chip--ai">AI &amp; retrieval</li>
</ul>

### Client engagements

<div class="proj-grid">
{% include proj-card.html accent="ai" tag="2026 (ongoing)" title="Enterprise chatbot" url="/clients/ai-chatbot/" blurb="Anonymized. MFA-protected RAG chatbot on GCP: Claude, hybrid pgvector retrieval, Terraform on Cloud Run." %}
{% include proj-card.html accent="cloud" tag="2025" title="Music streaming platform" url="/clients/engagement-2/" blurb="Anonymized. Took a streaming startup from laptop prototype to multi-env GCP: Cloud Run API, Fastly media CDN, Terraform + CI." %}
{% include proj-card.html accent="cloud" tag="Sep – Nov 2025" title="GCP & Workspace migration" url="/clients/engagement-3/" blurb="Anonymized. Led a large GCP + Workspace migration with an overseas partner — PM, leadership, and SRE: plans, docs, cutover, and operability." %}
</div>

### Workshops

<div class="proj-grid">
{% include proj-card.html accent="sre" tag="Workshop · SCaLE 23x" title="Building a mesh node from a kit" url="/workshops/scale-23x/" blurb="Public resources from our Pasadena workshop — everything attendees needed to keep going after the room emptied." %}
{% include proj-card.html accent="sre" tag="Workshop · BSides Seattle '26" title="Hands-on mesh networking" url="/workshops/bsides-seattle-26/" blurb="The workshop returns for BSides Seattle: kits, firmware, and a room full of nodes talking to each other." %}
{% include proj-card.html accent="sre" tag="Workshop · BSidesPDX '25" title="Custom firmware, telemetry, and a mesh BBS" url="/workshops/bsidespdx-25/" blurb="Our deepest write-up: Heltec v3 firmware, GPS and BME280 wiring, antenna theory, and the BBS we ran for attendees." %}
</div>

### Talks

<div class="proj-grid">
{% include proj-card.html accent="sre" tag="Upcoming · BSidesLV '26" title="Broadcast, Don't Chat" url="/talks/bsideslv-26/" blurb="Hyperlocal emergency status on $11 radios with LoRaCast — why mesh chat is the wrong shape for one-to-many alerts." %}
{% include proj-card.html accent="sre" tag="Talk · BSidesPDX '25" title="From walkie-talkies to Meshtastic" url="/talks/walkie-talkies-to-meshtastic/" blurb="An overview of communication platforms from walkie-talkies through to Meshtastic." %}
{% include proj-card.html accent="sre" tag="Talk · BSidesLV '25" title="Can you hear me now?" url="/talks/can-you-hear-me-now/" blurb="A survey of communications platforms during emergencies — what still works when infrastructure fails." %}
{% include proj-card.html accent="devops" tag="Talk · LayerOne '25" title="Engineering Culture" url="/talks/engineering-culture/" blurb="Creating, maintaining, and identifying a high-quality technical environment." %}
</div>

### Open source & R&amp;D

<div class="proj-grid">
{% include proj-card.html accent="ai" tag="Open source" title="Nudge" url="https://github.com/Cool-Consulting-LLC/zoom-to-claude" external=true blurb="Real-time Zoom call coaching, entirely local: live faster-whisper transcription plus Claude, surfacing a few high-value nudges instead of a transcript feed." cta="View on GitHub" %}
{% include proj-card.html accent="sre" tag="Open source · R&amp;D" title="why-am-i" url="https://github.com/Cool-Consulting-LLC/why-am-i" external=true blurb="A pocket LoRa social radar for conference buildings — direction arrows and distance bins to friends, no GPS or phones." cta="View on GitHub" %}
{% include proj-card.html accent="sre" tag="Open source" title="LoRaCast" url="https://github.com/Cool-Consulting-LLC/loracast" external=true blurb="One-way LoRa emergency broadcast: signed SLIM pages from a Pi gateway to silent ESP32 receivers." cta="View on GitHub" %}
{% include proj-card.html accent="sre" tag="Open source" title="Meshtastic firmware" url="https://github.com/Cool-Consulting-LLC/meshtastic-firmware" external=true blurb="Our custom event firmware for Heltec v3 boards, open for perusing and pull requests." cta="View on GitHub" %}
{% include proj-card.html accent="sre" tag="Open source" title="meshSides BBS" url="https://github.com/Cool-Consulting-LLC/meshsides-bbs" external=true blurb="Our BSidesPDX '25 fork of TC²-BBS — mail, bulletin boards, and a channel directory served to attendees over Meshtastic direct messages." cta="View on GitHub" %}
{% include proj-card.html accent="devops" tag="Open source" title="tspprint" url="https://github.com/Cool-Consulting-LLC/tspprint" external=true blurb="A CLI that turns a Star TSP654 receipt printer into a branded output device: raw TCP on port 9100, Star Line Mode or ESC/POS, and Markdown rendered as real printer styles." cta="View on GitHub" %}
</div>

Want something like this built or run for your team? [Let's talk.](/contact/)
