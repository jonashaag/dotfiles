all: copyconfig patchPKGBUILD makepkg

copyconfig:
	cp myconfig.h /tmp/evilvte-config.h

patchPKGBUILD:
	sed 's/make ||/echo "#include <\/tmp\/evilvte-config.h>" >> src\/config.h; make ||/' PKGBUILD > /tmp/evilvte-PKGBUILD

makepkg:
	makepkg -f -p /tmp/evilvte-PKGBUILD
