import QtQuick 2.15
pragma Singleton

QtObject {
  readonly property string svgPath: "../Icons/media/svg/"

  readonly property string menu: svgPath + "menu.svg"
  readonly property string x: svgPath + "x.svg"
  readonly property string home: svgPath + "home.svg"
  readonly property string config: svgPath + "config.svg"
  readonly property string table: svgPath + "table.svg"
  readonly property string minimizar: svgPath + "minus.svg"
  readonly property string restaure: svgPath + "square.svg"
  readonly property string notify: svgPath + "notify.svg"
  readonly property string mail: svgPath + "mail.svg"
}
