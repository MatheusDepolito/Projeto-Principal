import QtQuick 2.15

Image {
  id: icon

  property string path: ""

  fillMode: Image.PreserveAspectFit
  source: path
}
