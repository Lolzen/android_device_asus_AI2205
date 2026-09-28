#
# Copyright (C) 2024-2025 The OmniROM Project
#
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/asus/AI2205

BOARD_VENDOR := asus

# A/B
AB_OTA_UPDATER := true

AB_OTA_PARTITIONS += \
    boot \
    dtbo \
    init_boot \
    odm \
    product \
    recovery \
    system \
    system_dlkm \
    system_ext \
    vbmeta \
    vbmeta_system \
    vendor \
    vendor_boot \
    vendor_dlkm

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv9-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_VARIANT := generic
TARGET_CPU_VARIANT_RUNTIME := kryo300

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv8-a
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := generic
TARGET_2ND_CPU_VARIANT_RUNTIME := kryo300

# Bluetooth
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := $(DEVICE_PATH)/bluetooth

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := kalama
TARGET_NO_BOOTLOADER := true

# Boot image (header v4, GKI: kernel in boot, generic ramdisk in init_boot,
# vendor ramdisk + dtb in vendor_boot)
BOARD_BOOT_HEADER_VERSION := 4
BOARD_MKBOOTIMG_ARGS += --header_version $(BOARD_BOOT_HEADER_VERSION)
BOARD_INIT_BOOT_HEADER_VERSION := 4
BOARD_MKBOOTIMG_INIT_ARGS += --header_version $(BOARD_INIT_BOOT_HEADER_VERSION)
BOARD_RAMDISK_USE_LZ4 := true
BOARD_MOVE_GSI_AVB_KEYS_TO_VENDOR_BOOT := true

# Display
TARGET_SCREEN_DENSITY := 440

# Filesystem
TARGET_FS_CONFIG_GEN := $(DEVICE_PATH)/config.fs

# Kernel
#
# The stock GKI kernel (5.15.167-android13-8), the stock DTB, DTBO and the
# first stage (vendor_boot) modules are shipped as prebuilts in
# prebuilt/kernel, extracted from the stock boot.img/vendor_boot.img/dtbo.img.
# The kernel source is only used to generate UAPI headers for the few HALs
# that are built from source (e.g. bootctrl).
BOARD_KERNEL_BASE := 0x00000000
BOARD_KERNEL_PAGESIZE := 4096
BOARD_KERNEL_IMAGE_NAME := Image
BOARD_USES_GENERIC_KERNEL_IMAGE := true

BOARD_KERNEL_CMDLINE := \
    video=vfb:640x400,bpp=32,memsize=3072000 \
    qcom_geni_serial.con_enabled=0 \
    firmware_class.path=/vendor/firmware

BOARD_BOOTCONFIG := \
    androidboot.hardware=qcom \
    androidboot.memcg=1 \
    androidboot.usbcontroller=a600000.dwc3

# SELinux is not yet complete for the stock vendor blobs, boot permissive
# on non-user builds during bring-up.
ifneq ($(TARGET_BUILD_VARIANT),user)
BOARD_BOOTCONFIG += androidboot.selinux=permissive
endif

KERNEL_PREBUILT_DIR := $(DEVICE_PATH)/prebuilt/kernel
TARGET_NO_KERNEL_OVERRIDE := true
TARGET_KERNEL_SOURCE := kernel/asus/AI2205

BOARD_PREBUILT_DTBIMAGE_DIR := $(KERNEL_PREBUILT_DIR)/dtb
BOARD_PREBUILT_DTBOIMAGE := $(KERNEL_PREBUILT_DIR)/dtbo.img
BOARD_INCLUDE_DTB_IN_BOOTIMG := true

# Kernel modules (first stage / vendor_boot)
KERNEL_RAMDISK_MODULES_DIR := $(KERNEL_PREBUILT_DIR)/vendor_ramdisk
BOARD_VENDOR_RAMDISK_KERNEL_MODULES := $(wildcard $(KERNEL_RAMDISK_MODULES_DIR)/*.ko)
BOARD_VENDOR_RAMDISK_KERNEL_MODULES_LOAD := $(strip $(shell cat $(KERNEL_RAMDISK_MODULES_DIR)/modules.load))
BOARD_VENDOR_RAMDISK_RECOVERY_KERNEL_MODULES_LOAD := $(strip $(shell cat $(KERNEL_RAMDISK_MODULES_DIR)/modules.load.recovery))
BOARD_VENDOR_RAMDISK_KERNEL_MODULES_BLOCKLIST_FILE := $(KERNEL_RAMDISK_MODULES_DIR)/modules.blocklist

# Kernel modules (second stage / vendor_dlkm + system_dlkm)
#
# The vendor_dlkm and system_dlkm images have to match the prebuilt kernel,
# they are taken unmodified from the same stock firmware.
# tools/generate-from-dump.py puts them in place.
BOARD_PREBUILT_VENDOR_DLKMIMAGE := $(KERNEL_PREBUILT_DIR)/images/vendor_dlkm.img
BOARD_PREBUILT_SYSTEM_DLKMIMAGE := $(KERNEL_PREBUILT_DIR)/images/system_dlkm.img
ifneq ($(words $(wildcard $(BOARD_PREBUILT_VENDOR_DLKMIMAGE) $(BOARD_PREBUILT_SYSTEM_DLKMIMAGE))),2)
$(warning Stock vendor_dlkm/system_dlkm images are missing in $(KERNEL_PREBUILT_DIR)/images, run tools/generate-from-dump.py)
endif

# Metadata
BOARD_USES_METADATA_PARTITION := true

# Partitions
BOARD_FLASH_BLOCK_SIZE := 262144 # (BOARD_KERNEL_PAGESIZE * 64)
BOARD_BOOTIMAGE_PARTITION_SIZE := 100663296
BOARD_DTBOIMG_PARTITION_SIZE := 25165824
BOARD_INIT_BOOT_IMAGE_PARTITION_SIZE := 8388608
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 104857600
BOARD_VENDOR_BOOTIMAGE_PARTITION_SIZE := 100663296

# Verify on the device with:
#   adb shell blockdev --getsize64 /dev/block/by-name/super
BOARD_SUPER_PARTITION_SIZE := 9126805504
BOARD_SUPER_PARTITION_GROUPS := qti_dynamic_partitions
BOARD_QTI_DYNAMIC_PARTITIONS_SIZE := 9122611200 # BOARD_SUPER_PARTITION_SIZE - 4MB
BOARD_QTI_DYNAMIC_PARTITIONS_PARTITION_LIST := \
    odm \
    product \
    system \
    system_dlkm \
    system_ext \
    vendor \
    vendor_dlkm

BOARD_ODMIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_PRODUCTIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_SYSTEMIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_SYSTEM_EXTIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := f2fs
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4

TARGET_COPY_OUT_ODM := odm
TARGET_COPY_OUT_PRODUCT := product
TARGET_COPY_OUT_SYSTEM_DLKM := system_dlkm
TARGET_COPY_OUT_SYSTEM_EXT := system_ext
TARGET_COPY_OUT_VENDOR := vendor
TARGET_COPY_OUT_VENDOR_DLKM := vendor_dlkm

# Leave some room in the read-only partitions for GApps/MicroG builds
ifneq ($(ROM_BUILDTYPE),$(filter $(ROM_BUILDTYPE),GAPPS MICROG))
BOARD_PRODUCTIMAGE_EXTFS_INODE_COUNT := -1
BOARD_PRODUCTIMAGE_PARTITION_RESERVED_SIZE := 1629145600
BOARD_SYSTEMIMAGE_EXTFS_INODE_COUNT := -1
BOARD_SYSTEMIMAGE_PARTITION_RESERVED_SIZE := 429145600
BOARD_SYSTEM_EXTIMAGE_PARTITION_RESERVED_SIZE := 429145600
endif

# Folders required by the stock ASUS vendor
BOARD_ROOT_EXTRA_FOLDERS += ADF APD asdf batinfo

# Platform
BOARD_USES_QCOM_HARDWARE := true
TARGET_BOARD_PLATFORM := kalama

# Only the QSSI (system) side of the QCOM HALs is built from source,
# the vendor side comes from the stock firmware.
USE_DEVICE_SPECIFIC_DATA_IPA_CFG_MGR := true
USE_DEVICE_SPECIFIC_DATASERVICES := true

# Properties
BOARD_PROPERTY_OVERRIDES_SPLIT_ENABLED := true
TARGET_ODM_PROP += $(DEVICE_PATH)/odm.prop
TARGET_PRODUCT_PROP += $(DEVICE_PATH)/product.prop
TARGET_SYSTEM_PROP += $(DEVICE_PATH)/system.prop
TARGET_VENDOR_PROP += $(DEVICE_PATH)/vendor.prop

# Recovery
BOARD_EXCLUDE_KERNEL_FROM_RECOVERY_IMAGE := true
BOARD_USES_FULL_RECOVERY_IMAGE := true
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/init/fstab.qcom
TARGET_RECOVERY_PIXEL_FORMAT := RGBX_8888
TARGET_RECOVERY_UI_MARGIN_HEIGHT := 100
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true

# Security patch level (of the stock vendor/boot images)
BOOT_SECURITY_PATCH := 2025-05-05
VENDOR_SECURITY_PATCH := $(BOOT_SECURITY_PATCH)

# SEPolicy
include vendor/omni/sepolicy/sepolicy.mk
include device/qcom/sepolicy_vndr/sm8550/SEPolicy.mk
BOARD_VENDOR_SEPOLICY_DIRS += $(DEVICE_PATH)/sepolicy/vendor

# Verified Boot
BOARD_AVB_ENABLE := true
BOARD_AVB_MAKE_VBMETA_IMAGE_ARGS += --flags 3

BOARD_AVB_RECOVERY_KEY_PATH := external/avb/test/data/testkey_rsa4096.pem
BOARD_AVB_RECOVERY_ALGORITHM := SHA256_RSA4096
BOARD_AVB_RECOVERY_ROLLBACK_INDEX := 1
BOARD_AVB_RECOVERY_ROLLBACK_INDEX_LOCATION := 1

BOARD_AVB_VBMETA_SYSTEM := product system system_ext
BOARD_AVB_VBMETA_SYSTEM_KEY_PATH := external/avb/test/data/testkey_rsa2048.pem
BOARD_AVB_VBMETA_SYSTEM_ALGORITHM := SHA256_RSA2048
BOARD_AVB_VBMETA_SYSTEM_ROLLBACK_INDEX := $(PLATFORM_SECURITY_PATCH_TIMESTAMP)
BOARD_AVB_VBMETA_SYSTEM_ROLLBACK_INDEX_LOCATION := 2

# VINTF
DEVICE_FRAMEWORK_COMPATIBILITY_MATRIX_FILE += \
    hardware/qcom-caf/common/vendor_framework_compatibility_matrix.xml \
    $(DEVICE_PATH)/vintf/framework_compatibility_matrix.xml
DEVICE_MATRIX_FILE += hardware/qcom-caf/common/compatibility_matrix.xml
DEVICE_MANIFEST_FILE += $(DEVICE_PATH)/vintf/manifest.xml

# Proprietary files (generated by setup-makefiles.py)
ifeq ($(wildcard vendor/asus/AI2205/BoardConfigVendor.mk),)
$(warning vendor/asus/AI2205 is missing, run ./extract-files.py first)
endif
-include vendor/asus/AI2205/BoardConfigVendor.mk
