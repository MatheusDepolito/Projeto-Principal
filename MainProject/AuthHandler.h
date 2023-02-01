#ifndef AUTHHANDLER_H
#define AUTHHANDLER_H

#include <QObject>
#include <QNetworkAccessManager>
#include <QNetworkReply>
#include <QNetworkRequest>
#include <QDebug>
#include <QJsonDocument>
#include <QVariantMap>
#include <QDebug>
#include <QJsonObject>

class AuthHandler : public QObject
{
  Q_OBJECT
public:
  explicit AuthHandler(QObject *parent = nullptr);
  ~AuthHandler();
  Q_INVOKABLE void setApiKey( const QString &apiKey);
  Q_INVOKABLE void cadastrar( const QString &emailAddress, const QString &password );
  Q_INVOKABLE void fazerLogin( const QString &emailAddress, const QString &password );

public slots:
  void networkReplyReadyRead();
  //fazer em outra classe
  void performAuthenticatedDatabaseCall();
signals:
  void resp(bool);
  void userSignedIn();
private:
  void performPost(const QString &url, const QJsonDocument &payload);
  void parseResponse( const QByteArray &response);
  QString _apiKey;
  QString _idToken;
  QNetworkAccessManager * _networkAcessManager;
  QNetworkReply * _networkReply;
};

#endif // AUTHHANDLER_H
