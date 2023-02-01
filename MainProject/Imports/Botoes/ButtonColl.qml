import QtQuick 2.15

Item {
  visible: true

  property alias tap: tapHandler
  property alias myButtonn: myButton
  property alias colorPressed: myButton.welColorClicked
  property alias colorHovered: myButton.welColorHovered
  property alias colorNormal: myButton.welColorNormal
  property alias title: textoD.text
  Rectangle {
    id: myButton
    anchors.fill: parent
    radius: 10
    //    opacity: hoverHandler.hovered ? 0.5 : 1
    property color welColorClicked: "blue"
    property color welColorHovered: "blue"
    property color welColorNormal: "blue"

    color: tapHandler.pressed ? welColorClicked : hoverHandler.hovered ? welColorHovered : welColorNormal
    //    border.color: activeFocus ? welColorNormal : bColor
    focus: true

    Text {
      id: textoD
      text: ""
      anchors.centerIn: parent
      color: "white"
    }

    TapHandler {
      id: tapHandler
    }
    HoverHandler {
      id: hoverHandler
      cursorShape: Qt.PointingHandCursor
    }
    //    Keys.onEnterPressed: myButton.clicked(console.log("Testing"))
  }
}
