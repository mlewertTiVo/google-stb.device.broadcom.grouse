export LOCAL_PRODUCT_OUT       := grouse
export LOCAL_DEVICE_FULL_TREBLE  := y

LOCAL_DEVICE_FSTAB               := device/broadcom/grouse/fstab/fstab.verity.ab-update.early.bp3.nosd:$(TARGET_COPY_OUT_VENDOR)/etc/fstab.bcm
LOCAL_DEVICE_FSTAB               += device/broadcom/grouse/fstab/fstab.verity.ab-update.early.bp3.nosd:$(TARGET_COPY_OUT_VENDOR)/etc/fstab.grouse
export LOCAL_DEVICE_FSTAB

export LOCAL_DEVICE_GPT          := device/broadcom/common/gpts/ab-u.o.f2fs.conf
export LOCAL_DEVICE_GPT_O_LAYOUT := y

LOCAL_DEVICE_RCS                 := device/broadcom/common/rcs/init.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/hw/init.grouse.rc
LOCAL_DEVICE_RCS                 += device/broadcom/common/rcs/ueventd.rc:$(TARGET_COPY_OUT_VENDOR)/ueventd.rc
LOCAL_DEVICE_RCS                 += device/broadcom/grouse/rcs/init.block.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/hw/init.block.rc # block devices

LOCAL_DEVICE_RECOVERY_RCS        := device/broadcom/common/rcs/init.recovery.rc:root/init.recovery.grouse.rc
LOCAL_DEVICE_RECOVERY_RCS        += device/broadcom/grouse/rcs/init.block.rc:root/init.recovery.block.rc # block devices

# kernel command line.
LOCAL_DEVICE_KERNEL_CMDLINE      := mem=2000m@0m mem=40m@2008m
LOCAL_DEVICE_KERNEL_CMDLINE      += bmem=532m@414m
LOCAL_DEVICE_KERNEL_CMDLINE      += brcm_cma=574m@948m
LOCAL_DEVICE_KERNEL_CMDLINE      += ramoops.mem_address=0x7D000000 ramoops.mem_size=0x800000 ramoops.console_size=0x400000
LOCAL_DEVICE_KERNEL_CMDLINE      += rootwait init=/init ro
export LOCAL_DEVICE_KERNEL_CMDLINE

# compile the media codecs for the device.
LOCAL_DEVICE_MEDIA               := device/broadcom/common/media/media_codecs_no_legacy_enc.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs.xml
LOCAL_DEVICE_MEDIA               += device/broadcom/common/media/media_profiles.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_profiles_V1_0.xml
LOCAL_DEVICE_MEDIA               += device/broadcom/grouse/media_codecs_performance.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_performance.xml
export LOCAL_DEVICE_MEDIA

export HW_AB_UPDATE_SUPPORT      := y
export LOCAL_DEVICE_OVERLAY      := device/broadcom/grouse/overlay
export ANDROID_DEVICE_SUPPORTS_BP3 := y

export LOCAL_DEVICE_AON_GPIO     := device/broadcom/grouse/rcs/aon_gpio.pck.cfg:$(TARGET_COPY_OUT_VENDOR)/power/aon_gpio.cfg
export LOCAL_DEVICE_BT_CONFIG    := device/broadcom/grouse/bluetooth/vnd_grouse.uart.txt
export ANDROID_ENABLE_BT         := n # Disabled for now

# common to all grouse devices.
include device/broadcom/grouse/common.mk

# baseline the common support.
$(call inherit-product, device/broadcom/common/bcm.mk)
#$(call inherit-product, build/make/target/product/product_launched_with_o_mr1.mk)
PRODUCT_SHIPPING_API_LEVEL       := 27
PRODUCT_NAME                     := grousepck
PRODUCT_MODEL                    := grouse
PRODUCT_BRAND                    := google
PRODUCT_DEVICE                   := grouse

# additional setup per device.
PRODUCT_PROPERTY_OVERRIDES += \
   ro.hardware=grouse \
   \
   ro.opengles.version=196609 \
   debug.hwui.render_dirty_regions=false \
   ro.v3d.disable_buffer_age=true \
   ro.nx.mma=1 \
   \
   ro.nx.heap.video_secure=80m \
   ro.nx.heap.main=96m \
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
   ro.com.google.clientidbase=android-grouse-tv

TARGET_BOOTLOADER_BOARD_NAME  := grouse
