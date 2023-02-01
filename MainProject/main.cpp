#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>

//#include "DatabaseHandler.h"
#include "AuthHandler.h"
int main(int argc, char *argv[])
{
  QGuiApplication app(argc, argv);

  QQmlApplicationEngine engine;
  AuthHandler auth;
  engine.rootContext()->setContextProperty("auth", &auth);

  //qmlRegisterType<AuthHandler>("AuthHandler",1,0,"AuthHandler");

  const QUrl url("qrc:/main.qml");
  QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                   &app, [url](QObject *obj, const QUrl &objUrl) {
    if (!obj && url == objUrl)
      QCoreApplication::exit(-1);
  }, Qt::QueuedConnection);
  engine.addImportPath("qrc:/Imports");
  engine.load(url);

  return app.exec();
}
