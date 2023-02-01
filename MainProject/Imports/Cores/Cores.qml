pragma Singleton

import QtQuick 2.15

Item {
  property alias themes: tema
  QtObject {
    id: tema
    readonly property var temaDark: ["#000", "#161616", "#1D1C1C", "#232323", "#424242", "#232324", "#1D1C1C"]
    readonly property var temaPurple: ["#645CAA", "#A084CA", "#BFACE0", "#EBC7E8", "#c7b0e8", "#c7b0e8", "#645CAA"]
  }
  property var temaAtual: tema.temaDark

  readonly property string cor1: temaAtual[0]
  readonly property string cor2: temaAtual[1]
  readonly property string cor3: temaAtual[2]
  readonly property string cor4: temaAtual[3]
  readonly property string cor5: temaAtual[4]
  readonly property string cor6: temaAtual[5]
  readonly property string cor7: temaAtual[6]
}
