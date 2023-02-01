import QtQuick 2.15
import Botoes 1.0
import Cores 1.0
import QtQuick.Layouts 1.15
import Icons 1.0

Item {
  anchors.fill: parent
  z: 1

  property alias button1: button1
  property alias button2: button2
  property alias button3: button3
  property alias gridLayout: gridLayout
  GridLayout {
    id: gridLayout
    width: parent.width
    height: parent.height
    columns: 3
    rows: 1
    anchors.verticalCenter: parent.verticalCenter
    Item {
      id: button1
      Layout.fillHeight: true
      Layout.fillWidth: true
      property alias btn1: btn1
      ButtonIcon {
        id: btn1
        icon.path: IconVault.home
        width: parent.width / 2
        height: parent.height / 1.4
        tap.onPressed: {
          body.stack.currentIndex = 0
        }
      }
    }
    Item {
      id: button2
      Layout.fillHeight: true
      Layout.fillWidth: true
      property alias btn2: btn2
      ButtonIcon {
        id: btn2
        icon.path: IconVault.table
        width: parent.width / 2
        height: parent.height / 1.4
        tap.onPressed: {
          body.stack.currentIndex = 1
        }
      }
    }
    Item {
      id: button3
      Layout.fillHeight: true
      Layout.fillWidth: true
      property alias btn3: btn3
      ButtonIcon {
        id: btn3
        icon.path: IconVault.mail
        width: parent.width / 2
        height: parent.height / 1.4
        tap.onPressed: {
          body.stack.currentIndex = 2
        }
      }
    }
  }
}
