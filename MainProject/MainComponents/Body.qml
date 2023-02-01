import QtQuick 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls 2.15
import Botoes 1.0
import Cores 1.0
import Pages 1.0

Item {
  id: containerBody

  anchors.bottom: header.top
  anchors.top: tabTopo.bottom
  anchors.left: parent.left
  anchors.right: parent.right

  property alias stack: stack
  Rectangle {
    id: body

    color: "transparent"
    anchors.fill: parent

    StackLayout {
      id: stack
      anchors.fill: parent
      currentIndex: 0

      Page1 {
        id: page1
      }
      Page2 {
        id: page2
      }
      Page3 {
        id: page3
      }
    }
  }
}
