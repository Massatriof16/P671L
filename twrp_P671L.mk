#
# Copyright (C) 2024 The Android Open Source Project
# Copyright (C) 2024 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#
DEVICE_PATH := device/itel/P671L
# Inherit from those products. Most specific first.
# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit some common twrp stuff.
$(call inherit-product, vendor/twrp/config/common.mk)


$(call inherit-product, vendor/twrp/config/common.mk)


# Inherit from itel device
$(call inherit-product, device/itel/P671L/device.mk)

PRODUCT_DEVICE := P671L
PRODUCT_NAME := twrp_P671L
PRODUCT_BRAND := itel
PRODUCT_MODEL := P671L
PRODUCT_MANUFACTURER := itel

PRODUCT_GMS_CLIENTID_BASE := android-itel