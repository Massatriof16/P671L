#
# Copyright (C) 2024 The Android Open Source Project
# Copyright (C) 2024 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#
DEVICE_PATH := device/itel/P671L


# For building with minimal manifest

# Build Hack
BUILD_BROKEN_DUP_RULES := true

# Building with minimal manifest
ALLOW_MISSING_DEPENDENCIES := true

TW_LOAD_VENDOR_MODULES := "omnivision_td4160.ko chipone_icnl99xx.ko adaptive-ts.ko"



# A/B
# A/B support
AB_OTA_UPDATER := true
AB_OTA_PARTITIONS += \
    boot \
    dtbo \
    system \
    product \
    vendor \
    odm \
    odm_dlkm \
    vbmeta \
    vendor_boot \
    vendor_dlkm \
    vbmeta_system \
    vbmeta_vendor


# Assert
TARGET_OTA_ASSERT_DEVICE := itel-P671L


# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 := 
TARGET_CPU_VARIANT := generic
TARGET_CPU_VARIANT_RUNTIME := cortex-a75

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv7-a-neon
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := generic
TARGET_2ND_CPU_VARIANT_RUNTIME := cortex-a55

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := itel-P671L


# Kernel

TARGET_NO_KERNEL := true
BOARD_RAMDISK_USE_LZ4 := true
BOARD_KERNEL_SEPARATED_DTBO := true



# Display
TARGET_SCREEN_DENSITY := 320

BOARD_KERNEL_BASE := 0x00000000
BOARD_VENDOR_BASE := 0x00000000
BOARD_PAGE_SIZE := 4096
BOARD_KERNEL_OFFSET := 0x00008000
BOARD_RAMDISK_OFFSET := 0x05400000
BOARD_TAGS_OFFSET := 0x00000100
BOARD_BOOT_HEADER_VERSION := 4
BOARD_DTB_SIZE := 122678
BOARD_DTB_OFFSET := 0x01f00000
BOARD_HEADER_SIZE := 2128
BOARD_VENDOR_CMDLINE := console=ttyS1,115200n8 
#BOARD_KERNEL_CMDLINE := androidboot.selinux=permissive

BOARD_MKBOOTIMG_ARGS += --dtb $(TARGET_PREBUILT_DTB)
BOARD_MKBOOTIMG_ARGS += --vendor_cmdline $(BOARD_VENDOR_CMDLINE)
BOARD_MKBOOTIMG_ARGS += --pagesize $(BOARD_PAGE_SIZE) --board ""
BOARD_MKBOOTIMG_ARGS += --kernel_offset $(BOARD_KERNEL_OFFSET)
BOARD_MKBOOTIMG_ARGS += --ramdisk_offset $(BOARD_RAMDISK_OFFSET)
BOARD_MKBOOTIMG_ARGS += --tags_offset $(BOARD_TAGS_OFFSET)
BOARD_MKBOOTIMG_ARGS += --header_version $(BOARD_BOOT_HEADER_VERSION)
BOARD_MKBOOTIMG_ARGS += --dtb_offset $(BOARD_DTB_OFFSET)


# Partitions

BOARD_FLASH_BLOCK_SIZE := 262144 # (BOARD_KERNEL_PAGESIZE * 64)
BOARD_VENDOR_BOOTIMAGE_PARTITION_SIZE := 104857600
BOARD_HAS_LARGE_FILESYSTEM := true
TARGET_COPY_OUT_VENDOR := vendor

BOARD_SYSTEMIMAGE_PARTITION_TYPE := ext4
BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := f2fs
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true



BOARD_SUPER_PARTITION_SIZE :=9126805504
BOARD_SUPER_PARTITION_GROUPS := itel_dynamic_partitions
BOARD_ITEL_DYNAMIC_PARTITIONS_PARTITION_LIST := system system_ext vendor product vendor_dlkm 
BOARD_ITEL_DYNAMIC_PARTITIONS_SIZE :=9122611200



# DTB and dtb
TARGET_PREBUILT_DTB := $(DEVICE_PATH)/prebuilt/dtb.img

# Verified Boot
BOARD_AVB_ENABLE := true
BOARD_AVB_RECOVERY_ALGORITHM := SHA256_RSA4096
BOARD_AVB_RECOVERY_KEY_PATH := external/avb/test/data/testkey_rsa4096.pem
BOARD_AVB_ROLLBACK_INDEX := $(PLATFORM_SECURITY_PATCH_TIMESTAMP)
BOARD_AVB_MAKE_VBMETA_IMAGE_ARGS += --set_hashtree_disabled_flag
BOARD_AVB_MAKE_VBMETA_IMAGE_ARGS += --flags 3
BOARD_AVB_RECOVERY_ROLLBACK_INDEX := 1
BOARD_AVB_RECOVERY_ROLLBACK_INDEX_LOCATION := 1


# Platform
BOARD_USES_SPRD_HARDWARE := true
TARGET_BOARD_PLATFORM := ums9230

BOARD_SUPPRESS_SECURE_ERASE := true

# Recovery
TARGET_NO_RECOVERY := true
TARGET_RECOVERY_PIXEL_FORMAT := RGBX_8888
BOARD_MOVE_RECOVERY_RESOURCES_TO_VENDOR_BOOT := true
BOARD_INCLUDE_RECOVERY_RAMDISK_IN_VENDOR_BOOT := true
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/recovery.fstab

#TW_INCLUDE_CRYPTO := true
#TW_INCLUDE_CRYPTO_FBE := true
#BOARD_USES_METADATA_PARTITION := true
#TW_USE_FSCRYPT_POLICY := 2

# Hack: prevent anti rollback

# Hack: prevent anti rollback
PLATFORM_SECURITY_PATCH := 2099-12-31
VENDOR_SECURITY_PATCH := 2099-12-31
PLATFORM_VERSION := 16.1.0

# Temp
#TW_CUSTOM_CPU_TEMP_PATH := /sys/devices/virtual/thermal/thermal_zone16/temp


TW_BRIGHTNESS_PATH := "/sys/class/backlight/sprd_backlight/brightness"
TW_MAX_BRIGHTNESS := 4095
TW_DEFAULT_BRIGHTNESS := 1200

# TWRP Configuration
TW_THEME := portrait_hdpi
TW_EXTRA_LANGUAGES := false
TW_SCREEN_BLANK_ON_BOOT := true
TW_INPUT_BLACKLIST := "hbtp_vm"
TW_USE_TOOLBOX := true
TW_INCLUDE_REPACKTOOLS := true
TW_HAS_NO_RECOVERY_PARTITION := true
TW_EXCLUDE_APEX := true
TW_EXCLUDE_DEFAULT_USB_INIT := true

#Brightness
TW_DEFAULT_BRIGHTNESS := 1400
TW_MAX_BRIGHTNESS := 2048


#additional lib for fix decryption
TW_RECOVERY_ADDITIONAL_RELINK_LIBRARY_FILES += \
    $(TARGET_OUT_SHARED_LIBRARIES)/libtrusty \
    $(TARGET_OUT_VENDOR_SHARED_LIBRARIES)/libtrusty \
    $(TARGET_OUT_SHARED_LIBRARIES)/libgatekeeper \
    $(TARGET_OUT_VENDOR_SHARED_LIBRARIES)/libgatekeeper \
    $(TARGET_OUT_SHARED_LIBRARIES)/android.hardware.security.keymint-V2-ndk \
    $(TARGET_OUT_VENDOR_SHARED_LIBRARIES)/android.hardware.security.keymint-V2-ndk \
    $(TARGET_OUT_SHARED_LIBRARIES)/android.hardware.security.secureclock-V1-ndk \
    $(TARGET_OUT_VENDOR_SHARED_LIBRARIES)/android.hardware.security.secureclock-V1-ndk  \
    $(TARGET_OUT_SHARED_LIBRARIES)/android.hardware.security.sharedsecret-V1-ndk \
    $(TARGET_OUT_VENDOR_SHARED_LIBRARIES)/android.hardware.security.sharedsecret-V1-ndk  \
    $(TARGET_OUT_SHARED_LIBRARIES)/lib_android_keymaster_keymint_utils \
    $(TARGET_OUT_VENDOR_SHARED_LIBRARIES)/lib_android_keymaster_keymint_utils  \
    $(TARGET_OUT_SHARED_LIBRARIES)/libkeymint \
    $(TARGET_OUT_VENDOR_SHARED_LIBRARIES)/libkeymint  \
    $(TARGET_OUT_SHARED_LIBRARIES)/libkeymaster_messages \
    $(TARGET_OUT_VENDOR_SHARED_LIBRARIES)/libkeymaster_messages \
    $(TARGET_OUT_SHARED_LIBRARIES)/android.hardware.gatekeeper@1.0 \
    $(TARGET_OUT_VENDOR_SHARED_LIBRARIES)/android.hardware.gatekeeper@1.0 \
    $(TARGET_OUT_SHARED_LIBRARIES)/libcppbor_external \
    $(TARGET_OUT_VENDOR_SHARED_LIBRARIES)/libcppbor_external \
    $(TARGET_OUT_SHARED_LIBRARIES)/libkeymaster_messages \
    $(TARGET_OUT_VENDOR_SHARED_LIBRARIES)/libkeymaster_messages \
    $(TARGET_OUT_SHARED_LIBRARIES)/libkeymaster_portable \
    $(TARGET_OUT_VENDOR_SHARED_LIBRARIES)/libkeymaster_portable \
    $(TARGET_OUT_SHARED_LIBRARIES)/libpuresoftkeymasterdevice \
    $(TARGET_OUT_VENDOR_SHARED_LIBRARIES)/libpuresoftkeymasterdevice \
    $(TARGET_OUT_SHARED_LIBRARIES)/libcppcose_rkp \
    $(TARGET_OUT_VENDOR_SHARED_LIBRARIES)/libcppcose_rkp \
$(TARGET_OUT_SHARED_LIBRARIES)/libsoft_attestation_cert \
    $(TARGET_OUT_VENDOR_SHARED_LIBRARIES)/libsoft_attestation_cert \
    $(TARGET_OUT_SHARED_LIBRARIES)/libgatekeeper.so \
    $(TARGET_OUT_VENDOR_SHARED_LIBRARIES)/libgatekeeper.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/android.hardware.security.keymint-V2-ndk.so \
    $(TARGET_OUT_VENDOR_SHARED_LIBRARIES)/android.hardware.security.keymint-V2-ndk.so\
$(TARGET_OUT_SHARED_LIBRARIES)/android.hardware.security.sharedsecret-V1-ndk.so \
    $(TARGET_OUT_VENDOR_SHARED_LIBRARIES)/android.hardware.security.sharedsecret-V1-ndk.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/android.hardware.security.secureclock-V1-ndk.so \
    $(TARGET_OUT_VENDOR_SHARED_LIBRARIES)/android.hardware.security.secureclock-V1-ndk.so \
  $(TARGET_OUT_SHARED_LIBRARIES)/lib_android_keymaster_keymint_utils.so \
    $(TARGET_OUT_VENDOR_SHARED_LIBRARIES)/lib_android_keymaster_keymint_utils.so  \
     $(TARGET_OUT_SHARED_LIBRARIES)/libkeymint.so \
    $(TARGET_OUT_VENDOR_SHARED_LIBRARIES)/libkeymint.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libkeymaster_messages.so \
    $(TARGET_OUT_VENDOR_SHARED_LIBRARIES)/libkeymaster_messages.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/android.hardware.gatekeeper@1.0.so \
    $(TARGET_OUT_VENDOR_SHARED_LIBRARIES)/android.hardware.gatekeeper@1.0.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libcppbor_external.so \
    $(TARGET_OUT_VENDOR_SHARED_LIBRARIES)/libcppbor_external.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libkeymaster_messages.so \
    $(TARGET_OUT_VENDOR_SHARED_LIBRARIES)/libkeymaster_messages.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libkeymaster_portable.so \
    $(TARGET_OUT_VENDOR_SHARED_LIBRARIES)/libkeymaster_portable.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libpuresoftkeymasterdevice.so \
    $(TARGET_OUT_VENDOR_SHARED_LIBRARIES)/libpuresoftkeymasterdevice.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libcppcose_rkp.so \
    $(TARGET_OUT_VENDOR_SHARED_LIBRARIES)/libcppcose_rkp.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libsoft_attestation_cert.so \
    $(TARGET_OUT_VENDOR_SHARED_LIBRARIES)/libsoft_attestation_cert.so \
