#
# Copyright (C) 2022 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

BOARD_VENDOR := meizu

DEVICE_PATH := device/meizu/m2181
M2181_PREBUILT := device/meizu/prebuilt/m2181

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

# Inherit from proprietary files
include vendor/meizu/m2181/BoardConfigVendor.mk