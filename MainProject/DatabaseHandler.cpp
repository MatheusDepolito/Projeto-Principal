#include "DatabaseHandler.h"

DatabaseHandler::DatabaseHandler(QObject *parent)
  : QObject{parent}
{
  m_networkManager = new QNetworkAccessManager( this );

  m_networkReply = m_networkManager->get(QNetworkRequest(QUrl("https://qtmainproject-default-rtdb.firebaseio.com/Users/user1.json")));
  connect(m_networkReply, &QNetworkReply::readyRead, this, &DatabaseHandler::networkReplyReadyRead);

//Metodo post
  QVariantMap n;
  n [ "username" ] = "visitante";
  n [ "password" ] = "123";

  QJsonDocument jsonDoc = QJsonDocument::fromVariant( n );
  QNetworkRequest newReq(QUrl("https://qtmainproject-default-rtdb.firebaseio.com/Users.json"));
  newReq.setHeader( QNetworkRequest::ContentTypeHeader, QString("application/json") );
  m_networkManager->post( newReq, jsonDoc.toJson());
}

DatabaseHandler::~DatabaseHandler()
{
  m_networkManager->deleteLater();
}

void DatabaseHandler::networkReplyReadyRead()
{
  qDebug() << "tentouuuuuuuuuuuuuuuuuuu";
  qDebug() << m_networkReply->readAll();
}
