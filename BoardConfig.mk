#
# Copyright (C) 2015 The CyanogenMod Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Define CANCRO_PATH
CANCRO_PATH := device/xiaomi/cancro

# Board vendor
BOARD_VENDOR := xiaomi

# Releasetools
TARGET_RELEASETOOLS_EXTENSIONS := $(CANCRO_PATH)/releasetools

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := MSM8974
TARGET_NO_BOOTLOADER := true
TARGET_NO_RADIOIMAGE := true

# Platform
TARGET_BOARD_PLATFORM := msm8974
TARGET_BOARD_PLATFORM_GPU := qcom-adreno330

# Architecture
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_SMP := true
TARGET_CPU_VARIANT := krait
USE_CLANG_PLATFORM_BUILD := true

# Common build flags
COMMON_GLOBAL_CFLAGS += -D__ARM_USE_PLD -D__ARM_CACHE_LINE_SIZE=64 -DUSE_RIL_VERSION_10 -DNO_SECURE_DISCARD
COMMON_GLOBAL_CPPFLAGS += -DUSE_RIL_VERSION_10 -DNO_SECURE_DISCARD

# Kernel
BOARD_KERNEL_CMDLINE := console=none vmalloc=340M androidboot.hardware=qcom user_debug=31 msm_rtb.filter=0x37 ehci-hcd.park=3
BOARD_KERNEL_CMDLINE += androidboot.selinux=permissive
BOARD_KERNEL_SEPARATED_DT := true
BOARD_DTBTOOL_ARGS := -2
BOARD_KERNEL_BASE := 0x00000000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_MKBOOTIMG_ARGS := --ramdisk_offset 0x02000000 --tags_offset 0x01E00000
TARGET_KERNEL_SOURCE := kernel/xiaomi/cancro
TARGET_KERNEL_ARCH := arm
TARGET_KERNEL_CONFIG := cancro_custom_defconfig
TARGET_KERNEL_CROSS_COMPILE_PREFIX := arm-linux-androideabi-

# Vendor init
TARGET_UNIFIED_DEVICE := true
TARGET_INIT_VENDOR_LIB := libinit_msm
TARGET_LIBINIT_DEFINES_FILE := $(CANCRO_PATH)/init/init_cancro.cpp

# Board uses QCOM hardware
BOARD_USES_QCOM_HARDWARE := true

# Audio
BOARD_USES_ALSA_AUDIO := true
AUDIO_FEATURE_ENABLED_MULTI_VOICE_SESSIONS := true
USE_CUSTOM_AUDIO_POLICY := 1

# FM radio
TARGET_FM_LEGACY_PATCHLOADER := true

# Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_QCOM := true
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := $(CANCRO_PATH)/bluetooth
QCOM_BT_USE_SMD_TTY := true
BLUETOOTH_HCI_USE_MCT := true
FEATURE_QCRIL_UIM_SAP_SERVER_MODE := true

# Graphics
USE_OPENGL_RENDERER := true
TARGET_USES_C2D_COMPOSITION := true
TARGET_USES_ION := true
OVERRIDE_RS_DRIVER := libRSDriver_adreno.so
VSYNC_EVENT_PHASE_OFFSET_NS := 7500000
SF_VSYNC_EVENT_PHASE_OFFSET_NS := 5000000
MAX_EGL_CACHE_KEY_SIZE := 12*1024
MAX_EGL_CACHE_SIZE := 2048*1024
TARGET_CONTINUOUS_SPLASH_ENABLED := true

# Camera
TARGET_USE_COMPAT_GRALLOC_ALIGN := true
USE_DEVICE_SPECIFIC_CAMERA := true

# Wifi
BOARD_HAS_QCOM_WLAN := true
BOARD_WLAN_DEVICE := qcwcn
BOARD_HOSTAPD_DRIVER := NL80211
BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
WIFI_DRIVER_FW_PATH_AP := "ap"
WIFI_DRIVER_FW_PATH_STA := "sta"
WPA_SUPPLICANT_VERSION := VER_0_8_X
TARGET_PROVIDES_WCNSS_QMI := true
TARGET_USES_QCOM_WCNSS_QMI := true
TARGET_USES_WCNSS_CTRL := true

# Filesystem
BOARD_FLASH_BLOCK_SIZE := 131072
TARGET_USERIMAGES_USE_F2FS := true
TARGET_USERIMAGES_USE_EXT4 := true
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_PERSISTIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_BOOTIMAGE_PARTITION_SIZE := 33554432
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 16777216
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 1342177280
BOARD_USERDATAIMAGE_PARTITION_SIZE := 13610499072
BOARD_CACHEIMAGE_PARTITION_SIZE := 402653184
BOARD_PERSISTIMAGE_PARTITION_SIZE := 16777216

# Recovery
TARGET_RECOVERY_FSTAB := $(CANCRO_PATH)/rootdir/root/fstab.qcom

# Recovery variant
ifneq ($(wildcard bootable/recovery-twrp/Android.mk),)
RECOVERY_VARIANT := twrp
endif

# TWRP flags
ifeq ($(RECOVERY_VARIANT),twrp)
BOARD_HAS_NO_REAL_SDCARD := true
RECOVERY_SDCARD_ON_DATA := true
TW_DEFAULT_BRIGHTNESS := 30
TW_INCLUDE_CRYPTO := true
TW_MAX_BRIGHTNESS := 255
TW_USE_MODEL_HARDWARE_ID_FOR_DEVICE_ID := true
endif

# CM hardware
BOARD_USES_CYANOGEN_HARDWARE = true
BOARD_HARDWARE_CLASS += \
    $(CANCRO_PATH)/cmhw \
    hardware/cyanogen/cmhw

# No old RPC for prop
TARGET_NO_RPC := true

# Lights
TARGET_PROVIDES_LIBLIGHT := true

# ANT+
BOARD_ANT_WIRELESS_DEVICE := "vfs-prerelease"

# Ril
TARGET_RIL_VARIANT := caf

# Simple time service client
BOARD_USES_QC_TIME_SERVICES := true

# Charger
BOARD_CHARGER_ENABLE_SUSPEND := true

# Keymaster
TARGET_KEYMASTER_WAIT_FOR_QSEE := true

# QCOM sepolicy
include device/qcom/sepolicy/sepolicy.mk

# Device specific sepolicy
BOARD_SEPOLICY_DIRS += $(CANCRO_PATH)/sepolicy

# Include if exists
-include vendor/xiaomi/cancro/BoardConfigVendor.mk
