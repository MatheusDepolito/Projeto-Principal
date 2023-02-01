import QtQuick 2.15

Rectangle{
  width:200
  height:200
  color:"purple"
  opacity: 0.5
  Rectangle{
    width:100
    height:100
    anchors.centerIn: parent
    color:"yellow"
    Rectangle{
      width:5
      height:5
      color:"black"
      y:parent.y
      x:parent.x
    }
  }
      DragHandler{}
}
