include $(TOPDIR)/rules.mk

PKG_NAME:=overture
PKG_VERSION:=1.8-rc1
PKG_RELEASE:=2
PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=LICENSE.md

ifeq ($(ARCH),mipsel)
	PKG_ARCH:=mipsle
	PKG_SOURCE:=overture-linux-$(PKG_ARCH)-softfloat-v$(PKG_VERSION).gz
else ifeq ($(ARCH),mips)
	PKG_ARCH:=mips
	PKG_SOURCE:=overture-linux-$(PKG_ARCH)-softfloat-v$(PKG_VERSION).gz
else ifeq ($(ARCH),x86_64)
	PKG_ARCH:=amd64
	PKG_SOURCE:=overture-linux-$(PKG_ARCH)-v$(PKG_VERSION).gz
else ifeq ($(ARCH),arm)
	PKG_ARCH:=armv7
	PKG_SOURCE:=overture-linux-$(PKG_ARCH)-v$(PKG_VERSION).gz
else ifeq ($(ARCH),aarch64)
	PKG_ARCH:=armv8
	PKG_SOURCE:=overture-linux-$(PKG_ARCH)-v$(PKG_VERSION).gz
else
  PKG_SOURCE:=dummy
  PKG_HASH:=skip
endif


PKG_SOURCE_URL:=https://github.com/shawn1m/overture/releases/download/v$(PKG_VERSION)/
PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_HASH:=skip

include $(INCLUDE_DIR)/package.mk

define Package/$(PKG_NAME)
	SECTION:=luci
	CATEGORY:=LuCI
	SUBMENU:=2. Overture
	TITLE:=A customized DNS relay server
	DEPENDS:=
	URL:=https://github.com/shawn1m/overture
endef

define Package/$(PKG_NAME)/description
	A customized DNS relay server
endef

define Build/Prepare
	gzip -dc "$(DL_DIR)/$(PKG_SOURCE)" > $(PKG_BUILD_DIR)/overture-linux-$(PKG_ARCH)
endef

define Build/Compile
endef

define Package/$(PKG_NAME)/install
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/overture-linux-$(PKG_ARCH) $(1)/usr/sbin/overture
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./files/overture.init $(1)/etc/init.d/overture
	$(INSTALL_DIR) $(1)/etc/config
	$(INSTALL_CONF) ./files/overture.config $(1)/etc/config/overture
	$(INSTALL_DIR) $(1)/etc/overture
	$(INSTALL_CONF) ./files/overture/* $(1)/etc/overture/
	$(INSTALL_BIN) ./files/overture/*.sh $(1)/etc/overture/
endef

$(eval $(call BuildPackage,$(PKG_NAME)))
