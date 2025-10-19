
##############################################################
#
# AESD-ASSIGNMENTS
#
##############################################################

#TODO: Fill up the contents below in order to reference your assignment 3 git contents
AESD_ASSIGNMENTS_VERSION = a4p2-fixes
AESD_ASSIGNMENTS_SITE = git@github.com:cu-ecen-aeld/assignments-3-and-later-Oluwapelumi101.git
AESD_ASSIGNMENTS_SITE_METHOD = git
AESD_ASSIGNMENTS_GIT_SUBMODULES = YES

# Unverified 
AESD_ASSIGNMENTS_SUBDIR = finder-app
# Build: ensure writer uses Buildroot toolchain (Unverified)
AESD_ASSIGNMENTS_MAKE_OPTS = CC="$(TARGET_CC)"

# --- Build ---
define AESD_ASSIGNMENTS_BUILD_CMDS
	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/$(AESD_ASSIGNMENTS_SUBDIR) $(AESD_ASSIGNMENTS_MAKE_OPTS)
endef

# # --- Install into target rootfs ---
# define AESD_ASSIGNMENTS_INSTALL_TARGET_CMDS
# 	# scripts/binaries
# 	$(INSTALL) -D -m 0755 $(@D)/$(AESD_ASSIGNMENTS_SUBDIR)/finder.sh      $(TARGET_DIR)/usr/bin/finder.sh
# 	$(INSTALL) -D -m 0755 $(@D)/$(AESD_ASSIGNMENTS_SUBDIR)/finder-test.sh $(TARGET_DIR)/usr/bin/finder-test.sh
# 	$(INSTALL) -D -m 0755 $(@D)/$(AESD_ASSIGNMENTS_SUBDIR)/writer         $(TARGET_DIR)/usr/bin/writer

# 	# config directory and files
# 	$(INSTALL) -d -m 0755 $(TARGET_DIR)/etc/finder-app/conf
# 	$(INSTALL) -m 0644 $(@D)/$(AESD_ASSIGNMENTS_SUBDIR)/conf/* $(TARGET_DIR)/etc/finder-app/conf/
# 	$(INSTALL) -m 0755 $(@D)/assignment-autotest/test/assignment4/* $(TARGET_DIR)/bin
# endef

define AESD_ASSIGNMENTS_INSTALL_TARGET_CMDS
	# scripts/binaries
	$(INSTALL) -D -m 0755 "$(@D)/$(AESD_ASSIGNMENTS_SUBDIR)/finder.sh"      "$(TARGET_DIR)/usr/bin/finder.sh"
	$(INSTALL) -D -m 0755 "$(@D)/$(AESD_ASSIGNMENTS_SUBDIR)/finder-test.sh" "$(TARGET_DIR)/usr/bin/finder-test.sh"
	$(INSTALL) -D -m 0755 "$(@D)/$(AESD_ASSIGNMENTS_SUBDIR)/writer"         "$(TARGET_DIR)/usr/bin/writer"

	# config directory and files
	$(INSTALL) -d -m 0755 "$(TARGET_DIR)/etc/finder-app/conf"
	$(INSTALL) -m 0644 "$(@D)/$(AESD_ASSIGNMENTS_SUBDIR)/conf/"*            "$(TARGET_DIR)/etc/finder-app/conf/"

	$(INSTALL) -d -m 0755 "$(TARGET_DIR)/bin"
	$(INSTALL) -m 0755 "$(@D)/assignment-autotest/test/assignment4/"*       "$(TARGET_DIR)/bin"
endef


$(eval $(generic-package))
             