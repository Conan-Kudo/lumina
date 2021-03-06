
QT       += core network
greaterThan(QT_MAJOR_VERSION, 4): QT += widgets x11extras multimedia concurrent svg


TARGET=LuminaUtils

isEmpty(PREFIX) {
 PREFIX = /usr/local
}

system(./make-global-h.sh $$PREFIX)

isEmpty(LIBPREFIX) {
 LIBPREFIX = $$PREFIX/lib
}
target.path = $$DESTDIR$$LIBPREFIX

DESTDIR= $$_PRO_FILE_PWD_/

TEMPLATE	= lib
LANGUAGE	= C++
VERSION		= 1

HEADERS	+= LuminaXDG.h \
	LuminaUtils.h \
	LuminaX11.h \
	LuminaThemes.h \
	LuminaOS.h \
	LuminaSingleApplication.h

SOURCES	+= LuminaXDG.cpp \
	LuminaUtils.cpp \
	LuminaX11.cpp \
	LuminaThemes.cpp \
	LuminaSingleApplication.cpp \
	LuminaOS-FreeBSD.cpp \
	LuminaOS-DragonFly.cpp \
	LuminaOS-NetBSD.cpp \
	LuminaOS-OpenBSD.cpp \
        LuminaOS-kFreeBSD.cpp
#       new OS support can be added here

# check linux distribution and use specific
# LuminaOS support functions (or fall back to
# generic one

exists(/bin/lsb_release){
  LINUX_DISTRIBUTION = $$system(lsb_release -si)
} exists(/usr/bin/lsb_release){
  LINUX_DISTRIBUTION = $$system(lsb_release -si)
}

equals(LINUX_DISTRIBUTION, "Debian"): {
	SOURCES += LuminaOS-Debian.cpp
} else {
	SOURCES += LuminaOS-Linux.cpp
}



INCLUDEPATH += $$PREFIX/include

LIBS	+= -lc -lxcb -lxcb-ewmh -lxcb-icccm -lxcb-image -lxcb-composite -lxcb-damage -lxcb-util -lXdamage 

include.path=$$PREFIX/include/
include.files=LuminaXDG.h \
	LuminaUtils.h \
	LuminaX11.h \
	LuminaThemes.h \
	LuminaOS.h \
	LuminaSingleApplication.h

colors.path=$$PREFIX/share/Lumina-DE/colors/
colors.files=colors/*.qss.colors

themes.path=$$PREFIX/share/Lumina-DE/themes/
themes.files=themes/*.qss.template

quickplugins.path=$$PREFIX/share/Lumina-DE/quickplugins/
quickplugins.files=quickplugins/*

INSTALLS += target include colors themes quickplugins

QMAKE_LIBDIR = $$LIBPREFIX/qt5 $$LIBPREFIX
