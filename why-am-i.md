---
layout: page
title: why-am-i
permalink: /why-am-i/
toplink: false
---

_where am i? who am i?_

**why-am-i** is a pocketable LoRa "social radar" for conference buildings: every person in a group carries a cheap device with a small screen. The screen shows, for each friend, an arrow (direction) and a rough distance bin — _Bob ↗ ~40 m_. No GPS, no venue infrastructure, no phones, no internet.

Everything is derived from the LoRa signals the devices already exchange: RSSI and SNR of each other's beacons.

### What to expect

This is a compass-like radar, not indoor Google Maps:

- **Distance** is a bin (roughly 10 / 30 / 100 / 300 m), not a precise meter reading — correct bin most of the time, essentially always within ±1 bin
- **Arrows** appear after a short calibration walk (~20–30 m with one turn) and are quadrant-accurate (±45°); before that you get distance rings only
- **Updates** show a friend who starts walking within ~15–30 s
- **Scale:** about 5–60 friends per group key · **Battery:** multi-day target

### Hardware

Per device, roughly ~$63 all-in: Heltec Vision Master E290 (ESP32-S3 + e-ink), I2C magnetometer, LiPo, printed case, and a known-good antenna. A barometer for floor detection is a later-phase add-on; the base build is single-plane.

### Status

Open R&D under [Cool-Consulting-LLC/why-am-i](https://github.com/Cool-Consulting-LLC/why-am-i) — firmware bring-up on the E290, plus an offline simulation stack (`whereami/`) for ranging, localization, and radar rendering before hardware catches up.
