# Snapclient Binary

This directory contains the Snapcast client binary for Android.

## Required File

You need to place the `libsnapclient.so` binary file in this directory before building.

### Building from source

1. Clone the Snapcast repository:
   ```bash
   git clone https://github.com/badaix/snapcast.git
   cd snapcast
   ```

2. Follow the Android build instructions in the Snapcast documentation:
   - https://github.com/badaix/snapcast/blob/develop/doc/build.md#android

3. The build process should produce a binary for Android ARM 32-bit architecture

4. Copy the resulting `snapclient` binary to this directory and rename it to `libsnapclient.so`:
   ```bash
   cp /path/to/built/snapclient ./libsnapclient.so
   ```

### Pre-built Binary

If you have a pre-built Snapcast client binary for Android ARM 32-bit:
1. Place it in this directory
2. Rename it to `libsnapclient.so`
3. Ensure it has execute permissions

### Installation Location

The binary will be installed to `/vendor/bin/libsnapclient.so` on the device.

### Configuration

The snapclient service is configured via:
- `vendor.prop` - Default host and port settings
- Runtime properties - Can be changed without rebuilding:
  - `persist.snapcast.host` - Server IP address
  - `persist.snapcast.port` - Server port number

The hostID is automatically derived from the device's MAC address.

