
##############################################################
#
# AESD-ASSIGNMENTS
#
##############################################################

#TODO: Fill up the contents below in order to reference your assignment 3 git contents
AESD_ASSIGNMENTS_VERSION = a4p2-fixes
# Note: Be sure to reference the *ssh* repository URL here (not https) to work properly
# with ssh keys and the automated build/test system.
# Your site should start with git@github.com:
AESD_ASSIGNMENTS_SITE = git@github.com:cu-ecen-aeld/assignments-3-and-later-Oluwapelumi101.git
AESD_ASSIGNMENTS_SITE_METHOD = git
AESD_ASSIGNMENTS_GIT_SUBMODULES = YES

# Unverified 
AESD_ASSIGNMENTS_SUBDIR = finder-app 
# Build: ensure writer uses Buildroot toolchain (Unverified)
AESD_ASSIGNMENTS_MAKE_OPTS = CC="$(TARGET_CC)"


define AESD_ASSIGNMENTS_BUILD_CMDS
	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)/finder-app all
endef


# define AESD_ASSIGNMENTS_BUILD_CMDS
# 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/$(AESD_ASSIGNMENTS_SUBDIR) $(AESD_ASSIGNMENTS_MAKE_OPTS)
# endef

# TODO add your writer, finder and finder-test utilities/scripts to the installation steps below
define AESD_ASSIGNMENTS_INSTALL_TARGET_CMDS
	$(INSTALL) -d 0755 $(@D)/conf/ $(TARGET_DIR)/etc/finder-app/conf/
	$(INSTALL) -m 0755 $(@D)/conf/* $(TARGET_DIR)/etc/finder-app/conf/
	$(INSTALL) -m 0755 $(@D)/assignment-autotest/test/assignment4/* $(TARGET_DIR)/bin

	$(INSTALL) -D -m 0755 $(@D)/$(AESD_ASSIGNMENTS_SUBDIR)/finder.sh      $(TARGET_DIR)/usr/bin/finder.sh
	$(INSTALL) -D -m 0755 $(@D)/$(AESD_ASSIGNMENTS_SUBDIR)/finder-test.sh $(TARGET_DIR)/usr/bin/finder-test.sh
	$(INSTALL) -D -m 0755 $(@D)/$(AESD_ASSIGNMENTS_SUBDIR)/finder-test.sh $(TARGET_DIR)/usr/bin/finder-test.sh

endef


# # Install scripts + binary; conf files to /etc/finder-app/conf
# define AESD_ASSIGNMENTS_INSTALL_TARGET_CMDS
# 	# binaries/scripts
# 	$(INSTALL) -D -m 0755 $(@D)/$(AESD_ASSIGNMENTS_SUBDIR)/finder.sh      $(TARGET_DIR)/usr/bin/finder.sh
# 	$(INSTALL) -D -m 0755 $(@D)/$(AESD_ASSIGNMENTS_SUBDIR)/finder-test.sh $(TARGET_DIR)/usr/bin/finder-test.sh
# 	$(INSTALL) -D -m 0755 $(@D)/$(AESD_ASSIGNMENTS_SUBDIR)/writer         $(TARGET_DIR)/usr/bin/writer

# 	# config directory and files (0644)
# 	$(INSTALL) -d -m 0755 $(TARGET_DIR)/etc/finder-app/conf
# 	for f in $(@D)/$(AESD_ASSIGNMENTS_SUBDIR)/conf/* ; do \
# 		$(INSTALL) -m 0644 $$f $(TARGET_DIR)/etc/finder-app/conf/ ; \
# 	done
# endef



$(eval $(generic-package))
