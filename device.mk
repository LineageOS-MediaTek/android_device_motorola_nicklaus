#
# Copyright (C) 2018 The LineageOS Project
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
$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/core.mk)
# $(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)

# Inherit from the common Open Source product configuration
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Assert
TARGET_OTA_ASSERT_DEVICE := nicklaus,e4plus

# Overlays
DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay

# Screen Density
PRODUCT_AAPT_CONFIG := normal xhdpi xxhdpi
PRODUCT_AAPT_PREF_CONFIG := xxhdpi

# FMRadio
PRODUCT_PACKAGES += \
    libfmjni \
    FMRadio
    
# Lights
PRODUCT_PACKAGES += \
    lights.mt6737m

# Power
PRODUCT_PACKAGES += \
    power.mt6737m

# Configs
PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,${LOCAL_PATH}/configs,system/vendor/etc)

# Fingerprint
PRODUCT_PACKAGES += \
    fingerprintd

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.fingerprint.xml:system/etc/permissions/android.hardware.fingerprint.xml

# Keyboard layout
PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,${LOCAL_PATH}/configs/keylayouts/keylayout,system/usr/keylayout)

PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,${LOCAL_PATH}/configs/keylayouts/idc,system/usr/idc)

# Ramdisk
PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,${LOCAL_PATH}/rootdir,root)

# Dalvik heap configurations
$(call inherit-product, frameworks/native/build/phone-xhdpi-2048-dalvik-heap.mk)

# Call hwui memory config
$(call inherit-product-if-exists, frameworks/native/build/phone-xxhdpi-2048-hwui-memory.mk)

# Common stuff
$(call inherit-product, device/mediatek/mt6737-common/mt6737.mk)

# Vendor
$(call inherit-product, vendor/motorola/nicklaus/nicklaus-vendor.mk)
