M2181_PREBUILT := device/meizu/prebuilt/m2181
# A/B
$(call inherit-product, $(SRC_TARGET_DIR)/product/virtual_ab_ota.mk)

# Call the proprietary setup
$(call inherit-product, vendor/meizu/m2181/m2181-vendor.mk)

# API
PRODUCT_SHIPPING_API_LEVEL := 30
PRODUCT_TARGET_VNDK_VERSION := $(PRODUCT_SHIPPING_API_LEVEL)

# A/B
AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_system=true \
    POSTINSTALL_PATH_system=system/bin/otapreopt_script \
    FILESYSTEM_TYPE_system=ext4 \
    POSTINSTALL_OPTIONAL_system=true

AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_vendor=true \
    POSTINSTALL_PATH_vendor=bin/checkpoint_gc \
    FILESYSTEM_TYPE_vendor=ext4 \
    POSTINSTALL_OPTIONAL_vendor=true

PRODUCT_PACKAGES += \
    checkpoint_gc \
    otapreopt_script

# Boot control
PRODUCT_PACKAGES += \
    android.hardware.boot@1.1-impl-qti \
    android.hardware.boot@1.1-impl-qti.recovery \
    android.hardware.boot@1.1-service

PRODUCT_PACKAGES_DEBUG += \
    bootctl

# Audio
$(call inherit-product, hardware/qcom-caf/sm8350/audio/configs/lahaina/lahaina.mk)
$(call inherit-product, vendor/qcom/opensource/audio/configs/qssi/qssi.mk)

PRODUCT_COPY_FILES += \
    audio.primary.lahaina \
    sound_trigger.primary.lahaina \
    liba2dpoffload \
    libbatterylistener \
    libcomprcapture \
    libexthwplugin \
    libhdmiedid \
    libhfp \
    libsndmonitor \
    libspkrprot \
    libqcompostprocbundle \
    libqcomvisualizer \
    libqcomvoiceprocessing

# DTB
PRODUCT_COPY_FILES += \
    $(M2181_PREBUILT)/dtb:dtb.img

# HIDL
PRODUCT_PACKAGES += \
    android.hidl.base@1.0 \
    android.hidl.base@1.0.vendor \
    android.hidl.manager@1.0 \
    android.hidl.manager@1.0.vendor

PRODUCT_PACKAGES += \
    libhidltransport \
    libhidltransport.vendor \
    libhwbinder \
    libhwbinder.vendor

# Partitions
PRODUCT_BUILD_SUPER_PARTITION := false
PRODUCT_USE_DYNAMIC_PARTITIONS := true

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)

# USB
$(call inherit-product, vendor/qcom/opensource/usb/vendor_product.mk)

TARGET_HAS_DIAG_ROUTER := true
TARGET_KERNEL_VERSION := 5.4

# Vibrator
$(call inherit-product, vendor/qcom/opensource/vibrator/vibrator-vendor-product.mk)

PRODUCT_PACKAGES += \
    vendor.qti.hardware.vibrator.service.m2181

# Vendor boot modules
PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,$(M2181_PREBUILT)/modules/vendor_boot,$(TARGET_COPY_OUT_VENDOR_RAMDISK)/lib/modules) \
    $(call find-copy-subdir-files,*,$(M2181_PREBUILT)/modules/vendor,$(TARGET_COPY_OUT_VENDOR)/lib/modules)
