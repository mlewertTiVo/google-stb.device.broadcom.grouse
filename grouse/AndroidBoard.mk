LOCAL_PATH := $(my-dir)

include $(LOCAL_PATH)/AndroidKernel.mk
include $(LOCAL_PATH)/AndroidPhony.mk

$(call add-radio-file, bootloader.dev.img)
$(call add-radio-file, bootloader.prod.img)

ifneq ($(BCM_DIST_BLIMG_BINS),y)
$(call add-radio-file, gpt.bin)
endif

