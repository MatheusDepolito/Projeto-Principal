import QtQuick 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls 2.15

ApplicationWindow {
  id: root
  visible: true
  width: 1000
  height: 500
  title: qsTr("Hello World")
  color: "transparent"
  property alias stack: stack

  StackLayout {
    id: stack
    anchors.fill: parent
    currentIndex: 1

    Login {
      id: login
    }
    MainWindow {
      id: mainwindow
    }
  }
}
