#
# Copyright (C) 2022 The Android Open Source Project
# Copyright (C) 2022 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/google/dragonshield

# For building with minimal manifest
ALLOW_MISSING_DEPENDENCIES := true

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 := 
TARGET_CPU_VARIANT := generic
TARGET_CPU_VARIANT_RUNTIME := cortex-a53

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv7-a-neon
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := generic
TARGET_2ND_CPU_VARIANT_RUNTIME := cortex-a53

# APEX
OVERRIDE_TARGET_FLATTEN_APEX := true

# Bootloader
TARGET_NO_BOOTLOADER := true

# Kernel
BOARD_BOOTIMG_HEADER_VERSION := 1
BOARD_KERNEL_BASE := 0x10000000
BOARD_KERNEL_CMDLINE := buildvariant=userdebug
BOARD_KERNEL_PAGESIZE := 2048
BOARD_RAMDISK_OFFSET := 0x01000000
BOARD_KERNEL_TAGS_OFFSET := 0x00000100
BOARD_MKBOOTIMG_ARGS += --header_version $(BOARD_BOOTIMG_HEADER_VERSION)
BOARD_MKBOOTIMG_ARGS += --ramdisk_offset $(BOARD_RAMDISK_OFFSET)
BOARD_MKBOOTIMG_ARGS += --tags_offset $(BOARD_KERNEL_TAGS_OFFSET)
BOARD_KERNEL_IMAGE_NAME := Image
TARGET_KERNEL_CONFIG := dragonshield_defconfig
TARGET_KERNEL_SOURCE := kernel/google/dragonshield

# Kernel - prebuilt
TARGET_FORCE_PREBUILT_KERNEL := true
ifeq ($(TARGET_FORCE_PREBUILT_KERNEL),true)
TARGET_PREBUILT_KERNEL := $(DEVICE_PATH)/prebuilt/kernel
endif

# Partitions
BOARD_BUILD_SYSTEM_ROOT_IMAGE := true
BOARD_FLASH_BLOCK_SIZE := 131072 # (BOARD_KERNEL_PAGESIZE * 64)
BOARD_BOOTIMAGE_PARTITION_SIZE := 33554432
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 33554432
BOARD_HAS_LARGE_FILESYSTEM := true
BOARD_SYSTEMIMAGE_PARTITION_TYPE := ext4
BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4
TARGET_COPY_OUT_VENDOR := vendor

# Platform
TARGET_BOARD_PLATFORM := tegra

# TWRP Configuration

# TWRP settings
RECOVERY_VARIANT := twrp
TW_THEME := landscape_hdpi
TW_NO_SCREEN_TIMEOUT := true
TW_INCLUDE_MTP := true
BOARD_HAS_NO_REAL_SDCARD := true
RECOVERY_SDCARD_ON_DATA := true
TW_CUSTOM_BATTERY_PATH := /sys/class/power_supply/bq27742-0
TW_INCLUDE_CRYPTO := true
TARGET_RECOVERY_DEVICE_MODULES := fwtool
TW_INCLUDE_NTFS_3G := true
#TW_EXTRA_LANGUAGES := true


# Recovery
#TARGET_RECOVERY_PIXEL_FORMAT := BGRA_8888
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true

# Security patch level
VENDOR_SECURITY_PATCH := 2021-08-01

# Hack: prevent anti rollback
PLATFORM_SECURITY_PATCH := 2099-12-31
VENDOR_SECURITY_PATCH := 2099-12-31
PLATFORM_VERSION := 16.1.0

# Debug
TARGET_USES_LOGD := true
# include Logcat daemon for help in debugging
TWRP_INCLUDE_LOGCAT := true
TWRP_EVENT_LOGGING := false

# Set the path to the sysfs entry which controls the brightness
TW_BRIGHTNESS_PATH := /sys/class/backlight/lpm102a188a-backlight/brightness

# Max brightness to prevent display damage
TW_MAX_BRIGHTNESS := 255

# Default brightness for TWRP
TW_DEFAULT_BRIGHTNESS := 150

# Disable/enable SELinux. Only suggested when you want to enable SELinux support
#TWHAVE_SELINUX := true

# Set the default language, if not english
TW_DEFAULT_LANGUAGE := en

# disables things like sdcard partitioning and may save you some space if TWRP isn't fitting in your recovery patition
#BOARD_HAS_NO_REAL_SDCARD := true

#BOARD_HAS_SDCARD_INTERNAL := true

# TWRP specific build flags
#RECOVERY_VARIANT := twrp
#RECOVERY_SDCARD_ON_DATA := true
#TARGET_RECOVERY_PIXEL_FORMAT := ABGR_8888
#TARGET_RECOVERY_PIXEL_FORMAT := RGBA_8888
#TARGET_RECOVERY_PIXEL_FORMAT := RGBX_8888
TARGET_RECOVERY_PIXEL_FORMAT := BGRA_8888
#TARGET_RECOVERY_FORCE_PIXEL_FORMAT := "RGB_565"
#BOARD_HAS_NO_SELECT_BUTTON := true
#BOARD_TOUCH_RECOVERY :=
#BOARD_RECOVERY_SWIPE := true
#BOARD_SUPPRESS_SECURE_ERASE := true
#TW_USE_NEW_MINADBD := true
#TW_USE_TOOLBOX := true

#TW_INCLUDE_LOGICAL := product odm
TW_EXTRA_LANGUAGES := false
TW_SCREEN_BLANK_ON_BOOT := false
TW_INPUT_BLACKLIST := "hbtp_vm"
TW_DEVICE_VERSION := $(shell date '+%Y%m%d-%H%M%S') by Eliminater74

TW_OEM_BUILD := true
#TW_DISABLE_TTF := true

### TW NO'S ###
TW_NO_SCREEN_TIMEOUT := true
#TW_NO_HAPTICS := true
#TW_NO_LEGACY_PROPS := true
# Disable the battery percentage for devices where it doesn't work properly
#TW_NO_BATT_PERCENT := true
# Remove exFAT formatting binaries
#TW_NO_EXFAT := true

# Decryption support for /data
#TW_INCLUDE_CRYPTO := true
#TW_INCLUDE_CRYPTO_FBE := true
#TW_INCLUDE_FBE_METADATA_DECRYPT := false
#BOARD_USES_METADATA_PARTITION := true

# Tool
#TW_INCLUDE_REPACKTOOLS := true
#TW_INCLUDE_RESETPROP := true
#TW_INCLUDE_LIBRESETPROP :=true
