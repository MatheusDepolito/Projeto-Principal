import QtQuick 2.15
import "./MainComponents"
import Botoes 1.0
import Cores 1.0
import Estados 1.0
import Header 1.0

Rectangle {
  id: mainWindow

  Background {
    id: background
  }
  Body {
    id: body
  }
  Header {
    id: header
  }
  TabTopo {
    id: tabTopo
  }
  EstadoDeskMob {
    setWidthChange: background.width
  }
}
