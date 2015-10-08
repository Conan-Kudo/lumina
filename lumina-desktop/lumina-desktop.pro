
QT       += core gui network
greaterThan(QT_MAJOR_VERSION, 4): QT += widgets x11extras multimedia quickwidgets


TARGET = Lumina-DE
isEmpty(PREFIX) {
 PREFIX = /usr/local
}
target.path = $$DESTDIR$$PREFIX/bin

isEmpty(LIBPREFIX) {
 LIBPREFIX = $$PREFIX/lib
}

LIBS     += -L../libLumina -L$$LIBPREFIX -lLuminaUtils -lxcb -lxcb-damage
QMAKE_LIBDIR	= ../libLumina
DEPENDPATH	+= ../libLumina

TEMPLATE = app

isEmpty(QT5LIBDIR) {
 QT5LIBDIR = $$PREFIX/lib/qt5
}

LRELEASE = $$QT5LIBDIR/bin/lrelease


SOURCES += main.cpp \
	WMProcess.cpp \
	LXcbEventFilter.cpp \
	LSession.cpp \
	LDesktop.cpp \
	LDesktopPluginSpace.cpp \
	LPanel.cpp \
	LWinInfo.cpp \
	AppMenu.cpp \
	SettingsMenu.cpp \
	SystemWindow.cpp \
	BootSplash.cpp \
	desktop-plugins/LDPlugin.cpp \


HEADERS  += Globals.h \
	WMProcess.h \
	LXcbEventFilter.h \
	LSession.h \
	LDesktop.h \
	LDesktopPluginSpace.h \
	LPanel.h \
	LWinInfo.h \
	AppMenu.h \
	SettingsMenu.h \
	SystemWindow.h \
	BootSplash.h \
	panel-plugins/LPPlugin.h \
	panel-plugins/NewPP.h \
	panel-plugins/LTBWidget.h \
	desktop-plugins/LDPlugin.h \
	desktop-plugins/NewDP.h \

FORMS    += SystemWindow.ui \
	BootSplash.ui 

#Now include all the files for the various plugins
include(panel-plugins/panel-plugins.pri)
include(desktop-plugins/desktop-plugins.pri)

RESOURCES+= Lumina-DE.qrc

INCLUDEPATH += ../libLumina $$PREFIX/include

desktop.files = Lumina-DE.desktop
linux-* {
desktop.path = /usr/share/xsessions
} else {
desktop.path = $$PREFIX/share/xsessions
}

icons.files = Lumina-DE.png \
		Insight-FileManager.png

icons.path = $$PREFIX/share/pixmaps

wallpapers.files = wallpapers/Lumina_Wispy_gold_1920x1080.jpg \
			wallpapers/Lumina_Wispy_green_1920x1080.jpg \
			wallpapers/Lumina_Wispy_purple_1920x1080.jpg \
			wallpapers/Lumina_Wispy_red_1920x1080.jpg
wallpapers.path = $$PREFIX/share/wallpapers/Lumina-DE

fluxconf.files = fluxboxconf/fluxbox-init-rc \
			fluxboxconf/fluxbox-keys
fluxconf.path = $$PREFIX/share/Lumina-DE/

defaults.files = defaults/desktop-background.jpg \
		defaults/defaultapps.conf \
		defaults/luminaDesktop.conf \
		audiofiles/Logout.ogg \
		audiofiles/Login.ogg
defaults.path = $$PREFIX/share/Lumina-DE/

conf.path = $$PREFIX/etc
conf.extra = cp defaults/luminaDesktop.conf $(INSTALL_ROOT)$$PREFIX/etc/luminaDesktop.conf.dist

TRANSLATIONS =  i18n/lumina-desktop_af.ts \
                i18n/lumina-desktop_ar.ts \
                i18n/lumina-desktop_az.ts \
                i18n/lumina-desktop_bg.ts \
                i18n/lumina-desktop_bn.ts \
                i18n/lumina-desktop_bs.ts \
                i18n/lumina-desktop_ca.ts \
                i18n/lumina-desktop_cs.ts \
                i18n/lumina-desktop_cy.ts \
                i18n/lumina-desktop_da.ts \
                i18n/lumina-desktop_de.ts \
                i18n/lumina-desktop_el.ts \
                i18n/lumina-desktop_en_GB.ts \
                i18n/lumina-desktop_en_ZA.ts \
                i18n/lumina-desktop_es.ts \
                i18n/lumina-desktop_et.ts \
                i18n/lumina-desktop_eu.ts \
                i18n/lumina-desktop_fa.ts \
                i18n/lumina-desktop_fi.ts \
                i18n/lumina-desktop_fr.ts \
                i18n/lumina-desktop_fr_CA.ts \
                i18n/lumina-desktop_gl.ts \
                i18n/lumina-desktop_he.ts \
                i18n/lumina-desktop_hi.ts \
                i18n/lumina-desktop_hr.ts \
                i18n/lumina-desktop_hu.ts \
                i18n/lumina-desktop_id.ts \
                i18n/lumina-desktop_is.ts \
                i18n/lumina-desktop_it.ts \
                i18n/lumina-desktop_ja.ts \
                i18n/lumina-desktop_ka.ts \
                i18n/lumina-desktop_ko.ts \
                i18n/lumina-desktop_lt.ts \
                i18n/lumina-desktop_lv.ts \
                i18n/lumina-desktop_mk.ts \
                i18n/lumina-desktop_mn.ts \
                i18n/lumina-desktop_ms.ts \
                i18n/lumina-desktop_mt.ts \
                i18n/lumina-desktop_nb.ts \
                i18n/lumina-desktop_nl.ts \
                i18n/lumina-desktop_pa.ts \
                i18n/lumina-desktop_pl.ts \
                i18n/lumina-desktop_pt.ts \
                i18n/lumina-desktop_pt_BR.ts \
                i18n/lumina-desktop_ro.ts \
                i18n/lumina-desktop_ru.ts \
                i18n/lumina-desktop_sk.ts \
                i18n/lumina-desktop_sl.ts \
                i18n/lumina-desktop_sr.ts \
                i18n/lumina-desktop_sv.ts \
                i18n/lumina-desktop_sw.ts \
                i18n/lumina-desktop_ta.ts \
                i18n/lumina-desktop_tg.ts \
                i18n/lumina-desktop_th.ts \
                i18n/lumina-desktop_tr.ts \
                i18n/lumina-desktop_uk.ts \
                i18n/lumina-desktop_uz.ts \
                i18n/lumina-desktop_vi.ts \
                i18n/lumina-desktop_zh_CN.ts \
                i18n/lumina-desktop_zh_HK.ts \
                i18n/lumina-desktop_zh_TW.ts \
                i18n/lumina-desktop_zu.ts

dotrans.path=$$PREFIX/share/Lumina-DE/i18n/
dotrans.extra=cd i18n && $${LRELEASE} -nounfinished *.ts && cp *.qm $(INSTALL_ROOT)$$PREFIX/share/Lumina-DE/i18n/

INSTALLS += target desktop icons wallpapers defaults conf fluxconf dotrans

NO_I18N{
  INSTALLS -= dotrans
}