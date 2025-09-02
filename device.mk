DEVICE_PATH := device/asus/AI2205

# Inherit from common AOSP config
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Enable updating of APEXes
$(call inherit-product, $(SRC_TARGET_DIR)/product/updatable_apex.mk)

# Setup dalvik vm configs
$(call inherit-product, frameworks/native/build/phone-xhdpi-6144-dalvik-heap.mk)

# Shipping API level
PRODUCT_SHIPPING_API_LEVEL := 35

# VNDK
PRODUCT_TARGET_VNDK_VERSION := 35
PRODUCT_EXTRA_VNDK_VERSIONS := 35

# A/B
AB_OTA_UPDATER := true

AB_OTA_PARTITIONS += \
    boot \
    dtbo \
    odm \
    product \
    system \
    system_ext \
    vbmeta \
    vbmeta_system \
    vendor \
    vendor_boot

PRODUCT_PACKAGES += \
    otapreopt_script \
    update_engine \
    update_engine_sideload \
    update_verifier

# Audio
PRODUCT_PACKAGES += \
    android.hardware.audio@7.1-impl \
    android.hardware.audio.effect@7.0-impl \
    android.hardware.audio.service \
    android.hardware.soundtrigger@2.3-impl \
    audio.primary.sm8550 \
    audio.r_submix.default \
    audio.usb.default \
    libaudiopreprocessing \
    libbundlewrapper \
    libdownmix \
    libdynproc \
    libeffectproxy \
    libldnhncr \
    libreverbwrapper \
    libvisualizer \
    libspatializer

PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/configs/audio/audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_configuration.xml \
    $(DEVICE_PATH)/configs/audio/audio_effects.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_effects.xml

# Bluetooth
PRODUCT_PACKAGES += \
    android.hardware.bluetooth@1.1.vendor \
    android.hardware.bluetooth.audio@2.2-impl \
    vendor.qti.hardware.bluetooth_audio@2.2.vendor \
    BluetoothResCommon

# Camera
PRODUCT_PACKAGES += \
    android.hardware.camera.provider@2.7-impl \
    android.hardware.camera.provider@2.7-service \
    libcamera2ndk_vendor \
    vendor.qti.hardware.camera.postproc@1.0.vendor \
    CameraGo

# Display
PRODUCT_PACKAGES += \
    android.hardware.graphics.composer@2.4-service \
    android.hardware.graphics.mapper@4.0-impl-qti-display \
    android.hardware.memtrack@1.0-impl \
    android.hardware.memtrack@1.0-service \
    gralloc.sm8550 \
    hwcomposer.sm8550 \
    memtrack.sm8550 \
    vendor.qti.hardware.display.allocator-service \
    vendor.qti.hardware.display.composer-service

# DRM
PRODUCT_PACKAGES += \
    android.hardware.drm@1.4.vendor \
    android.hardware.drm-service.clearkey \
    libdrm.vendor

# Fingerprint
PRODUCT_PACKAGES += \
    android.hardware.biometrics.fingerprint@2.3-service.asus \
    android.hardware.biometrics.common-V3-ndk.vendor

# Gatekeeper
PRODUCT_PACKAGES += \
    android.hardware.gatekeeper@1.0.vendor

# GPS
PRODUCT_PACKAGES += \
    android.hardware.gnss@2.1-impl-qti \
    android.hardware.gnss@2.1-service-qti \
    android.hardware.gnss-V3-ndk.vendor \
    libbatching \
    libgeofencing \
    libgnss \
    libsensorndkbridge \
    gnss@2.1-base.policy

PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/configs/gps/apdr.conf:$(TARGET_COPY_OUT_VENDOR)/etc/apdr.conf \
    $(DEVICE_PATH)/configs/gps/flp.conf:$(TARGET_COPY_OUT_VENDOR)/etc/flp.conf \
    $(DEVICE_PATH)/configs/gps/gps.conf:$(TARGET_COPY_OUT_VENDOR)/etc/gps.conf \
    $(DEVICE_PATH)/configs/gps/izat.conf:$(TARGET_COPY_OUT_VENDOR)/etc/izat.conf

# Health
PRODUCT_PACKAGES += \
    android.hardware.health@2.1-impl \
    android.hardware.health@2.1-service \
    android.hardware.health-V3-ndk.vendor

# HIDL
PRODUCT_PACKAGES += \
    android.hidl.base@1.0 \
    android.hidl.manager@1.0 \
    libhidltransport \
    libhidltransport.vendor \
    libhwbinder \
    libhwbinder.vendor

# init
    $(LOCAL_PATH)/rootdir/etc/init.asus.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/hw/init.asus.rc

# Keymaster
PRODUCT_PACKAGES += \
    android.hardware.keymaster@4.1.vendor \
    android.hardware.security.keymint-V3-ndk.vendor \
    android.hardware.security.secureclock-V1-ndk.vendor \
    android.hardware.security.sharedsecret-V1-ndk.vendor \
    android.hardware.security.rkp-V3-ndk.vendor \
    android.hardware.gatekeeper@1.0.vendor \
    libkeymaster4_1support.vendor \
    android.hardware.biometrics.fingerprint@2.3-service.asus

# Security Configuration Files
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/security/sec_config:$(TARGET_COPY_OUT_VENDOR)/etc/security/sec_config \
    $(LOCAL_PATH)/configs/security/keymint_policy.xml:$(TARGET_COPY_OUT_VENDOR)/etc/security/keymint_policy.xml

# Lights
PRODUCT_PACKAGES += \
    android.hardware.light@2.0-service.asus

# Media
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/configs/media/media_codecs.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs.xml \
    $(DEVICE_PATH)/configs/media/media_codecs_performance.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_performance.xml \
    $(DEVICE_PATH)/configs/media/media_profiles_V1_0.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_profiles_V1_0.xml

# Neural Networks
PRODUCT_PACKAGES += \
    android.hardware.neuralnetworks@1.3.vendor \
    android.hardware.neuralnetworks-V4-ndk.vendor

# OmniROM Overlays
PRODUCT_ENFORCE_RRO_TARGETS := *

PRODUCT_PACKAGES += \
    OmniFrameworksResOverlay \
    OmniSystemUIOverlay \
    OmniSettingsOverlay \
    AsusFrameworksResOverlay \
    AsusSystemUIOverlay

# Power HAL packages
PRODUCT_PACKAGES += \
    android.hardware.power-service.asus-libperfmgr \
    android.hardware.power-V4-ndk.vendor \
    android.hardware.thermal@2.0-service.qti \
    vendor.qti.hardware.perf@2.2.vendor

# Power configuration files
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/power/powerhint.xml:$(TARGET_COPY_OUT_VENDOR)/etc/powerhint.xml \
    $(LOCAL_PATH)/configs/power/thermal-engine.conf:$(TARGET_COPY_OUT_VENDOR)/etc/thermal-engine.conf

# Thermal Configuration Files
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/thermal/thermal_info_config.json:$(TARGET_COPY_OUT_VENDOR)/etc/thermal_info_config.json \
    $(LOCAL_PATH)/configs/thermal/thermald-devices.conf:$(TARGET_COPY_OUT_VENDOR)/etc/thermald-devices.conf

# Properties
PRODUCT_COMPATIBLE_PROPERTY_OVERRIDE := true

# QMI
PRODUCT_PACKAGES += \
    libjson \
    libqti_vndfwk_detect \
    libqti_vndfwk_detect.vendor \
    libvndfwk_detect_jni.qti \
    libvndfwk_detect_jni.qti.vendor

# RIL
PRODUCT_PACKAGES += \
    android.hardware.radio@1.6.vendor \
    android.hardware.radio.config@1.3.vendor \
    android.hardware.radio.deprecated@1.0.vendor \
    android.hardware.secure_element@1.2.vendor \
    android.hardware.radio-V2-ndk.vendor

# Sensors
PRODUCT_PACKAGES += \
    android.frameworks.sensorservice@1.0.vendor \
    android.hardware.sensors@2.1-service.asus \
    android.hardware.sensors-V2-ndk.vendor \
    libsensorndkbridge

# Sensors Configuration Files
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/sensors/hals.conf:$(TARGET_COPY_OUT_VENDOR)/etc/sensors/hals.conf \
    $(LOCAL_PATH)/configs/sensors/sns_reg_config:$(TARGET_COPY_OUT_VENDOR)/etc/sensors/sns_reg_config \
    $(LOCAL_PATH)/configs/sensors/sensor_def_qcomdev.conf:$(TARGET_COPY_OUT_VENDOR)/etc/sensors/sensor_def_qcomdev.conf

# Telephony
PRODUCT_PACKAGES += \
    ims-ext-common \
    ims_ext_common.xml \
    qti-telephony-hidl-wrapper \
    qti_telephony_hidl_wrapper.xml \
    qti-telephony-utils \
    qti_telephony_utils.xml \
    telephony-ext

PRODUCT_BOOT_JARS += \
    telephony-ext

# Thermal
PRODUCT_PACKAGES += \
    android.hardware.thermal@2.0-service.qti \
    android.hardware.thermal-V1-ndk.vendor

# USB
PRODUCT_PACKAGES += \
    android.hardware.usb@1.3-service-qti \
    android.hardware.usb-V1-ndk.vendor

# Vibrator
PRODUCT_PACKAGES += \
    android.hardware.vibrator@1.3-service.asus \
    android.hardware.vibrator-V2-ndk.vendor

# WiFi
PRODUCT_PACKAGES += \
    android.hardware.wifi@1.0-service \
    android.hardware.wifi-V1-ndk.vendor \
    hostapd \
    libwifi-hal-qcom \
    libwpa_client \
    wpa_supplicant \
    wpa_supplicant.conf

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/wifi/wpa_supplicant_overlay.conf:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/wpa_supplicant_overlay.conf \
    $(LOCAL_PATH)/configs/wifi/p2p_supplicant_overlay.conf:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/p2p_supplicant_overlay.conf \
    $(LOCAL_PATH)/configs/wifi/WCNSS_qcom_cfg.ini:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/WCNSS_qcom_cfg.ini \
    $(LOCAL_PATH)/configs/wifi/wifi_concurrency_cfg.txt:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/wifi_concurrency_cfg.txt

# Inherit the proprietary files
$(call inherit-product, vendor/asus/AI2205/AI2205-vendor.mk)