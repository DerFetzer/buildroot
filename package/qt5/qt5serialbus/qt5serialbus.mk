################################################################################
#
# qt5serialbus
#
################################################################################

QT5SERIALBUS_VERSION = f9f7eee60adac72fcf6617d164e3bf61222bb5c5
QT5SERIALBUS_SITE = $(QT5_SITE)/qtserialbus/-/archive/$(QT5SERIALBUS_VERSION)
QT5SERIALBUS_SOURCE = qtserialbus-$(QT5SERIALBUS_VERSION).tar.bz2
QT5SERIALBUS_DEPENDENCIES = qt5serialport
QT5SERIALBUS_INSTALL_STAGING = YES
QT5SERIALBUS_SYNC_QT_HEADERS = YES

QT5SERIALBUS_LICENSE = GPL-2.0 or GPL-3.0 or LGPL-3.0, GFDL-1.3 (docs)
QT5SERIALBUS_LICENSE_FILES = LICENSE.GPLv2 LICENSE.GPLv3 LICENSE.LGPLv3 LICENSE.FDL

$(eval $(qmake-package))
