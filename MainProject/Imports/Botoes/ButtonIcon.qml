import QtQuick 2.15
import Icons 1.0
import Cores 1.0

Rectangle {
  id: myButton

  property alias icon: icon
  property alias tap: tap

  anchors.centerIn: parent
  color: "transparent"
  radius:width
  Icon {
    id: icon
    sourceSize.height: parent.height / 2
    anchors.centerIn: parent
    path: IconVault.menuBurguer
  }

  MouseArea {
    id: tap
    anchors.fill: parent
    cursorShape: Qt.PointingHandCursor
  }
  states: [
    State {
      name: "ativado"
      when: myButton.tap.pressed
      PropertyChanges {
        target: myButton
        color: Cores.cor5
      }
    }
  ]
}

