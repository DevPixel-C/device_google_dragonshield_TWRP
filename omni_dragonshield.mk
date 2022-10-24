#
# Copyright (C) 2022 The Android Open Source Project
# Copyright (C) 2022 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit some common Omni stuff.
$(call inherit-product, vendor/omni/config/common.mk)

# Inherit from dragonshield device
$(call inherit-product, device/google/dragonshield/device.mk)

PRODUCT_DEVICE := dragonshield
PRODUCT_NAME := omni_dragonshield
PRODUCT_BRAND := Google
PRODUCT_MODEL := Pixel C
PRODUCT_MANUFACTURER := google

PRODUCT_GMS_CLIENTID_BASE := android-nvidia

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRIVATE_BUILD_DESC="lineage_dragonshield-userdebug 11 RQ3A.211001.001 eng.aclegg.20221024.031611 test-keys"

BUILD_FINGERPRINT := NVIDIA/foster_e/foster:9/PPR1.180610.011/4199437_1739.5219:user/release-keys
