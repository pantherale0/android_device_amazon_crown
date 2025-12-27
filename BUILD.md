# Building LineageOS for Amazon Echo Show 8 (crown)

This document provides instructions for building LineageOS for the Amazon Echo Show 8 (2019) device, codenamed "crown".

## Prerequisites

- A Linux-based build environment (Ubuntu 20.04+ recommended)
- At least 16GB of RAM (32GB recommended)
- At least 250GB of free disk space (more for ccache)
- A stable internet connection

## Required Repositories

This device tree depends on the following repositories:

1. **mt8163-common device tree** (Apache-2.0)
   - Repository: https://github.com/amazon-oss/android_device_amazon_mt8163-common
   - Path: `device/amazon/mt8163-common`

2. **Kernel source** (GPL-2.0)
   - Repository: https://github.com/amazon-oss/android_kernel_amazon_mt8163
   - Path: `kernel/amazon/mt8163`

3. **WiFi driver source** (Dual BSD / GPL-2.0)
   - Repository: https://github.com/amazon-oss/android_kernel_amazon_mt76x8-wifi
   - Path: `hardware/amazon/mt76x8-wifi`

4. **Bluetooth driver source** (Dual BSD / GPL-2.0)
   - Repository: https://github.com/amazon-oss/android_kernel_amazon_mt76x8-bt
   - Path: `hardware/amazon/mt76x8-bt`

## Building with LineageOS Build System

### Method 1: Using lineage.dependencies (Recommended)

The `lineage.dependencies` file in this repository will automatically fetch all required dependencies when using LineageOS build tools.

1. Initialize the LineageOS repository:
   ```bash
   repo init -u https://github.com/LineageOS/android.git -b lineage-19.1 --git-lfs
   ```

2. Create a local manifest directory and add this device tree:
   ```bash
   mkdir -p .repo/local_manifests
   ```

3. Create `.repo/local_manifests/roomservice.xml` with:
   ```xml
   <?xml version="1.0" encoding="UTF-8"?>
   <manifest>
     <project name="pantherale0/android_device_amazon_crown" 
              path="device/amazon/crown" 
              remote="github" 
              revision="main" />
   </manifest>
   ```

4. Sync the repository:
   ```bash
   repo sync -c -j$(nproc --all) --force-sync --no-clone-bundle --no-tags
   ```

5. Set up the build environment:
   ```bash
   source build/envsetup.sh
   lunch lineage_crown-userdebug
   ```

6. Start the build:
   ```bash
   mka bacon
   ```

### Method 2: Using the Local Manifest File

Alternatively, you can use the provided `crown.xml` manifest file:

1. Copy the manifest file to your local_manifests directory:
   ```bash
   mkdir -p .repo/local_manifests
   cp crown.xml .repo/local_manifests/
   ```

2. Follow steps 4-6 from Method 1.

## GitHub Actions Workflows

This repository includes two GitHub Actions workflows:

### 1. Build Android Workflow (`.github/workflows/build-android.yml`)

This workflow performs a complete LineageOS build:

- **Triggers**: Push to main/lineage-* branches, pull requests, manual dispatch
- **Features**:
  - Uses LineageOS Docker container for consistent builds
  - Clones all required dependencies
  - Builds the complete ROM
  - Uploads build artifacts (ZIP files and images)
  - Uploads build logs for troubleshooting

**Note**: This workflow requires significant resources and may take several hours to complete. Consider using self-hosted runners with adequate resources for production builds.

### 2. Validate Device Tree Workflow (`.github/workflows/validate.yml`)

This lightweight workflow validates the device tree configuration:

- **Triggers**: Push to main/lineage-* branches, pull requests, manual dispatch
- **Features**:
  - Checks makefile syntax
  - Validates XML files
  - Ensures required files are present
  - Lists device configuration and dependencies

This workflow is useful for quick validation of changes before triggering a full build.

## Build Output

After a successful build, you'll find the following files in `out/target/product/crown/`:

- `lineage-*.zip` - Flashable ROM package
- `boot.img` - Boot image
- `recovery.img` - Recovery image
- `system.img` - System partition image

## Vendor Blobs

This device tree requires proprietary vendor blobs. You can extract them from a running device using:

```bash
cd device/amazon/crown
./extract-files.sh
```

Alternatively, you can extract them from a stock firmware image.

## Contributing

When contributing to this device tree:

1. Test your changes locally first
2. Ensure the validation workflow passes
3. Document any new dependencies or configuration changes
4. Follow the existing code style and structure

## License

This device tree is licensed under Apache-2.0. See individual repository links above for license information on dependencies.

## Support

For issues or questions:

- Open an issue in the GitHub repository
- Check existing issues for solutions
- Refer to LineageOS documentation: https://wiki.lineageos.org/

## Device Specifications

- **Device**: Amazon Echo Show 8 (2019)
- **Codename**: crown
- **SoC**: MediaTek MT8163
- **Architecture**: ARM64
- **Screen**: 8" 1280x800 (213 DPI)
- **Type**: Tablet, WiFi-only
