# Release name
PRODUCT_RELEASE_NAME := AI2205

# Inherit from the common Open Source product configuration
$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base_telephony.mk)

# Inherit from our custom product configuration
$(call inherit-product, vendor/omni/config/common.mk)

# Inherit from AI2205 device
$(call inherit-product, device/asus/AI2205/device.mk)

# Device identifier
PRODUCT_DEVICE := AI2205
PRODUCT_NAME := omni_AI2205
PRODUCT_BRAND := asus
PRODUCT_MODEL := ASUS_AI2205
PRODUCT_MANUFACTURER := asus

# OmniROM specific properties
PRODUCT_BUILD_PROP_OVERRIDES += \
    TARGET_DEVICE=AI2205 \
    PRODUCT_NAME=WW_AI2205 \
    PRIVATE_BUILD_DESC="WW_AI2205-user 15 AP1A.240405.002 35.0804.2060.65 release-keys"

BUILD_FINGERPRINT := asus/WW_AI2205/ASUS_AI2205:15/AP1A.240405.002/35.0804.2060.65:user/release-keys

# OmniROM version info
TARGET_VENDOR := asus