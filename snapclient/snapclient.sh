#!/vendor/bin/sh
#
# SPDX-FileCopyrightText: 2025 The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#
# Snapclient startup script

# Get host and port from system properties
HOST=$(getprop persist.snapcast.host)
PORT=$(getprop persist.snapcast.port)

# Set defaults if not configured
if [ -z "$HOST" ]; then
    HOST="10.10.50.12"
fi

if [ -z "$PORT" ]; then
    PORT="1704"
fi

# Get MAC address for hostID
# Try wlan0 first, fall back to eth0
MAC=$(cat /sys/class/net/wlan0/address 2>/dev/null | tr -d ':')
if [ -z "$MAC" ]; then
    MAC=$(cat /sys/class/net/eth0/address 2>/dev/null | tr -d ':')
fi

# If still no MAC, generate a fallback ID
if [ -z "$MAC" ]; then
    MAC=$(cat /proc/sys/kernel/random/uuid | tr -d '-' | cut -c1-12)
fi

# Start snapclient with configured parameters
exec /vendor/bin/libsnapclient.so \
    -h "$HOST" \
    -p "$PORT" \
    --hostID "$MAC" \
    --player oboe \
    --sampleformat 48000:*:* \
    --logfilter "*:info,Stats:debug"
