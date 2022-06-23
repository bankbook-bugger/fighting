import QtQuick 2.15
import Felgo 3.0
import "../qml" as Qml

Qml.Levelbase {
  levelName: "Level1"

  Rectangle {
    color: "orange"
    width: 100
    height: 100
    radius: 10
    anchors.centerIn: parent
    TapHandler{
        onTapped: rectanglePressed()
    }

//    MouseArea {
//      anchors.fill: parent
//      // since the level is loaded in the gameScene, and is therefore a child of the gameScene, you could also access gameScene.score here and modify it. But we want to keep the logic in the gameScene rather than spreading it all over the place
//      onPressed: rectanglePressed()
//    }
  }
}
