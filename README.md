# OmniROM device tree for the ASUS ROG Phone 7 (AI2205)

> **Status: bring-up / untested on hardware.** The tree is structurally
> complete for OmniROM `android-16`, but nothing has been booted yet.

| | |
|---|---|
| Device | ASUS ROG Phone 7 / 7 Ultimate (`ASUS_AI2205`) |
| SoC | Qualcomm Snapdragon 8 Gen 2 (SM8550, `kalama`) |
| Kernel | stock GKI `5.15.167-android13-8` (prebuilt) |
| Launch | Android 13 (`PRODUCT_SHIPPING_API_LEVEL := 33`) |
| Partitions | A/B, virtual A/B, `init_boot`, `vendor_boot` (header v4), `system_dlkm` |

## How the tree is put together

* **Kernel** – `prebuilt/kernel/` contains the stock kernel `Image`, DTB,
  DTBO and the first stage (`vendor_boot`) modules, extracted from the stock
  `boot.img`, `vendor_boot.img` and `dtbo.img`. The `vendor_dlkm` and
  `system_dlkm` images are taken unmodified from the same stock firmware
  (`prebuilt/kernel/images/`, see below). The kernel source
  ([Lolzen/android_kernel_asus_AI2205](https://github.com/Lolzen/android_kernel_asus_AI2205))
  is only used for the UAPI headers needed by the boot control HAL.
* **Vendor** – the complete stock `vendor` and `odm` partitions are reused
  as blobs (`proprietary-files.txt`). Only the boot control HAL, the fstab,
  `vndservicemanager` and a few mount points are built from source.
* **VINTF** – `vintf/manifest.xml` is the stock device manifest.
* **SELinux** – vendor policy from the QCOM `sm8550` sepolicy plus a small
  device policy. Non-user builds boot permissive during bring-up.

## Building (OmniROM android-16)

```bash
repo init -u https://github.com/omnirom/android.git -b android-16
repo sync -c -j$(nproc) --force-sync --no-clone-bundle --no-tags

git clone https://github.com/Lolzen/android_device_asus_AI2205 -b android-16 device/asus/AI2205
```

The dependencies listed in `omni.dependencies` (qcom sepolicy, bootctrl,
kernel source, telephony) are synced automatically by `roomservice` on the
first `lunch`/`brunch`.

### Stock firmware files

A full stock firmware dump (same firmware version as the prebuilt kernel,
Android 15 / `35.x`) with the extracted `vendor` and `odm` partitions and the
raw `vendor_dlkm.img` / `system_dlkm.img` from `payload.bin` is required:

```bash
cd device/asus/AI2205
# regenerates proprietary-files.txt, vintf/*, vendor.prop, odm.prop and
# copies the dlkm images to prebuilt/kernel/images/
./tools/generate-from-dump.py /path/to/dump
# extracts the blobs to vendor/asus/AI2205
./extract-files.py /path/to/dump
```

The `proprietary-files.txt` shipped in this repository is only a partial
list (the firmware files known from the stock recovery). The build will not
boot without regenerating it.

### Build

```bash
. build/envsetup.sh
lunch omni_AI2205-bp4a-userdebug
m bacon
```

## Things to verify on the device

* Super partition size (`adb shell blockdev --getsize64 /dev/block/by-name/super`),
  `BoardConfig.mk` currently uses the ASUS default of `9126805504`.
* Security patch level in `BoardConfig.mk` (`BOOT_SECURITY_PATCH`) has to
  match the stock boot/vendor images.
* Under-display fingerprint position, refresh rates and brightness curves
  (`overlay/`) are not tuned yet.
* ROG specific hardware (AirTriggers, AeroActive cooler, Aura light, ROG
  Vision) is only available through the stock vendor services; there are no
  OmniROM settings for it yet.
