# ----------------- BEGIN MIX-IN DEFINITIONS -----------------
# Mix-In definitions are auto-generated by mixin-update
##############################################################
# Source: device/intel/mixins/groups/slot-ab/default/BoardConfig.mk
##############################################################
ifeq (project-celadon,efi)
# Adds edify commands swap_entries and copy_partition for robust
# update of the EFI system partition
TARGET_RECOVERY_UPDATER_LIBS := libupdater_esp
# Extra libraries needed to be rolled into recovery updater
# libgpt_static and libefivar are needed by libupdater_esp
TARGET_RECOVERY_UPDATER_EXTRA_LIBS := libcommon_recovery libgpt_static
ifeq ($(TARGET_SUPPORT_BOOT_OPTION),true)
TARGET_RECOVERY_UPDATER_EXTRA_LIBS += libefivar
endif
endif


BOARD_RECOVERYIMAGE_PARTITION_SIZE ?= 31457280
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_CACHEIMAGE_PARTITION_SIZE ?= 104857600
##############################################################
# Source: device/intel/mixins/groups/boot-arch/project-celadon/BoardConfig.mk
##############################################################


KERNELFLINGER_USE_RPMB_SIMULATE := true

##############################################################
# Source: device/intel/mixins/groups/allow-missing-dependencies/true/BoardConfig.mk
##############################################################
ALLOW_MISSING_DEPENDENCIES := true
##############################################################
# Source: device/intel/mixins/groups/audio/aic/BoardConfig.mk
##############################################################
BOARD_USES_ALSA_AUDIO := true
BOARD_USES_TINY_ALSA_AUDIO := true
BOARD_USES_GENERIC_AUDIO ?= false
USE_CUSTOM_PARAMETER_FRAMEWORK := false
ifneq ($(BOARD_USES_GENERIC_AUDIO), true)
# Audio HAL selection Flag default setting.
#  INTEL_AUDIO_HAL:= audio     -> baseline HAL
#  INTEL_AUDIO_HAL:= audio_pfw -> PFW-based HAL
INTEL_AUDIO_HAL := audio
else
INTEL_AUDIO_HAL := stub
endif

# Use XML audio policy configuration file
USE_XML_AUDIO_POLICY_CONF := 1
# Use configurable audio policy
USE_CONFIGURABLE_AUDIO_POLICY := 0

# Use Baseline Legacy Audio HAL
USE_LEGACY_BASELINE_AUDIO_HAL := true
##############################################################
# Source: device/intel/mixins/groups/cpu-arch/x86_64/BoardConfig.mk
##############################################################
TARGET_CPU_ABI := x86_64
TARGET_ARCH := x86_64
TARGET_ARCH_VARIANT := x86_64
TARGET_PRELINK_MODULE := false

TARGET_2ND_CPU_ABI := x86
TARGET_2ND_ARCH := x86
TARGET_2ND_ARCH_VARIANT := x86

TARGET_USES_64_BIT_BINDER := true
##############################################################
# Source: device/intel/mixins/groups/dexpreopt/true/BoardConfig.mk
##############################################################
# enable dex-preoptimization.
WITH_DEXPREOPT := true
##############################################################
# Source: device/intel/mixins/groups/device-specific/cic/BoardConfig.mk
##############################################################
# The generic product target doesn't have any hardware-specific pieces.
TARGET_NO_BOOTLOADER := true
TARGET_NO_KERNEL := true

# Container related configurations
ANDROID_AS_GUEST := true

TARGET_COPY_OUT_VENDOR := system/vendor
DEVICE_MATRIX_FILE   := $(INTEL_PATH_DEVICE_CIC)/compatibility_matrix.xml
DEVICE_PACKAGE_OVERLAYS += $(INTEL_PATH_DEVICE_CIC)/overlay
BOARD_SEPOLICY_DIRS += \
        build/target/board/generic/sepolicy \
        build/target/board/generic_x86/sepolicy

TARGET_USERIMAGES_USE_EXT4 := true
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 2147483648 # 2 GB
BOARD_USERDATAIMAGE_PARTITION_SIZE := 576716800
BOARD_CACHEIMAGE_PARTITION_SIZE := 69206016
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_FLASH_BLOCK_SIZE := 512
TARGET_USERIMAGES_SPARSE_EXT_DISABLED := true

BOARD_SEPOLICY_DIRS += $(INTEL_PATH_DEVICE_CIC)/sepolicy
##############################################################
# Source: device/intel/mixins/groups/graphics/aic_mdc/BoardConfig.mk
##############################################################
# Build and enable the OpenGL ES View renderer. When running on the emulator,
# the GLES renderer disables itself if host GL acceleration isn't available.
USE_OPENGL_RENDERER := true

# framework switches 
TARGET_USES_HWC2 			:= false
USE_OPENGL_RENDERER 		:= true
TARGET_HARDWARE_3D 			:= true

# global switches to use old gfx stack or master gfx stack
TARGET_USE_INTEL_LIBDRM 	:= true
TARGET_USE_INTEL_MESA 		:= true
TARGET_USE_INTEL_GRALLOC	:= true
TARGET_USE_INTEL_HWCOMPOSER	:= false

# multidroid vhal switches
TARGET_USE_GRALLOC_VHAL		:= false
TARGET_USE_HWCOMPOSER_VHAL	:= true

# components specific switches
ifeq ($(TARGET_USE_INTEL_LIBDRM), true)
TARGET_USE_PRIVATE_LIBDRM := true
LIBDRM_VER ?= intel
else
TARGET_USE_PRIVATE_LIBDRM := false
endif

BOARD_USE_MESA := true
BOARD_GPU_DRIVERS := i965
BOARD_USES_MINIGBM := true
INTEL_MINIGBM := external/minigbm-intel
BOARD_USES_GRALLOC1 := true

ifeq ($(TARGET_USE_INTEL_HWCOMPOSER), true)
BOARD_USES_IA_HWCOMPOSER := true
BOARD_ENABLE_EXPLICIT_SYNC := true
BOARD_CURSOR_WA := true
else
BOARD_USES_IA_HWCOMPOSER := false
BOARD_ENABLE_EXPLICIT_SYNC := false
BOARD_CURSOR_WA := false
endif

ifeq ($(TARGET_USE_INTEL_HWCOMPOSER), true)
  PRODUCT_PACKAGES += libva
endif

TARGET_DONT_USE_NATIVE_FENCE := true

VSYNC_EVENT_PHASE_OFFSET_NS := 7500000
SF_VSYNC_EVENT_PHASE_OFFSET_NS := 5000000
NUM_FRAMEBUFFER_SURFACE_BUFFERS := 3
##############################################################
# Source: device/intel/mixins/groups/wlan/mac80211_hwsim/BoardConfig.mk
##############################################################
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
WPA_SUPPLICANT_VERSION      := VER_0_8_X
WIFI_DRIVER_FW_PATH_PARAM   := "/dev/null"
WIFI_DRIVER_FW_PATH_STA     := "/dev/null"
WIFI_DRIVER_FW_PATH_AP      := "/dev/null"
##############################################################
# Source: device/intel/mixins/groups/houdini/true/BoardConfig.mk
##############################################################
# Install Native Bridge
WITH_NATIVE_BRIDGE := true

# Enable ARM codegen for x86 with Native Bridge
BUILD_ARM_FOR_X86 := true

# Native Bridge ABI List
NB_ABI_LIST_32_BIT := armeabi-v7a armeabi
NB_ABI_LIST_64_BIT := arm64-v8a

# Support 64 Bit Apps
ifeq ($(ENABLE_NATIVEBRIDGE_64BIT),true)
  TARGET_CPU_ABI_LIST_64_BIT ?= $(TARGET_CPU_ABI) $(TARGET_CPU_ABI2)
  TARGET_CPU_ABI_LIST_32_BIT ?= $(TARGET_2ND_CPU_ABI) $(TARGET_2ND_CPU_ABI2)
  TARGET_CPU_ABI_LIST := \
      $(TARGET_CPU_ABI_LIST_64_BIT) \
      $(TARGET_CPU_ABI_LIST_32_BIT) \
      $(NB_ABI_LIST_32_BIT) \
      $(NB_ABI_LIST_64_BIT)
  TARGET_CPU_ABI_LIST_32_BIT += $(NB_ABI_LIST_32_BIT)
  TARGET_CPU_ABI_LIST_64_BIT += $(NB_ABI_LIST_64_BIT)
else
  TARGET_CPU_ABI_LIST_32_BIT ?= $(TARGET_CPU_ABI) $(TARGET_CPU_ABI2)
  TARGET_CPU_ABI_LIST_32_BIT += $(NB_ABI_LIST_32_BIT)
  TARGET_CPU_ABI_LIST := $(TARGET_CPU_ABI_LIST_32_BIT)
endif

##############################################################
# Source: device/intel/mixins/groups/usb-gadget/cic-configfs/BoardConfig.mk
##############################################################
BOARD_SEPOLICY_DIRS += $(INTEL_PATH_DEVICE_CIC)/sepolicy/usb-gadget/configfs
##############################################################
# Source: device/intel/mixins/groups/media/mesa/BoardConfig.mk
##############################################################
INTEL_VA := true
INTEL_STAGEFRIGHT := true

# Settings for the Media SDK library and plug-ins:
# - USE_MEDIASDK: use Media SDK support or not
USE_MEDIASDK := true
BOARD_HAVE_MEDIASDK_OPEN_SOURCE := true
##############################################################
# Source: device/intel/mixins/groups/camera-ext/ext-camera-only/BoardConfig.mk
##############################################################
# Enable only USB camera and disable all CSI Cameras
BOARD_CAMERA_USB_STANDALONE = true

# SELinux support for USB camera
BOARD_SEPOLICY_DIRS += $(INTEL_PATH_DEVICE_CIC)/sepolicy/camera-ext
BOARD_SEPOLICY_DIRS += $(INTEL_PATH_DEVICE_CIC)/sepolicy/camera-ext/ext-camera-only
##############################################################
# Source: device/intel/mixins/groups/bluetooth/cic/BoardConfig.mk
##############################################################
BOARD_HAVE_BLUETOOTH_INTEL_ICNV := true
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/intel/project-celadon/$(TARGET_PRODUCT)/bluetooth/tablet/
DEVICE_PACKAGE_OVERLAYS += device/intel/project-celadon/$(TARGET_PRODUCT)/bluetooth/tablet/overlay

BOARD_SEPOLICY_DIRS += $(INTEL_PATH_DEVICE_CIC)/sepolicy/bluetooth
BOARD_SEPOLICY_DIRS += $(INTEL_PATH_DEVICE_CIC)/sepolicy/bluetooth/common
##############################################################
# Source: device/intel/mixins/groups/trusty/true/BoardConfig.mk
##############################################################
TARGET_USE_TRUSTY := true

ifneq (, $(filter abl sbl, project-celadon))
TARGET_USE_MULTIBOOT := true
endif

BOARD_USES_TRUSTY := true
BOARD_USES_KEYMASTER1 := true
BOARD_SEPOLICY_DIRS += $(INTEL_PATH_DEVICE_CIC)/sepolicy/trusty
BOARD_SEPOLICY_M4DEFS += module_trusty=true

TRUSTY_BUILDROOT = $(PWD)/$(PRODUCT_OUT)/obj/trusty/

TRUSTY_ENV_VAR += TRUSTY_REF_TARGET=cic

#for trusty vmm
# use same toolchain as android kernel
TRUSTY_ENV_VAR += CLANG_BINDIR=$(PWD)/$(LLVM_PREBUILTS_PATH)
TRUSTY_ENV_VAR += COMPILE_TOOLCHAIN=$(YOCTO_CROSSCOMPILE)
TRUSTY_ENV_VAR += TARGET_BUILD_VARIANT=$(TARGET_BUILD_VARIANT)
TRUSTY_ENV_VAR += BOOT_ARCH=project-celadon

# output build dir to android out folder
TRUSTY_ENV_VAR += BUILD_DIR=$(TRUSTY_BUILDROOT)
TRUSTY_ENV_VAR += LKBIN_DIR=$(PWD)/vendor/intel/fw/trusty-release-binaries/

#Fix the cpu hotplug fail due to the trusty.
#Trusty will introduce some delay for cpu_up().
#Experiment show need wait at least 60us after
#apic_icr_write(APIC_DM_STARTUP | (start_eip >> 12), phys_apicid);
#So here override the cpu_init_udelay to have the cpu wait for 300us
#to guarantee the cpu_up success.
BOARD_KERNEL_CMDLINE += cpu_init_udelay=10

#TOS_PREBUILT := $(PWD)/$(INTEL_PATH_VENDOR)/fw/evmm/tos.img
#EVMM_PREBUILT := $(PWD)/$(INTEL_PATH_VENDOR)/fw/evmm/multiboot.img
# ------------------ END MIX-IN DEFINITIONS ------------------
