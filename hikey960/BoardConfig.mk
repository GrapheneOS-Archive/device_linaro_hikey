include device/linaro/hikey/BoardConfigCommon.mk

TARGET_BOOTLOADER_BOARD_NAME := hikey960
TARGET_BOARD_PLATFORM := hikey960

TARGET_CPU_VARIANT := cortex-a73
TARGET_2ND_CPU_VARIANT := cortex-a73

TARGET_NO_DTIMAGE := false

BOARD_KERNEL_CMDLINE := androidboot.hardware=hikey960
BOARD_KERNEL_CMDLINE += firmware_class.path=/vendor/firmware loglevel=15 efi=noruntime

ifeq ($(TARGET_BUILTIN_EDID), true)
BOARD_KERNEL_CMDLINE += drm_kms_helper.edid_firmware=edid/1920x1080.bin
endif

ifneq ($(TARGET_ANDROID_VERITY),)
# Enable dtb fstab for treble, with verity and system-as-root
# NOTE: Disabled by default until b/111829702 is fixed
BOARD_KERNEL_CMDLINE += overlay_mgr.overlay_dt_entry=hardware_cfg_enable_android_fstab_v2
BOARD_KERNEL_CMDLINE += rootwait ro init=/init root=/dev/dm-0
BOARD_KERNEL_CMDLINE += dm=\"system none ro,0 1 android-verity 8:58\"
BOARD_BUILD_SYSTEM_ROOT_IMAGE := true
else
# Enable dtb fstab for treble
BOARD_KERNEL_CMDLINE += overlay_mgr.overlay_dt_entry=hardware_cfg_enable_android_fstab
endif

ifneq ($(TARGET_SENSOR_MEZZANINE),)
BOARD_KERNEL_CMDLINE += overlay_mgr.overlay_dt_entry=hardware_cfg_$(TARGET_SENSOR_MEZZANINE)
endif
BOARD_MKBOOTIMG_ARGS := --base 0x0 --tags_offset 0x07a00000 --kernel_offset 0x00080000 --ramdisk_offset 0x07c00000

BOARD_SYSTEMIMAGE_PARTITION_SIZE := 4915724288    # 4688MB
BOARD_USERDATAIMAGE_PARTITION_SIZE := 25845301248 # 24648MB
BOARD_FLASH_BLOCK_SIZE := 512

# Vendor partition definitions
TARGET_COPY_OUT_VENDOR := vendor
BOARD_VENDORIMAGE_PARTITION_SIZE := 822083584     # 784MB
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_VENDORIMAGE_JOURNAL_SIZE := 0
BOARD_VENDORIMAGE_EXTFS_INODE_COUNT := 2048
