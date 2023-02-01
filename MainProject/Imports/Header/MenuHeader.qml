import QtQuick 2.15
import Cores 1.0
import Botoes 1.0
import QtQuick.Layouts 1.15


Item{
  anchors.fill: parent
  property alias maskH: maskH
  property alias menuButtons: menuButtons
  Rectangle{
    id: header
    color: Cores.cor2
    anchors.fill: parent
    radius: 20
    Rectangle {
        id: maskH
        width: parent.width
        height: parent.radius
        color: parent.color
        anchors.bottom: parent.bottom
        anchors.left: parent.left
    }

    MenuButtons{
      id:menuButtons
    }
  }
}
