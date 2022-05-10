#
# Copyright (C) 2022 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

BOARD_VENDOR := meizu

DEVICE_PATH := device/meizu/m2181
M2181_PREBUILT := device/meizu/prebuilt/m2181

# A/B updater.
AB_OTA_UPDATER := true

# A/B updater updatable partitions list. Keep in sync with the partition list
# with "_a" and "_b" variants in the device. Note that the vendor can add more
# more partitions to this list for the bootloader and radio.
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

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := kryo300

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv8-2a
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := cortex-a75

# Kernel
TARGET_KERNEL_ARCH := arm64
TARGET_KERNEL_HEADER_ARCH := arm64
BOARD_BOOT_HEADER_VERSION := 3
BOARD_KERNEL_BASE := 0x00000000
BOARD_KERNEL_CMDLINE := console=ttyMSM0,115200n8 androidboot.hardware=qcom
BOARD_KERNEL_CMDLINE += androidboot.console=ttyMSM0 androidboot.memcg=1
BOARD_KERNEL_CMDLINE += lpm_levels.sleep_disabled=1
BOARD_KERNEL_CMDLINE += msm_rtb.filter=0x237 service_locator.enable=1
BOARD_KERNEL_CMDLINE += androidboot.usbcontroller=a600000.dwc3 swiotlb=0
BOARD_KERNEL_CMDLINE += loop.max_part=7 cgroup.memory=nokmem,nosocket
BOARD_KERNEL_CMDLINE += pcie_ports=compat loop.max_part=7
BOARD_KERNEL_CMDLINE += iptable_raw.raw_before_defrag=1
BOARD_KERNEL_CMDLINE += ip6table_raw.raw_before_defrag=1
BOARD_KERNEL_IMAGE_NAME := kernel
BOARD_KERNEL_PAGESIZE := 4096
BOARD_MKBOOTIMG_ARGS := --header_version $(BOARD_BOOT_HEADER_VERSION)
TARGET_KERNEL_ADDITIONAL_FLAGS := DTC_EXT=$(shell pwd)/prebuilts/misc/linux-x86/dtc/dtc

TARGET_PREBUILT_KERNEL := $(M2181_PREBUILT)/kernel
TARGET_PREBUILT_DTB := $(M2181_PREBUILT)/dtb
BOARD_PREBUILT_DTBOIMAGE := $(M2181_PREBUILT)/dtbo.img
TARGET_FORCE_PREBUILT_KERNEL := true
TARGET_KERNEL_CONFIG := vendor/lahaina_GKI
TARGET_KERNEL_SOURCE := kernel/meizu/sm8350

# HIDL
DEVICE_MATRIX_FILE += $(DEVICE_PATH)/configs/manifests/compatibility_matrix.xml
DEVICE_MANIFEST_FILE += $(DEVICE_PATH)/configs/manifests/manifest_lahaina.xml
DEVICE_FRAMEWORK_COMPATIBILITY_MATRIX_FILE += \
    $(DEVICE_PATH)/vintf/framework_compatibility_matrix.xml \
    vendor/lineage/config/device_framework_matrix.xml

# Partitions
BOARD_SUPER_PARTITION_GROUPS := meizu_dynamic_partitions
BOARD_SUPER_PARTITION_SIZE := 10737418240
BOARD_MEIZU_DYNAMIC_PARTITIONS_PARTITION_LIST := odm system system_ext vendor product
BOARD_MEIZU_DYNAMIC_PARTITIONS_SIZE := 10733223936 # BOARD_SUPER_PARTITION_SIZE - 4MB

BOARD_DTBOIMG_PARTITION_SIZE := 25165824
BOARD_BOOTIMAGE_PARTITION_SIZE := 100663296
BOARD_VENDOR_BOOTIMAGE_PARTITION_SIZE := $(BOARD_BOOTIMAGE_PARTITION_SIZE)

PARTITION_LIST := $(call to-upper, $(BOARD_MEIZU_DYNAMIC_PARTITIONS_PARTITION_LIST))
$(foreach pl, $(PARTITION_LIST), $(eval BOARD_$(pl)IMAGE_FILE_SYSTEM_TYPE := ext4))
$(foreach pl, $(PARTITION_LIST), $(eval TARGET_COPY_OUT_$(pl) := $(call to-lower, $(pl))))

BOARD_FLASH_BLOCK_SIZE := 262144 # (BOARD_KERNEL_PAGESIZE * 64)

BOARD_USES_METADATA_PARTITION := true

# AIDs
TARGET_FS_CONFIG_GEN += $(DEVICE_PATH)/configs/config.fs

# Fstab
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/rootdir/etc/fstab.qcom

# Platform
TARGET_BOARD_PLATFORM := lahaina

# Properties
TARGET_SYSTEM_PROP += $(DEVICE_PATH)/configs/properties/system.prop
TARGET_VENDOR_PROP += $(DEVICE_PATH)/configs/properties/vendor.prop
TARGET_SYSTEM_EXT_PROP += $(DEVICE_PATH)/configs/properties/system_ext.prop
TARGET_ODM_PROP += $(DEVICE_PATH)/configs/properties/odm.prop
TARGET_PRODUCT_PROP += $(DEVICE_PATH)/configs/properties/product.prop

# Recovery
TARGET_NO_RECOVERY := true
BOARD_USES_RECOVERY_AS_BOOT := true

# WiFi
BOARD_WLAN_DEVICE := qcwcn
BOARD_HOSTAPD_DRIVER := NL80211
BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
QC_WIFI_HIDL_FEATURE_DUAL_AP := true
WIFI_DRIVER_DEFAULT := wlan
WIFI_DRIVER_STATE_CTRL_PARAM := "/dev/wlan"
WIFI_DRIVER_STATE_OFF := "OFF"
WIFI_DRIVER_STATE_ON := "ON"
WIFI_HIDL_FEATURE_DUAL_INTERFACE := true
WIFI_HIDL_UNIFIED_SUPPLICANT_SERVICE_RC_ENTRY := true
WPA_SUPPLICANT_VERSION := VER_0_8_X

# Inherit from proprietary files
include vendor/meizu/m2181/BoardConfigVendor.mk