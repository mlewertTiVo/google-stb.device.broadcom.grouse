# kernel command line.
KERNEL_CMDLINE      := mem=1476m@0m mem=564m@1484m
KERNEL_CMDLINE      += bmem=521m@1502m
KERNEL_CMDLINE      += brcm_cma=576m@900m
KERNEL_CMDLINE      += ramoops.mem_address=0x5C400000 ramoops.mem_size=0x100000 ramoops.console_size=0x100000
KERNEL_CMDLINE      += rootwait init=/init ro
export LOCAL_DEVICE_KERNEL_CMDLINE ?= ${KERNEL_CMDLINE}

# profile specific properties settings (heap match bmem regions).
PRODUCT_PROPERTY_OVERRIDES += \
   ro.nx.heap.main=112m \
   ro.nx.dolby.ms=12

