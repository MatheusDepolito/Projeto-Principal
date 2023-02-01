import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Shapes 1.15
import Cores 1.0

Item {
  anchors.fill: parent

  Shape {
    id: shape
    anchors.fill: parent
    layer.enabled: true
    layer.samples: 4
    antialiasing: true
    MouseArea {
      anchors.fill: parent
      onClicked: {
        if (form.passwordPut.focus) {
          forceActiveFocus()
        }
        if (form.usernamePut.focus) {
          forceActiveFocus()
        }
      }
    }

    ShapePath {
      id: pathe

      fillColor: "transparent"
      strokeColor: Cores.cor6
      strokeWidth: 1
      startX: parent.width / 2
      startY: parent.height / 2
      PathAngleArc {
        centerX: parent.width / parent.width
        centerY: shape.height / 2
        radiusX: shape.width / 2
        radiusY: shape.height / 2
        startAngle: 0
        sweepAngle: 360
      }
    }
    OpacityAnimator {
      target: shape
      from: 0
      to: 1
      duration: 45000
      running: true
    }
  }

  Timer {
    interval: 4200
    running: true
    onTriggered: {
      pathAnimation.running = true
      form.formulario.visible = true
    }
  }
  PathAnimation {
    id: pathAnimation
    target: itemPart
    anchorPoint: Qt.point(itemPart.width / 2, itemPart.height / 2)
    orientation: PathAnimation.TopFirst
    endRotation: 0
    path: Path {
      startX: parent.width / 2
      startY: parent.height / 2
      pathElements: pathe.pathElements
    }
    loops: Animation.Infinite

    running: false
    duration: 30000
  }
}
