################################################################################
#
# bb-k3-r5-loader.mk
#
################################################################################

BB_K3_R5_LOADER_VERSION = c36a9ee00165ee4c9d0cb64477a58a82251431d3 # v2021.01-ti-08.01.00.006
BB_K3_R5_LOADER_SITE = https://git.beagleboard.org/beagleboard/u-boot.git
BB_K3_R5_LOADER_SITE_METHOD = git
BB_K3_R5_LOADER_LICENSE = GPL-2.0+
BB_K3_R5_LOADER_LICENSE_FILES = Licenses/gpl-2.0.txt
BB_K3_R5_LOADER_CPE_ID_VENDOR = denx
BB_K3_R5_LOADER_CPE_ID_PRODUCT = u-boot
BB_K3_R5_LOADER_INSTALL_IMAGES = YES
BB_K3_R5_LOADER_DEPENDENCIES = \
	host-pkgconf \
	$(BR2_MAKE_HOST_DEPENDENCY) \
	host-arm-gnu-toolchain \
	host-openssl

BB_K3_R5_LOADER_MAKE = $(BR2_MAKE)
BB_K3_R5_LOADER_MAKE_ENV = $(TARGET_MAKE_ENV)
BB_K3_R5_LOADER_KCONFIG_DEPENDENCIES = \
	host-arm-gnu-toolchain \
	$(BR2_MAKE_HOST_DEPENDENCY) \
	$(BR2_BISON_HOST_DEPENDENCY) \
	$(BR2_FLEX_HOST_DEPENDENCY)

BB_K3_R5_LOADER_BOARD = $(call qstrip,$(BR2_PACKAGE_BB_K3_R5_LOADER_BOARD))
BB_K3_R5_LOADER_KCONFIG_DEFCONFIG = $(BB_K3_R5_LOADER_BOARD)_r5_defconfig
BB_K3_R5_LOADER_MAKE_OPTS += \
	CROSS_COMPILE=$(HOST_ARM_GNU_TOOLCHAIN_INSTALL_DIR)/bin/arm-none-eabi- \
	ARCH=arm \
	HOSTCC="$(HOSTCC) $(subst -I/,-isystem /,$(subst -I /,-isystem /,$(HOST_CFLAGS)))" \
	HOSTLDFLAGS="$(HOST_LDFLAGS)"

define BB_K3_R5_LOADER_BUILD_CMDS
	$(TARGET_CONFIGURE_OPTS) $(BB_K3_R5_LOADER_MAKE) -C $(@D) $(BB_K3_R5_LOADER_MAKE_OPTS)
endef

define BB_K3_R5_LOADER_INSTALL_IMAGES_CMDS
	cp $(@D)/tiboot3.bin $(BINARIES_DIR)/tiboot3.bin
endef

$(eval $(kconfig-package))
