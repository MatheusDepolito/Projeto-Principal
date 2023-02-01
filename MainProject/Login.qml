import QtQuick 2.15
import QtQuick.Shapes 1.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import "./MainComponents"
import CompsLogin 1.0
import Cores 1.0

Item {
  id: login

  Background {
    id: background
  }

  GridLayout {
    anchors.fill: parent
    columns: 3
    rows: 1
    columnSpacing: 0

    Rectangle {
      id: recLeft
      Layout.fillHeight: true
      Layout.fillWidth: true
      color: Cores.cor1
      z: 2
      MouseArea {
        anchors.fill: parent
        onClicked: {
          forceActiveFocus() // Tirar o foco do campo ao clickar fora
        }
      }
    }

    Item {
      id: paiAreaLogin
      Layout.fillHeight: true
      Layout.fillWidth: true
      Layout.maximumWidth: 450
      Layout.minimumWidth: 370
      Layout.alignment: Qt.AlignCenter

      ItemPart {
        id: itemPart
      }
      ShapeCircle {
        id: shapeCircle
      }
      Form {
        id: form
      }
    }

    Rectangle {
      id: recRight

      Layout.fillHeight: true
      Layout.fillWidth: true
      color: Cores.cor1
      z: 2
      MouseArea {
        anchors.fill: parent
        onClicked: forceActiveFocus() // Tirar o foco do campo ao clickar fora
      }
    }
  }
}
