.PHONY: all lib clean distclean indent

VERSION:=0.0.1

IPTC2TAG_APPLESCRIPT:=Iptc2tag.applescript

TARGET:=Iptc2tag.app

TARGET_RESOURCE_DIR:=$(TARGET)/Contents/Resources

all: $(TARGET)

$(TARGET): $(IPTC2TAG_APPLESCRIPT)
	@rm -rf $(TARGET)
	@osacompile -o $(TARGET) $(IPTC2TAG_APPLESCRIPT)

clean:
	@rm -rf $(TARGET)

distclean: clean
	@rm -rf $(EXTCMD_BASE) .DS_Store
