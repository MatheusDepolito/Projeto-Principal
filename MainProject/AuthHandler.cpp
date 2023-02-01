#include "AuthHandler.h"

AuthHandler::AuthHandler(QObject *parent)
  : QObject{parent},
    _apiKey(QString())
{
  _networkAcessManager = new QNetworkAccessManager( this );
  connect( this, &AuthHandler::userSignedIn, this, &AuthHandler::performAuthenticatedDatabaseCall);
}

AuthHandler::~AuthHandler()
{
  _networkAcessManager->deleteLater();
}

void AuthHandler::setApiKey(const QString &apiKey)
{
  _apiKey = apiKey;
}
//cadastrar usuario
void AuthHandler::cadastrar(const QString &emailAddress, const QString &password)
{
  QString signUpEndpoint = "https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=" + _apiKey;

  QVariantMap variantPayLoad;
  variantPayLoad[ "email" ] = emailAddress;
  variantPayLoad[ "password" ] = password;
  variantPayLoad[ "returnSecureToken" ] = true;
  // transformando em json
  QJsonDocument jsonPayload = QJsonDocument::fromVariant( variantPayLoad );
  performPost(signUpEndpoint, jsonPayload);
}
//Fazer login do usuarioogin
void AuthHandler::fazerLogin(const QString &emailAddress, const QString &password)
{
  QString signInEndpoint = "https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=" + _apiKey;

  QVariantMap variantPayLoad;
  variantPayLoad[ "email" ] = emailAddress;
  variantPayLoad[ "password" ] = password;
  variantPayLoad[ "returnSecureToken" ] = true;
  // transformando em json
  QJsonDocument jsonPayload = QJsonDocument::fromVariant( variantPayLoad );
  performPost(signInEndpoint, jsonPayload);
}

//rede responder
void AuthHandler::networkReplyReadyRead()
{
//  qDebug() << _networkReply->readAll();
  QByteArray response = _networkReply->readAll();
  _networkReply->deleteLater();

  parseResponse( response );
}

void AuthHandler::performAuthenticatedDatabaseCall()
{
  QString endPoint = "https://qtmainproject-default-rtdb.firebaseio.com/Users.json?auth="+ _idToken;
  _networkReply = _networkAcessManager->get( QNetworkRequest(QUrl(endPoint)));
  connect( _networkReply, &QNetworkReply::readyRead, this, &AuthHandler::networkReplyReadyRead );
}
//Postar
void AuthHandler::performPost(const QString &url, const QJsonDocument &payload)
{
  QNetworkRequest newRequest( (QUrl( url )));
  newRequest.setHeader( QNetworkRequest::ContentTypeHeader, QString( "application/json" ));
  _networkReply = _networkAcessManager->post( newRequest, payload.toJson());

  connect( _networkReply, &QNetworkReply::readyRead, this, &AuthHandler::networkReplyReadyRead );
}
// resposta de analise
void AuthHandler::parseResponse(const QByteArray &response)
{
  QJsonDocument jsonDocument = QJsonDocument::fromJson( response );

  if( jsonDocument.object().contains("error")){
    emit resp(false);
    qDebug() << "ERRO" /*<< response*/;
  }
  if(jsonDocument.object().contains("kind")){
    QString idToken = jsonDocument.object().value("idToken").toString();
    _idToken = idToken;
    emit resp(true);
    qDebug() << "OK";
    emit userSignedIn();
    //qDebug() << jsonDocument.toJson(); /*<< response*/;
    //qDebug() <<"obteve o id token do usuario" << idToken;
  }
//  else{
//      qDebug() << " a resposta é: " << response;
//    }
}








