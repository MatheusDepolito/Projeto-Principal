import QtQuick 2.15
import QtQuick.Layouts 1.15

Item {
  property alias setWidthChange: estados.windowMax
  Item {
    id: estados
    property int windowMax: 100
    states: [
      State {
        name: "Desk"
        when: estados.windowMax >= 1000
        AnchorChanges {
          target: header
          anchors.left: parent.left
        }
        PropertyChanges {
          target: header
          width: parent.width * 0.05
          height: parent.height
        }
        AnchorChanges {
          target: body
          anchors.left: header.right
          anchors.top: tabTopo.bottom
          anchors.bottom: parent.bottom
          anchors.right: parent.right
        }
        PropertyChanges {
          target: header.menuHeader.maskH
          width: parent.radius
          height: parent.height
        }
        PropertyChanges {
          target: header.menuHeader.menuButtons

          gridLayout {
            columns: 1
            rows: 3
            height: 210
          }
          button1.btn1.width: width / 1.5
          button2.btn2.width: width / 1.5
          button3.btn3.width: width / 1.5
          button1.Layout.maximumHeight: 70
          button2.Layout.maximumHeight: 70
          button3.Layout.maximumHeight: 70
        }
        PropertyChanges {
          target: tabTopo.grupoMod
          visible: true
        }
      }
    ]
  }
}
