#
# Copyright (C) 2022 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

M2181_PREBUILT := device/meizu/prebuilt/m2181

# DTB
PRODUCT_COPY_FILES += $(M2181_PREBUILT)/dtb:dtb.img

# Vendor_boot modules
PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,$(M2181_PREBUILT)/modules/vendor_boot,$(TARGET_COPY_OUT_VENDOR_RAMDISK)/lib/modules)

# Vendor modules
PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,$(M2181_PREBUILT)/modules/vendor,$(TARGET_COPY_OUT_VENDOR)/lib/modules)