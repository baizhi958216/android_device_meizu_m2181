#
# Copyright (C) 2022 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

LOCAL_PATH := $(call my-dir)

ifeq ($(TARGET_DEVICE),m2181)
include $(call all-makefiles-under,$(LOCAL_PATH))
include $(CLEAR_VARS)

# Symlink wlan needed (meizu)
CLDROOT_FIRMWARE_SYMLINKS := $(TARGET_OUT_VENDOR)/firmware/wlan/qca_cld/
QCA6390_FIRMWARE_SYMLINKS := $(TARGET_OUT_VENDOR)/firmware/wlan/qca_cld/qca6390/
QCA6750_FIRMWARE_SYMLINKS := $(TARGET_OUT_VENDOR)/firmware/wlan/qca_cld/qca6750/
CLDWLAN_FIRMWARE_SYMLINKS := $(TARGET_OUT_VENDOR)/firmware/wlan/qca_cld/wlan/
$(CLDROOT_FIRMWARE_SYMLINKS): $(LOCAL_INSTALLED_MODULE)
	@echo "Creating cld root firmware symlinks: $@"
	mkdir -p $@
	$(hide) ln -sf /vendor/etc/wifi/WCNSS_qcom_cfg.ini $@/WCNSS_qcom_cfg.ini

$(QCA6390_FIRMWARE_SYMLINKS): $(LOCAL_INSTALLED_MODULE)
	@echo "Creating cld qca6390 firmware symlinks: $@"
	mkdir -p $@
	$(hide) ln -sf /vendor/etc/wifi/qca6390/WCNSS_qcom_cfg.ini $@/WCNSS_qcom_cfg.ini
	$(hide) ln -sf /mnt/vendor/persist/qca6390/wlan_mac.bin $@/wlan_mac.bin

$(QCA6750_FIRMWARE_SYMLINKS): $(LOCAL_INSTALLED_MODULE)
	@echo "Creating cld qca6750 firmware symlinks: $@"
	mkdir -p $@
	$(hide) ln -sf /vendor/etc/wifi/qca6750/WCNSS_qcom_cfg.ini $@/WCNSS_qcom_cfg.ini
	$(hide) ln -sf /mnt/vendor/persist/qca6750/wlan_mac.bin $@/wlan_mac.bin

$(CLDWLAN_FIRMWARE_SYMLINKS): $(LOCAL_INSTALLED_MODULE)
	@echo "Creating cld wlan firmware symlinks: $@"
	mkdir -p $@
	$(hide) ln -sf /vendor/etc/wifi/wlan/WCNSS_qcom_cfg.ini $@/WCNSS_qcom_cfg.ini
	$(hide) ln -sf /mnt/vendor/persist/wlan/wlan_mac.bin $@/wlan_mac.bin

ALL_DEFAULT_INSTALLED_MODULES += $(CLDROOT_FIRMWARE_SYMLINKS) $(QCA6390_FIRMWARE_SYMLINKS) $(QCA6750_FIRMWARE_SYMLINKS) $(CLDWLAN_FIRMWARE_SYMLINKS)

endif