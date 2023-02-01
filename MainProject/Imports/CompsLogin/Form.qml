import QtQuick 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls 2.15
import Cores 1.0
import Botoes 1.0

Item {
  width: parent.width * 0.70
  height: parent.height * 0.35
  anchors.centerIn: parent

  property alias formulario: formulario
  property alias usernamePut: username
  property alias passwordPut: password

  Rectangle {
    id: formulario
    anchors.fill: parent
    color: Cores.cor2
    radius: 10
    border.color: Cores.cor3
    border.width: 3
    visible: false

    GridLayout {
      anchors.fill: parent
      columns: 1
      rows: 3
      rowSpacing: 0

      Rectangle {
        id: recMeio
        Layout.fillHeight: true
        Layout.fillWidth: true

        color: "transparent"
        ColumnLayout {
          anchors.centerIn: parent
          width: parent.width * 0.80
          height: parent.height * 0.70
          spacing: 0

          Rectangle {
            Layout.fillHeight: true
            Layout.fillWidth: true

            Layout.minimumHeight: 32
            color: "transparent"
            Rectangle {
              id: paiUser
              anchors.fill: parent
              color: "transparent"
              TextField {
                id: username
                verticalAlignment: Text.AlignBottom
                horizontalAlignment: Text.AlignLeft
                placeholderText: "Usuario"
                placeholderTextColor: "white"
                color: "white"
                leftPadding: 10
                width: parent.width
                height: parent.height
                font.pointSize: 13
                background: Rectangle {
                  color: Cores.cor3
                  height: 2
                  anchors.bottom: parent.bottom
                  width: paiUser.width
                }
              }
            }
          }
          Rectangle {
            Layout.fillHeight: true
            Layout.fillWidth: true
            Layout.minimumHeight: 32
            color: "transparent"
            Rectangle {
              id: paiPass
              anchors.fill: parent
              anchors.centerIn: parent
              color: "transparent"
              TextField {
                id: password

                horizontalAlignment: Text.AlignLeft
                placeholderText: "Senha"
                placeholderTextColor: "white"
                color: "white"
                leftPadding: 10
                verticalAlignment: Text.AlignBottom
                width: parent.width
                height: parent.height
                font.pointSize: 13

                echoMode: TextInput.Password
                background: Rectangle {
                  color: Cores.cor3
                  height: 2
                  anchors.bottom: parent.bottom
                  width: paiPass.width
                }
              }
            }
          }
        }
      }
      Item {
        id: recBaixo
        Layout.fillHeight: true
        Layout.fillWidth: true
        Layout.maximumHeight: parent.height * 0.35
        ButtonColl {
          id: btnN
          width: parent.width * 0.7
          height: parent.height * 0.7
          anchors.centerIn: parent
          title: "Faça login"
          colorNormal: Cores.cor4
          colorHovered: Cores.cor4
          colorPressed: Cores.cor5
          tap.onTapped: {
            if (form.passwordPut.focus) {
              forceActiveFocus()
            }
            if (form.usernamePut.focus) {
              forceActiveFocus()
            }

            auth.setApiKey("")
            auth.fazerLogin(username.text, password.text)
          }
        }
      }
    }
  }
  Connections {
    target: auth
    function onResp(test) {
      if (test === false) {

        //Mostrar mensagem de senha ou email invalido
      } else {
        root.stack.currentIndex = 1
        //Sucesso no login
      }
    }
  }
}
