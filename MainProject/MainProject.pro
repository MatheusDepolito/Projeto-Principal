QT += quick svg network sql

SOURCES += \
        AuthHandler.cpp \
        DatabaseHandler.cpp \
        main.cpp


RESOURCES += myResources.qrc

# Caminho de importação adicional usado para resolver módulos QML no modelo de código do Qt Creator
QML_IMPORT_PATH = $$PWD/./Imports

# Caminho de importação adicional usado para resolver módulos QML apenas para Qt Quick Designer
QML_DESIGNER_IMPORT_PATH =

# Regras padrão para implantação.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

DISTFILES +=

HEADERS += \
    AuthHandler.h \
    DatabaseHandler.h

#android: include(android_openssl-master/openssl.pri)
#C:\Users\Matheus\AppData\Local\Android\Sdk\android_openssl
android: include(C:/Users/Matheus/AppData/Local/Android/Sdk/android_openssl/openssl.pri)
