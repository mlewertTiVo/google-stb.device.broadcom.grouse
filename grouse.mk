ifndef LOCAL_PRODUCT_OUT
export LOCAL_PRODUCT_OUT         := grouse
endif

export LOCAL_CFG_PROFILE       ?= default
export LOCAL_DTBO_SUPPORT      := y
ifneq ($(wildcard device/broadcom/grouse-kernel),)
export LOCAL_DEVICE_DTBO_IMAGE ?= grouse-kernel/4.9/dtbo.img
else
export LOCAL_DEVICE_DTBO_IMAGE ?= grouse/dtbo.img
endif

LOCAL_DEVICE_FSTAB               ?= device/broadcom/grouse/fstab/fstab.verity.ab-update.early.bp3:$(TARGET_COPY_OUT_VENDOR)/etc/fstab.bcm
LOCAL_DEVICE_FSTAB               += device/broadcom/grouse/fstab/fstab.verity.ab-update.early.bp3:$(TARGET_COPY_OUT_VENDOR)/etc/fstab.grouse
export LOCAL_DEVICE_FSTAB

ifeq ($(LOCAL_DTBO_SUPPORT),y)
export LOCAL_DEVICE_GPT          := device/broadcom/common/gpts/ab-u.p.conf
export LOCAL_DEVICE_MKBOOTIMG_ARGS := --ramdisk_offset 0x02200000 --header_version 1
else
export LOCAL_DEVICE_GPT          := device/broadcom/common/gpts/ab-u.o.f2fs.conf
endif
export LOCAL_DEVICE_GPT_O_LAYOUT := y

LOCAL_DEVICE_RCS                 ?= device/broadcom/common/rcs/init.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/hw/init.grouse.rc
LOCAL_DEVICE_RCS                 += device/broadcom/common/rcs/ueventd.rc:$(TARGET_COPY_OUT_VENDOR)/ueventd.rc
LOCAL_DEVICE_RCS                 += device/broadcom/grouse/rcs/init.block.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/hw/init.block.rc # block devices

LOCAL_DEVICE_RECOVERY_RCS        ?= device/broadcom/common/rcs/init.recovery.rc:root/init.recovery.grouse.rc
LOCAL_DEVICE_RECOVERY_RCS        += device/broadcom/grouse/rcs/init.block.rc:root/init.recovery.block.rc # block devices

# compile the media codecs for the device.
ifeq ($(HW_HVD_REDUX),y)
LOCAL_DEVICE_MEDIA               := device/broadcom/common/media/media_codecs_with_pip__no_legacy_enc.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs.xml
else
LOCAL_DEVICE_MEDIA               := device/broadcom/common/media/media_codecs_no_legacy_enc.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs.xml
endif

ifeq ($(HW_HVD_REDUX),y)
LOCAL_DEVICE_MEDIA               += device/broadcom/grouse/media/media_codecs_dd_performance.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_performance.xml
else
LOCAL_DEVICE_MEDIA               += device/broadcom/grouse/media/media_codecs_performance.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_performance.xml
endif

LOCAL_DEVICE_MEDIA               += device/broadcom/common/media/media_profiles.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_profiles_V1_0.xml

export LOCAL_DEVICE_MEDIA

export HW_AB_UPDATE_SUPPORT      := y
export LOCAL_DEVICE_OVERLAY      ?= device/broadcom/grouse/overlay
export ANDROID_DEVICE_SUPPORTS_BP3 := y

export LOCAL_DEVICE_AON_GPIO     ?= device/broadcom/grouse/rcs/aon_gpio.cfg:$(TARGET_COPY_OUT_VENDOR)/power/aon_gpio.cfg
export LOCAL_DEVICE_BT_CONFIG    := device/broadcom/grouse/bluetooth/vnd_grouse.usb.txt
export ANDROID_ENABLE_BT         := usb

# common to all grouse devices.
include device/broadcom/grouse/common.mk

# baseline the common support.
$(call inherit-product, device/broadcom/common/bcm.mk)
ifeq ($(LOCAL_DTBO_SUPPORT),y)
$(call inherit-product, build/make/target/product/product_launched_with_p.mk)
else
$(call inherit-product, build/make/target/product/product_launched_with_o_mr1.mk)
endif
PRODUCT_NAME                     := grouse
PRODUCT_MODEL                    := grouse
PRODUCT_BRAND                    := google
PRODUCT_DEVICE                   := grouse

# additional setup per device.
PRODUCT_PROPERTY_OVERRIDES += \
   ro.hardware=grouse \
   \
   ro.opengles.version=196609 \
   ro.v3d.disable_buffer_age=true \
   ro.nx.mma=1 \
   \
   ro.nx.heap.video_secure=80m \
   ro.nx.heap.drv_managed=0m \
   ro.nx.heap.grow=2m \
   ro.nx.heap.shrink=2m \
   ro.nx.heap.gfx=64m \
   \
   ro.nx.capable.cb=1 \
   ro.nx.capable.bg=1 \
   ro.nx.hwc2.tweak.fbcomp=1 \
   ro.sf.lcd_density=320 \
   \
   ro.nx.eth.irq_mode_mask=3:2 \
   \
   ro.com.google.clientidbase=android-broadcom-tv

# last but not least, include device flavor profile.
include device/broadcom/grouse/profiles/${LOCAL_CFG_PROFILE}.mk

TARGET_BOOTLOADER_BOARD_NAME  ?= grouse
