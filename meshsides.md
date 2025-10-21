---
layout: page
title: MeshSides
permalink: /meshsides/
toplink: false
---

On October 25, 2025 we're hosting a Meshtastic workshop at BSides PDX: we're dubbing it meshSides '25. If you were there, you received this hardware kit for your cost of entry:

![](assets/meshsides-kit.png)

On this page you'll find all the resources used for the workshop.

# 1. Introduction & Overview

- [Introductory Montage video](https://www.youtube.com/watch?v=fmEhItNW0Q0)
- Workshop recording - TBA depending on availability
- [Google Slides we use for guiding the workshop](https://docs.google.com/presentation/d/1NV6DDtEID5ZnrtPdnQmO0WdO0rxEEhatJCHDJl_QeSA/edit)

## Hardware kit contents

- [Heltec v3 product page](https://heltec.org/project/wifi-lora-32-v3/)
- [NEO-6MV2GPS module details](https://components101.com/modules/neo-6mv2-gps-module)
- [HC-SR04 ultrasonic distance sensor details](https://projecthub.arduino.cc/Isaac100/getting-started-with-the-hc-sr04-ultrasonic-sensor-7cabe1)
- [BME-280 environmental sensor details](https://randomnerdtutorials.com/bme280-sensor-arduino-pressure-temperature-humidity/)

# 2. Installation

## Flashing with `esptool`

1. Download an appropriate [ESPTool binary](https://github.com/espressif/esptool/releases/tag/v4.10.0)
1. Download our [event firmware binary](https://drive.google.com/drive/folders/1UPdN6XeaiWWb94XXDGoKej2iUTjExevO)
1. `./esptool write_flash -e 0x0 bsides-pdx-firmware-2.6.11.bin`

# 3. Basic functionality

## Meshtastic clients

- [CLI](https://meshtastic.org/docs/software/python/cli/installation/)
- [Web UI Client](https://client.meshtastic.org/)
- [Android apps](https://meshtastic.org/docs/software/android/installation/)
- [iOS app](https://apple.co/3Auysep)

# 4. Telemetry

# 5. Advanced features

# 6. How to keep progressing

## Show and tell

### Meshtastic BBS

We [customized](https://github.com/Cool-Consulting-LLC/meshsides-bbs) an existing [TC2-BBS](https://github.com/TheCommsChannel/TC2-BBS-mesh/) project for BSides PDX. Connect to it on the default LongFast channel: `meshSides '25 BBS` aka `MS25`.

### T1000-e

- [Product page](https://www.seeedstudio.com/SenseCAP-Card-Tracker-T1000-E-for-Meshtastic-p-5913.html)

### Remote hardware control

- [Meshtastic documentation](https://meshtastic.org/docs/configuration/module/remote-hardware/)

# Extra resources

- [LLM-Meshtastic bridge](https://github.com/fiquett/llm-meshtastic-bridge)
- [BBS Mesh Scripts for Meshtastic](https://github.com/SpudGunMan/meshing-around)
- [Feedback form](https://meshsides-feedback.coolconsulting.lol)
- [Official flashing instructions](https://meshtastic.org/docs/getting-started/)
