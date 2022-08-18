################################################################################
#
# ti-linux-firmware
#
################################################################################

TI_LINUX_FIRMWARE_VERSION = 08.03.00.003
TI_LINUX_FIRMWARE_SITE = https://git.ti.com/git/processor-firmware/ti-linux-firmware
TI_LINUX_FIRMWARE_SITE_METHOD = git
TI_LINUX_FIRMWARE_LICENSE = BSD-3-Clause
TI_LINUX_FIRMWARE_LICENSE_FILES = system-firmware-image-gen-1.0-manifest.html
TI_LINUX_FIRMWARE_INSTALL_IMAGES = YES
TI_LINUX_FIRMWARE_INSTALL_TARGET = YES
UBOOT_PRE_BUILD_HOOKS += TI_LINUX_FIRMWARE_RDEPEND_CMD

define TI_LINUX_FIRMWARE_RDEPEND_CMD
	$(MAKE) ti-linux-firmware -C $(BASE_DIR)
endef

define TI_LINUX_FIRMWARE_INSTALL_IMAGES_CMDS
	cp $(@D)/ti-dm/j721e/ipc_echo_testb_mcu1_0_release_strip.xer5f $(BINARIES_DIR)
endef

define TI_LINUX_FIRMWARE_INSTALL_TARGET_CMDS
	cp -rf $(@D)/cadence $(TARGET_DIR)/lib/firmware
endef

$(eval $(generic-package))
