import Felgo 3.0
import QtQuick 2.0

SceneBase {
    id:gameScene
       // the filename of the current level gets stored here, it is used for loading the
       property string activeLevelFileName
       // the currently loaded level gets stored here
       property variant activeLevel

       // set the name of the current level, this will cause the Loader to load the corresponding level
       function setLevel(fileName) {
         activeLevelFileName = fileName
       }

       // background
       Rectangle {
         anchors.fill: parent.gameWindowAnchorItem
         color: "#dd94da"
//         color:"#FFE4B5"
       }

       // back button to leave scene
       MenuButton {
         text: "Back to menu"
         // anchor the button to the gameWindowAnchorItem to be on the edge of the screen on any device
         anchors.right: gameScene.gameWindowAnchorItem.right
         anchors.rightMargin: 10
         anchors.top: gameScene.gameWindowAnchorItem.top
         anchors.topMargin: 10
         onClicked: {
           backButtonPressed()
           activeLevel = undefined
           activeLevelFileName = ""
         }
       }
       Text {
          anchors.left: gameScene.gameWindowAnchorItem.left
          anchors.leftMargin: 10
          anchors.top: gameScene.gameWindowAnchorItem.top
          anchors.topMargin: 10
          color: "white"
          font.pixelSize: 20
          text: activeLevel !== undefined ? activeLevel.levelName : ""
//          text:"hahaha"
        }
       // load levels at runtime
       Loader {
         id: loader
         source: activeLevelFileName !== "" ? "../qml/" + activeLevelFileName : ""
//         source: activeLevelFileName !== "" ? activeLevelFileName : ""
//         source:"../qml/Level1.qml"
         onLoaded: {
           // since we did not define a width and height in the level item itself, we are doing it here
           item.width = gameScene.width
           item.height = gameScene.height
           // store the loaded level as activeLevel for easier access
           activeLevel = item
         }
       }
       Connections {
           // only connect if a level is loaded, to prevent errors
           target: activeLevel !== undefined ? activeLevel : null
           // increase the score when the rectangle is clicked
           onRectanglePressed: {
             score++
           }
         }
}
