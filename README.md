# Android Device tree for the Amazon Echo Show 8 (2019) (`crown`)

```
#
# SPDX-FileCopyrightText: 2025 The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#
```

## Overview

This repository contains the device configuration for the Amazon Echo Show 8 (2019), codenamed "crown". The device is based on the MediaTek MT8163 SoC.

## Device Specifications

| Component | Specification |
|-----------|---------------|
| SoC | MediaTek MT8163 |
| CPU | Quad-core ARM Cortex-A53 |
| Architecture | ARM64 |
| Screen | 8" 1280x800 (213 DPI) |
| RAM | 2GB |
| Storage | 16GB |
| WiFi | MediaTek MT76x8 |
| Bluetooth | MediaTek MT76x8 |
| Type | Tablet, WiFi-only |

## Build Instructions

For detailed build instructions, including how to set up the build environment and use the GitHub Actions workflows, please see [BUILD.md](BUILD.md).

## Quick Start

```bash
# Initialize LineageOS repo
repo init -u https://github.com/LineageOS/android.git -b lineage-19.1 --git-lfs

# Sync with dependencies (lineage.dependencies will auto-fetch required repos)
repo sync -c -j$(nproc --all)

# Build
source build/envsetup.sh
lunch lineage_crown-userdebug
mka bacon
```

## Dependencies

This device tree depends on:
- [mt8163-common device tree](https://github.com/amazon-oss/android_device_amazon_mt8163-common) (Apache-2.0)
- [Kernel source](https://github.com/amazon-oss/android_kernel_amazon_mt8163) (GPL-2.0)
- [WiFi driver](https://github.com/amazon-oss/android_kernel_amazon_mt76x8-wifi) (Dual BSD / GPL-2.0)
- [Bluetooth driver](https://github.com/amazon-oss/android_kernel_amazon_mt76x8-bt) (Dual BSD / GPL-2.0)

## GitHub Workflows

This repository includes automated workflows:
- **Build Android**: Full LineageOS build with artifact upload
- **Validate Device Tree**: Quick validation of device configuration

See [BUILD.md](BUILD.md) for more information about the workflows.

## License

This device tree is licensed under Apache-2.0.
