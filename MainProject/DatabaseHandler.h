#ifndef DATABASEHANDLER_H
#define DATABASEHANDLER_H

#include <QObject>
#include <QNetworkAccessManager>
#include <QNetworkReply>
#include <QNetworkRequest>
#include <QDebug>
#include <QJsonDocument>
#include <QVariantMap>

class DatabaseHandler : public QObject
{
  Q_OBJECT
public:
  explicit DatabaseHandler(QObject *parent = nullptr);
  ~DatabaseHandler();

public slots:
  void networkReplyReadyRead();

private:
  QNetworkAccessManager * m_networkManager;
  QNetworkReply * m_networkReply;
};

#endif // DATABASEHANDLER_H
