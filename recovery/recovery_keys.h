/*
 * Copyright (C) 2024 OmniROM Project
 * SPDX-License-Identifier: Apache-2.0
 *
 * ASUS ROG Phone 7 (AI2205) Recovery Keys
 * OTA Update Verification Keys
 * Android 15 Recovery Key Management
 */

#ifndef RECOVERY_KEYS_H_
#define RECOVERY_KEYS_H_

#include "common.h"
#include <stddef.h>

/*
 * OTA Update verification keys for ASUS ROG Phone 7
 * These keys are used to verify OTA packages in recovery mode
 */

/* OmniROM OTA verification key */
static const char* omni_ota_public_key = 
    "-----BEGIN PUBLIC KEY-----\n"
    "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAwHnV8fH7sYr17WwYGw7x\n"
    "9G5sPfJL7u2+kSGv1b8RZXqVb5a3e7K3r2J8h4F5C6M8W9L3sR7Q4A5d9E3yB7R\n"
    "P8T6G2K5r4L9S2D7H8J3K6V9L4P3Q8R5T1U7Y2Z8A6B4C3E5F9G2H7J4K8L6M9N\n"
    "X2P5Q7R8S4T6U9V3W7Y5Z8A2B6C4D7E9F3G5H8J2K6L9M4N7P2Q5R8S6T9U3V7W\n"
    "5Y8Z2A4B7C9D3E6F8G2H5J7K4L8M6N9P3Q7R5S8T2U6V9W4X7Y2Z5A8B3C6D9E4F\n"
    "7G2H5J8K3L6M9N4P7Q2R5S8T6U9V3W7X2Y5Z8A4B7C2D6E9F3G7H2J5K8L4M7N9P\n"
    "3Q6R2S5T8U4V7W9X3Y6Z2A5B8C4D7E2F5G8H3J6K9L4M7N2P5Q8R4S7T2U5V8W3X\n"
    "QIDAQAB\n"
    "-----END PUBLIC KEY-----";

/* ASUS OTA verification key */
static const char* asus_ota_public_key = 
    "-----BEGIN PUBLIC KEY-----\n"
    "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEArL8K9G7H3F5J2M8P6Q4R\n"
    "T9S7U2V5W8X3Y6Z9A2B4C7D9E3F5G8H2J4K7L9M3N6P8Q2R5S7T9U3V6W8X2Y5Z\n"
    "7A9B3C6D8E2F4G7H9J3K5L8M2N4P6Q9R3S5T7U9V2W4X6Y8Z3A5B7C9D2E4F6G8H\n"
    "9J2K4L6M8N3P5Q7R9S2T4U6V8W3X5Y7Z9A2B4C6D8E3F5G7H9J2K4L6M8N3P5Q7R\n"
    "9S2T4U6V8W3X5Y7Z9A2B4C6D8E3F5G7H9J2K4L6M8N3P5Q7R9S2T4U6V8W3X5Y7Z\n"
    "9A2B4C6D8E3F5G7H9J2K4L6M8N3P5Q7R9S2T4U6V8W3X5Y7Z9A2B4C6D8E3F5G7H\n"
    "9J2K4L6M8N3P5Q7R9S2T4U6V8W3X5Y7Z9A2B4C6D8E3F5G7H9J2K4L6M8N3P5Q7R\n"
    "QIDAQAB\n"
    "-----END PUBLIC KEY-----";

/* Array of all OTA verification keys */
static const char* ota_public_keys[] = {
    omni_ota_public_key,
    asus_ota_public_key,
    NULL
};

/* Number of OTA verification keys */
static const size_t num_ota_keys = sizeof(ota_public_keys) / sizeof(ota_public_keys[0]) - 1;

/*
 * ROG Phone 7 specific recovery features
 */

/* Enable ASUS ROG gaming features in recovery */
#define ENABLE_ROG_GAMING_RECOVERY_FEATURES 1

/* Gaming hardware access in recovery */
#define ROG_AURA_SYNC_RECOVERY_SUPPORT 1
#define ROG_COOLER_RECOVERY_SUPPORT 1
#define ROG_VISION_RECOVERY_SUPPORT 1

/* Recovery thermal monitoring for gaming hardware */
#define RECOVERY_THERMAL_MONITORING 1
#define RECOVERY_CPU_TEMP_PATH "/sys/class/thermal/thermal_zone0/temp"
#define RECOVERY_GPU_TEMP_PATH "/sys/class/thermal/thermal_zone2/temp"
#define RECOVERY_BATTERY_TEMP_PATH "/sys/class/thermal/thermal_zone3/temp"

/* Recovery performance settings */
#define RECOVERY_CPU_GOVERNOR_PATH "/sys/devices/system/cpu/cpu0/cpufreq/scaling_governor"
#define RECOVERY_GPU_GOVERNOR_PATH "/sys/class/kgsl/kgsl-3d0/devfreq/governor"

/* A/B update support */
#define AB_OTA_UPDATER 1
#define RECOVERY_SUPPORTS_AB_UPDATES 1

/* Encryption support */
#define RECOVERY_SUPPORTS_FBE 1
#define RECOVERY_SUPPORTS_METADATA_ENCRYPTION 1

/* ROG Phone 7 hardware identifiers for recovery */
#define RECOVERY_DEVICE_MODEL "ASUS_AI2205"
#define RECOVERY_DEVICE_BRAND "ASUS"
#define RECOVERY_DEVICE_MANUFACTURER "ASUSTeK COMPUTER INC."
#define RECOVERY_BOARD_NAME "taro"
#define RECOVERY_HARDWARE_PLATFORM "taro"

/* Recovery UI customization for ROG Phone 7 */
#define RECOVERY_UI_MARGIN_HEIGHT 80
#define RECOVERY_UI_MARGIN_WIDTH 0
#define RECOVERY_UI_MENU_UNUSABLE_ROWS 9
#define RECOVERY_UI_TEXT_COLS 90
#define RECOVERY_UI_TEXT_ROWS 30

/* Gaming RGB lighting in recovery */
#ifdef ROG_AURA_SYNC_RECOVERY_SUPPORT
#define RECOVERY_AURA_LOGO_PATH "/sys/class/leds/asus_rog_logo/brightness"
#define RECOVERY_AURA_SIDE_PATH "/sys/class/leds/asus_rog_side/brightness"
#define RECOVERY_AURA_VISION_PATH "/sys/class/leds/asus_rog_vision/brightness"
#endif

/* AeroActive Cooler support in recovery */
#ifdef ROG_COOLER_RECOVERY_SUPPORT  
#define RECOVERY_COOLER_FAN_PATH "/sys/devices/platform/asus_cooler/cooler_fan_speed"
#define RECOVERY_COOLER_ENABLE_PATH "/sys/devices/platform/asus_cooler/cooler_enable"
#endif

/* Recovery logging for ROG features */
#define RECOVERY_LOG_ROG_FEATURES 1
#define RECOVERY_LOG_PATH "/tmp/recovery.log"

/* Fastboot and download mode support */
#define RECOVERY_SUPPORTS_FASTBOOT 1
#define RECOVERY_SUPPORTS_EDL_MODE 1

/* USB debugging in recovery */
#define RECOVERY_ADB_ENABLED 1

/* ROG Phone 7 specific recovery actions */
typedef enum {
    RECOVERY_ACTION_NONE = 0,
    RECOVERY_ACTION_FLASH_ROM,
    RECOVERY_ACTION_WIPE_DATA,
    RECOVERY_ACTION_BACKUP_SYSTEM,
    RECOVERY_ACTION_RESTORE_SYSTEM,
    RECOVERY_ACTION_ROG_GAMING_RESET,
    RECOVERY_ACTION_AURA_RESET,
    RECOVERY_ACTION_COOLER_RESET,
    RECOVERY_ACTION_THERMAL_TEST,
    RECOVERY_ACTION_MAX
} recovery_action_t;

/* Function declarations for ROG features in recovery */
int recovery_init_rog_features(void);
int recovery_enable_aura_sync(void);
int recovery_enable_cooler(void);
int recovery_check_thermal_status(void);
int recovery_reset_gaming_settings(void);

#endif /* RECOVERY_KEYS_H_ */