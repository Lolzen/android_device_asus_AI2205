/*
 * Copyright (C) 2012 The Android Open Source Project
 * Copyright (C) 2014-2025 The CyanogenMod Project
 * Copyright (C) 2017-2025 The LineageOS Project
 * Copyright (C) 2021-2025 OmniROM Project
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#ifndef _BDROID_BUILDCFG_H
#define _BDROID_BUILDCFG_H

/* ASUS ROG Phone 7 Bluetooth Configuration */

#define BTM_DEF_LOCAL_NAME "ASUS_AI2205"

/* Device class: Gaming Phone (0x0A) + Smart Phone (0x02) */
#define BTA_DM_COD {0x5A, 0x02, 0x0C}

/* Include BLE support */
#define BLE_INCLUDED TRUE
#define BTA_GATT_INCLUDED TRUE
#define SMP_INCLUDED TRUE

/* Enhanced Data Rate support */
#define BTM_SSR_INCLUDED TRUE

/* Sniff mode support */
#define BTM_PWR_MGR_INCLUDED TRUE

/* Android 15 LE Audio Support */
#define BTA_LE_AUDIO_INCLUDED TRUE
#define BTA_CSIP_SET_COORDINATOR_INCLUDED TRUE
#define BTA_BAP_BROADCAST_ASSIST_INCLUDED TRUE
#define BTA_BAP_UNICAST_CLIENT_INCLUDED TRUE
#define BTA_HAP_CLIENT_INCLUDED TRUE
#define BTA_MCP_SERVER_INCLUDED TRUE
#define BTA_VCP_CONTROLLER_INCLUDED TRUE

/* Gaming-specific optimizations */
#define L2CAP_GAMING_OPTIMIZATION TRUE
#define BTM_GAMING_LOW_LATENCY TRUE

/* A2DP codec support */
#define BTA_AV_CO_CP_SCMS_T FALSE
#define BTA_AV_INCLUDED TRUE
#define AVDT_INCLUDED TRUE
#define A2DP_INCLUDED TRUE

/* Codec support */
#define CODEC_SBC_INCLUDED TRUE
#define CODEC_AAC_INCLUDED TRUE
#define CODEC_APTX_INCLUDED TRUE
#define CODEC_APTX_HD_INCLUDED TRUE
#define CODEC_LDAC_INCLUDED TRUE

/* Android 15 Enhanced Codec Support */
#define CODEC_LC3_INCLUDED TRUE
#define CODEC_OPUS_INCLUDED TRUE

/* HID support */
#define BTA_HH_INCLUDED TRUE
#define BTA_HH_ROLE_INCLUDED BTA_HH_ROLE_HID_HOST

/* Gaming controller support */
#define BTA_HH_LE_INCLUDED TRUE
#define HID_HOST_MAX_DEVICES 7
#define HID_HOST_REPAGE_WIN 2

/* PAN support for tethering */
#define PAN_INCLUDED TRUE
#define BNEP_INCLUDED TRUE

/* AVRCP support */
#define BTA_AR_INCLUDED TRUE
#define BTA_AV_SINK_INCLUDED FALSE

/* PBAP support */
#define BTA_PBS_INCLUDED TRUE
#define BTA_PBC_INCLUDED TRUE

/* OPP support */
#define BTA_OP_INCLUDED TRUE
#define BTA_OPS_INCLUDED TRUE
#define BTA_OPC_INCLUDED TRUE

/* MAP support */
#define BTA_MSE_INCLUDED TRUE
#define BTA_MCE_INCLUDED TRUE

/* DUN support (for modem functionality) */
#define BTA_DG_INCLUDED TRUE

/* Enhanced security */
#define BTM_SEC_FORCE_RNR TRUE
#define BTM_OOB_INCLUDED TRUE

/* Enhanced L2CAP features */
#define L2CAP_ENHANCED_FEATURES TRUE
#define L2CAP_EXTFEA_SUPPORTED_MASK (L2CAP_EXTFEA_ENH_RETRANS | L2CAP_EXTFEA_STREAM_MODE | L2CAP_EXTFEA_NO_CRC | L2CAP_EXTFEA_EXT_FLOW_SPEC)

/* Vendor specific */
#define BTM_WBS_INCLUDED TRUE
#define BTIF_HF_WBS_PREFERRED TRUE

/* Multi-advertising support */
#define BLE_MULTI_ADV_INCLUDED TRUE
#define BTA_BLE_MULTI_ADV_MAX 4

/* Privacy support */
#define BLE_PRIVACY_SPT TRUE
#define BTM_BLE_PRIVACY_SPT TRUE

/* Connection interval optimization for gaming */
#define BTM_BLE_CONN_INT_MIN_DEF 6   /* 7.5ms */
#define BTM_BLE_CONN_INT_MAX_DEF 8   /* 10ms */
#define BTM_BLE_CONN_INT_MIN_LIMIT 6
#define BTM_BLE_CONN_INT_MAX_LIMIT 3200

/* Gaming latency optimizations */
#define BTM_BLE_CONN_LATENCY_DEF 0
#define BTM_BLE_CONN_SUP_TOUT_DEF 2000   /* 20 seconds */

/* Enhanced ATT MTU for better gaming performance */
#define GATT_MAX_MTU_SIZE 517
#define BTA_GATT_MAX_CLCB_PER_LINK 4

/* Power management for gaming */
#define BTM_PM_SDP_SNIFF_MAX 0
#define BTM_PM_SDP_SNIFF_MIN 0
#define BTM_PM_SDP_SNIFF_ATTEMPT 1
#define BTM_PM_SDP_SNIFF_TIMEOUT 1

/* ASUS ROG Gaming specific features */
#define ASUS_ROG_BT_GAMING_MODE TRUE
#define ASUS_ROG_BT_AURA_SYNC TRUE

/* Qualcomm specific features */
#define BT_SOC_TYPE_HASTINGS TRUE
#define QCOM_BSP TRUE

/* Android 15 specific features */
#define BTA_BLE_ADV_DATA_LEN_MAX 251
#define BTA_BLE_SCAN_RSP_DATA_LEN_MAX 251
#define BLE_INCLUDED TRUE
#define BTA_GATT_INCLUDED TRUE
#define SMP_INCLUDED TRUE

/* LE Audio Broadcast support */
#define BTA_BAP_BROADCAST_SOURCE_INCLUDED TRUE
#define BTA_BAP_SCAN_DELEGATOR_INCLUDED TRUE

/* Enhanced security for Android 15 */
#define BTM_BLE_RESOLV_ADDR_INTERLEAVE_TIMEOUT 150
#define SMP_LE_SC_INCLUDED TRUE
#define SMP_LE_SC_OOB_INCLUDED TRUE

/* ROG Phone 7 Hardware specific */
#define UART_TARGET_BAUD_RATE 3000000
#define FW_AUTO_DETECTION TRUE

/* Buffer sizes for enhanced performance */
#define L2CAP_MTU_SIZE 1691
#define L2CAP_FCR_RX_BUF_SIZE 10240
#define L2CAP_FCR_TX_BUF_SIZE 10240

/* Enhanced HCI buffer management */
#define BTM_ACL_BUF_SIZE 1021
#define L2CAP_FCR_ERTM_MPS_SIZE 1010

/* Gaming controller optimization */
#define HID_DEV_MTU_SIZE 64
#define HID_DEV_FLUSH_TO 0xFFFF

/* Mesh networking support (Android 15) */
#define BTA_MESH_INCLUDED TRUE

#endif /* _BDROID_BUILDCFG_H */