import QtQuick 2.15
import Cores 1.0
import Botoes 1.0
import QtQuick.Layouts 1.15
import Icons 1.0
import Estados 1.0
import Header 1.0

Item{
  id: containerHeader

  height: parent.height * 0.1
  width: parent.width
  anchors.bottom: parent.bottom
  property alias menuHeader: menuHeader

  MenuHeader{
    id: menuHeader
  }

}


