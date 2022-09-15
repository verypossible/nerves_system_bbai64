################################################################################
#
# bb-k3-image-gen
#
################################################################################

BB_K3_IMAGE_GEN_VERSION = 489c767a153ff26e9230746e04dd4b1ad0809901 # 08.01.00.006
BB_K3_IMAGE_GEN_SITE = https://git.beagleboard.org/beagleboard/k3-image-gen.git
BB_K3_IMAGE_GEN_SITE_METHOD = git
BB_K3_IMAGE_GEN_LICENSE = BSD-3-Clause
BB_K3_IMAGE_GEN_LICENSE_FILES = system-firmware-image-gen-1.0-manifest.html
BB_K3_IMAGE_GEN_INSTALL_IMAGES = YES
BB_K3_IMAGE_GEN_DEPENDENCIES = host-arm-gnu-toolchain bb-k3-r5-loader
BB_K3_IMAGE_GEN_MAKE = $(BR2_MAKE)
BB_K3_IMAGE_GEN_SOC = $(call qstrip,$(BR2_PACKAGE_BB_K3_IMAGE_GEN_SOC))
BB_K3_IMAGE_GEN_CONFIG = $(call qstrip,$(BR2_PACKAGE_BB_K3_IMAGE_GEN_CONFIG))
BB_K3_IMAGE_GEN_MAKE_OPTS = \
	SOC=$(BB_K3_IMAGE_GEN_SOC) \
	CONFIG=$(BB_K3_IMAGE_GEN_CONFIG) \
	CROSS_COMPILE=$(HOST_ARM_GNU_TOOLCHAIN_INSTALL_DIR)/bin/arm-none-eabi- \
	O=$(BINARIES_DIR) \
	BIN_DIR=$(BINARIES_DIR)

define BB_K3_IMAGE_GEN_BUILD_CMDS
	$(BB_K3_IMAGE_GEN_MAKE) -C $(@D) $(BB_K3_IMAGE_GEN_MAKE_OPTS)
endef

define BB_K3_IMAGE_GEN_INSTALL_IMAGES_CMDS
	cp $(@D)/sysfw.itb $(BINARIES_DIR)
endef

$(eval $(generic-package))
