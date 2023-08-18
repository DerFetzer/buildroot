################################################################################
#
# brcmfmac_sdio-firmware
#
################################################################################

BRCMFMAC_SDIO_FIRMWARE_VERSION = c70355f9ec6d015b91a5c3199aa08b433e2f7caf
BRCMFMAC_SDIO_FIRMWARE_SITE = $(call github,LibreELEC,brcmfmac_sdio-firmware,$(BRCMFMAC_SDIO_FIRMWARE_VERSION))
BRCMFMAC_SDIO_FIRMWARE_LICENSE = PROPRIETARY
BRCMFMAC_SDIO_FIRMWARE_LICENSE_FILES = LICENCE.broadcom_bcm43xx

ifeq ($(BR2_PACKAGE_BRCMFMAC_SDIO_FIRMWARE_BT),y)
define BRCMFMAC_SDIO_FIRMWARE_INSTALL_TARGET_BT
	$(INSTALL) -d $(TARGET_DIR)/lib/firmware/brcm
	$(INSTALL) -m 0644 $(@D)/*.hcd $(TARGET_DIR)/lib/firmware/brcm
endef
endif

ifeq ($(BR2_PACKAGE_BRCMFMAC_SDIO_FIRMWARE_WIFI),y)
define BRCMFMAC_SDIO_FIRMWARE_INSTALL_TARGET_WIFI
	$(INSTALL) -d $(TARGET_DIR)/lib/firmware/brcm
	$(INSTALL) -m 0644 $(@D)/brcmfmac* $(TARGET_DIR)/lib/firmware/brcm
endef
endif

define BRCMFMAC_SDIO_FIRMWARE_INSTALL_TARGET_CMDS
	$(BRCMFMAC_SDIO_FIRMWARE_INSTALL_TARGET_BT)
	$(BRCMFMAC_SDIO_FIRMWARE_INSTALL_TARGET_WIFI)
endef

$(eval $(generic-package))
