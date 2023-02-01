import QtQuick 2.15
import QtQuick.Layouts 1.15
import Botoes 1.0
import Icons 1.0

Rectangle {
  color: "transparent"
  width: body.width
  height: parent.height * 0.06
  anchors.right: parent.right
  anchors.top: parent.top
  property alias grupoMod: grupoMod
  RowLayout {
    id: rowLayout
    anchors.fill: parent
    spacing: 0
    Rectangle {
      Layout.fillHeight: true
      Layout.fillWidth: true
      Layout.maximumWidth: 100
      Layout.alignment: Qt.AlignLeft
      color: "transparent"
      //botao de voltar pagina ou outra coisa
    }
    Item {
      id: grupoMod
      visible: false
      Layout.fillHeight: true
      Layout.fillWidth: true
      Layout.maximumWidth: 150
      Layout.alignment: Qt.AlignRight
      RowLayout {
        anchors.fill: parent
        spacing: 0
        Item {
          Layout.fillHeight: true
          Layout.fillWidth: true
          ButtonIcon {
            id: minus
            width: parent.width
            height: parent.height
            icon.path: IconVault.minimizar
            radius: 0
            tap.onClicked: {

              //              showMinimized()
            }
          }
        }
        Item {
          Layout.fillHeight: true
          Layout.fillWidth: true
          ButtonIcon {
            id: restaure
            width: parent.width
            height: parent.height
            icon.path: IconVault.restaure
            radius: 0
            tap.onClicked: {

              //              root.showFullScreen() ? root.showNormal() : root.showFullScreen()
            }
          }
        }
        Item {
          Layout.fillHeight: true
          Layout.fillWidth: true
          ButtonIcon {
            id: x
            width: parent.width
            height: parent.height
            icon.path: IconVault.x
            radius: 0
            tap.onClicked: {

              //              close()
            }
          }
        }
      }
      // botoes do modo desk
    }
  }
}
