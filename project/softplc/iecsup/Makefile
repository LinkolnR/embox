
GIT_SHA  := 27e8830628698425824c9a42b95821529e4f745d

PKG_NAME := matiec
PKG_VER  := $(GIT_SHA)

PKG_SOURCES := https://github.com/embox/matiec/archive/$(GIT_SHA).zip
PKG_MD5     := 87fd77d0c956bd64cf391a27f1c06055

include $(EXTBLD_LIB)

IECLIB_DIR := $(PROJECT_DIR)/softplc/ieclib

$(CONFIGURE) :
	cd $(PKG_SOURCE_DIR) && ( \
		autoreconf -i; \
		./configure; \
	)
	touch $@

$(BUILD) :
	cd $(PKG_SOURCE_DIR) && ( \
		make; \
	)
	touch $@

$(INSTALL) :
	$(MKDIR) $(PKG_INSTALL_DIR)/bin
	$(CP) $(PKG_SOURCE_DIR)/iec2c $(PKG_INSTALL_DIR)/bin
	$(CP) -r $(PKG_SOURCE_DIR)/lib $(PKG_INSTALL_DIR)/lib
	$(MV) $(PKG_INSTALL_DIR)/lib/C $(PKG_INSTALL_DIR)/include
	cd $(IECLIB_DIR) && ( \
		find . -name \*.st -exec cp --parents {} $(PKG_INSTALL_DIR)/lib \; \
	)
	cat $(IECLIB_DIR)/ieclib.txt >> $(PKG_INSTALL_DIR)/lib/ieclib.txt; \
	touch $@
