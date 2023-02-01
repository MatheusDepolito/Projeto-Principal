import QtQuick 2.15
import QtQuick.Particles 2.15
import Icons 1.0
import "../Js/Collision.js" as Js

Rectangle {
  id: window
  color: "transparent"
  property var vMouse: [mouse.mouseX,mouse.mouseY]
  MouseArea{
    id:mouse
    anchors.fill: parent
    hoverEnabled: true
    onPositionChanged: {
      if(Js.rectVsRect(rect1,rect2)){
        console.log("colidiu")
       }
//      console.log(`${vMouse[0]} + ${vMouse[1]}`)
    }
  }
    Rectangle{
      id:rect1

      width:100
      height:100
      color:"red"
      anchors.centerIn: parent
      z:3

//      DragHandler{}
      Text {
          text: qsTr(Js.printXY(parent))
          color: "black"
          anchors.centerIn: parent
          z:1
      }
      Rectangle{
        width:200
        height:200
        color:"purple"
        opacity: 0.2
        anchors.centerIn: parent
      }
    }

    Rectangle{
      id:rect2
      width:100
      height:100
      color:"yellow"
      x:vMouse[0]
      y:vMouse[1]
      Text {
        text: qsTr(Js.printXY(parent))
        color: "black"
        anchors.centerIn: parent
        z:1
      }
      Rectangle{
        width:200
        height:200
        color:"lightgreen"
        opacity: 0.2
        anchors.centerIn: parent
      }
    }




//  Rectangle {
//    id: rect1
//    width: 100
//    height: width
//    x: parent.width / 2 + rect1.width / 2
//    y: parent.height / 2 + rect1.width / 2

//    color: "blue"
//    onXChanged: {
//      Js.dynamicRectVsRect(rect1, rect2)
//    }

//    DragHandler {}
//    Text {
//      text: qsTr(Js.printXY(parent))
//      color: "black"
//      anchors.centerIn: parent
//    }
//  }

//  Rectangle {
//    id: rect2
//    width: 100
//    height: width
//    x: parent.height / 2 - rect2.width / 2
//    y: parent.height / 2 - rect2.width / 2

//    //    Component.onCompleted: Js.printXY()
//    Text {
//      text: qsTr(Js.printXY(parent))
//      color: "black"
//      anchors.centerIn: parent
//    }

//    color: "orange"
//    onXChanged: {
//      Js.dynamicRectVsRect(rect1, rect2)
//      //      Js.printXY()
//    }
//    DragHandler {}
//  }
//  Rectangle{
//    width: 10
//    height: 10
//    color: "red"
//    y: rect2.y + rect2.height /2
//    x:rect2.x
//  }
} //    DragHandler {//      xAxis.minimum: window.width - window.width//      xAxis.maximum: window.width - bola.width//      yAxis.minimum: window.height - window.height//      yAxis.maximum: window.height - bola.height//      function printXY(obj) {//        console.log(obj.x + "x" + obj.y)//      }//      //      onGrabChanged: {//      //        console.log(bola.x + "/" + bola.y)//      //      }//      //      onCanceled: {//      //      }//      //onActiveChanged: printXY(bola)//    }
