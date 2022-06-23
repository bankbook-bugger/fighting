import Felgo 3.0
import QtQuick 2.0

GameWindow {
  id: gameWindow

  // create and remove entities at runtime


  GameScene{
    id: gameScene
    onBackButtonPressed: gameWindow.state = "selectLevel"
  }

  SelectLevelScene {
    id: selectLevelScene
    onLevelPressed: {
      // selectedLevel is the parameter of the levelPressed signal
      gameScene.setLevel(selectedLevel)
      gameWindow.state = "game"

    }
    onBackButtonPressed: gameWindow.state = "menu"
  }

    //...

    // default state is menu -> default scene is menuScene
    state: "selectLevel"
    activeScene: selectLevelScene
    // state machine, takes care reversing the PropertyChanges when changing the state like changing the opacity back to 0
    states: [
      State {
        name: "menu"
        PropertyChanges {target: menuScene; opacity: 1}
        PropertyChanges {target: gameWindow; activeScene: menuScene}
      },
      State {
        name: "selectLevel"
        PropertyChanges {target: selectLevelScene; opacity: 1}
        PropertyChanges {target: gameWindow; activeScene: selectLevelScene}
      },
      State {
        name: "credits"
        PropertyChanges {target: creditsScene; opacity: 1}
        PropertyChanges {target: gameWindow; activeScene: creditsScene}
      },
      State {
        name: "game"
        PropertyChanges {target: gameScene; opacity: 1}
        PropertyChanges {target: gameWindow; activeScene: gameScene}
      }
    ]

}
