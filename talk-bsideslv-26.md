---
layout: page
title: Broadcast, Don't Chat — BSides Las Vegas '26
permalink: /talks/bsideslv-26/
toplink: false
---

**Upcoming talk · BSides Las Vegas 2026** · Track: _I Am The Cavalry_  
With [Caleb Queern](https://www.linkedin.com/in/cqueern/)

### Broadcast, Don't Chat: Hyperlocal Emergency Comms on $11 Radios
*Or: Why the Mesh Won't Save You*

When critical infrastructure fails — a cyberattack on a water utility, a Cascadia earthquake, a wildfire that takes the cell network with it — the public's most urgent need isn't chat. It's trustworthy answers: Is the water safe? Which shelter is open? Which hospital is accepting patients?

Mesh platforms like Meshtastic and MeshCore are often proposed as the fallback. We'll show why they're the wrong shape for the job: emergency information dissemination is one-to-many, but mesh chat protocols are many-to-many. Flood routing saturates, node databases cap out, and every participant transmits — causing consumers of information to become trackable RF emitters.

### LoRaCast

To bridge that gap we built **[LoRaCast](https://github.com/Cool-Consulting-LLC/loracast)**: an open-source, one-way LoRa broadcast carousel inspired by [SLIM](https://cqueern.github.io/slim-spec/) (Structured Low-bandwidth Information Markup). A Raspberry Pi gateway signs status pages and broadcasts them over 915 MHz LoRa; receive-only ESP32 nodes decode them and stay silent.

Think NOAA Weather Radio meets teletext — except a county EM office, utility, hospital, or neighborhood resilience hub can stand one up for under $100, and receivers start at about $11. Receivers never transmit: unlimited audience, zero RF signature, no license required.

We'll demo the working system live — author a boil-water notice, hit send, watch receivers around the room light up — and present head-to-head measurements against Meshtastic and MeshCore: airtime, carousel refresh, delivery time under load, and battery life.

### What ships in the kit

- **Gateway** — Raspberry Pi + LoRa modem: author pages in a local web UI, encode to SLIM, sign with Ed25519, erasure-code, and run a repeating carousel
- **Silent receivers** — from ~$11 XIAO boards (LED/buzzer alert) to Heltec e-ink nodes that persist pages with power off
- **Relays** — solar-friendly re-broadcast of signed frames verbatim (no private key, no mesh state)

Everything — gateway, receiver firmware, bill of materials, deployment guide — is in the [LoRaCast repo](https://github.com/Cool-Consulting-LLC/loracast).
