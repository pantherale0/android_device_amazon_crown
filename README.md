# Android Device tree for the Amazon Echo Show 8 (2019) (`crown`)

```
#
# SPDX-FileCopyrightText: 2025 The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#
```

## Snapcast Client Integration

This device tree includes integration for the Snapcast audio client, which enables synchronized audio playback across multiple devices.

### Setup

**Before building**, you must:

1. Place the `libsnapclient.so` binary (compiled for Android ARM 32-bit) in the `snapclient/` directory
   - See `snapclient/README.md` for detailed instructions on obtaining the binary
   - The build will fail if this file is missing
2. Configure the Snapcast server host and port in `vendor.prop`:
   - `persist.snapcast.host` - Server IP address (default: 10.10.50.12)
   - `persist.snapcast.port` - Server port (default: 1704)

### Runtime Configuration

The snapclient service can be configured via system properties:

```bash
# Set snapcast server host
adb shell setprop persist.snapcast.host 192.168.1.100

# Set snapcast server port
adb shell setprop persist.snapcast.port 1704

# Restart snapclient to apply changes
adb shell stop snapclient && adb shell start snapclient
```

### Features

- Automatically starts when boot is completed
- Uses device MAC address as hostID
- Configured to use Oboe audio player
- Sample format: 48000:*:*
- Log filter: *:info,Stats:debug

