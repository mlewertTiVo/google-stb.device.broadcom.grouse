# mandatory device configuration.
export LOCAL_ARM_AARCH64         := y
export LOCAL_ARM_AARCH64_NOT_ABI_COMPATIBLE := y
export NEXUS_PLATFORM            := 97260
export BCHP_VER                  := B0
export PLATFORM                  := 97260

# compile the rc's for the device.
LOCAL_DEVICE_RCS                 += device/broadcom/common/rcs/init.ft.mmu.nx.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/hw/init.nx.rc
LOCAL_DEVICE_RCS                 += device/broadcom/common/rcs/init.fs.verity.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/hw/init.fs.rc   # verity
LOCAL_DEVICE_RCS                 += device/broadcom/grouse/rcs/init.bcm.usb.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/hw/init.bcm.usb.rc # uses 'configfs'
export LOCAL_DEVICE_RCS

LOCAL_DEVICE_RECOVERY_RCS        += device/broadcom/grouse/rcs/init.recovery.usb.rc:root/init.recovery.usb.rc # uses 'configfs'
export LOCAL_DEVICE_RECOVERY_RCS

LOCAL_DEVICE_RECOVERY_FSTAB      := device/broadcom/common/recovery/fstab.ab-update/recovery.fstab
export LOCAL_DEVICE_RECOVERY_FSTAB

# optional device override/addition.
LOCAL_DEVICE_SEPOLICY_BLOCK      := device/broadcom/grouse/sepolicy/block
LOCAL_DEVICE_SEPOLICY_BLOCK      += device/broadcom/grouse/sepolicy/treble
export LOCAL_DEVICE_SEPOLICY_BLOCK
export LOCAL_DEVICE_AON_GPIO     := device/broadcom/grouse/aon_gpio.cfg:$(TARGET_COPY_OUT_VENDOR)/power/aon_gpio.cfg
export LOCAL_DEVICE_KEY_POLL     := device/broadcom/common/keylayout/gpio_keys_polled.kl:system/usr/keylayout/gpio_keys_polled.kl
export LOCAL_DEVICE_BT_CONFIG    := device/broadcom/grouse/bluetooth/vnd_grouse.txt
export LOCAL_DEVICE_USERDATA     := 4294967296  # 4GB.
export LOCAL_DEVICE_USERDATA_FS  := f2fs
export HW_ENCODER_SUPPORT        := n
export BT_RFKILL_SUPPORT         := y
export ANDROID_ENABLE_BT         := usb
export V3D_VARIANT               := vc5
export LOCAL_DEVICE_REFERENCE_BUILD := device/broadcom/grouse/reference_build.mk
export LOCAL_DEVICE_USE_VERITY   := y
export LOCAL_DEVICE_SYSTEM_VERITY_PARTITION := /dev/block/platform/rdb/f0200200.sdhci/by-name/system
export LOCAL_DEVICE_VENDOR_VERITY_PARTITION := /dev/block/platform/rdb/f0200200.sdhci/by-name/vendor

# bootloader firmware manipulation.
export LOCAL_DEVICE_SAGE_DEV_N_PROD := y
export BOLT_IMG_SWAP_BBL            := device/broadcom/grouse/blb/zb/bbl-3.2.0-zb.bin
export BOLT_IMG_SWAP_BFW            := device/broadcom/grouse/blb/zb/bfw-4.4.2-zb.bin

# no legacy decoder (vp8, h263, mpeg4) in hardware 'u'
export HW_HVD_REVISION           := U
# v3d mmu available.
export HW_GPU_MMU_SUPPORT        := y

# enable once the sage ta load problem is solved.
export ANDROID_SUPPORTS_RPMB     := n