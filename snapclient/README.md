# Snapclient Binary Placeholder

This directory requires the `libsnapclient.so` binary file.

## How to obtain libsnapclient.so

You need to place the Snapcast client binary (compiled for Android ARM) in this directory as `libsnapclient.so`.

### Building from source:
1. Clone the Snapcast repository: https://github.com/badaix/snapcast
2. Follow the build instructions for Android
3. Copy the resulting binary to this directory as `libsnapclient.so`

### Pre-built binary:
If you have a pre-built Snapcast client binary for Android, place it here as `libsnapclient.so`.

The binary will be installed to `/vendor/bin/libsnapclient.so` on the device.
