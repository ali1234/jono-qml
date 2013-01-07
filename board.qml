import QtQuick 2.0
import QtMultimedia 5.0

Item {
    id: main

    width: 300
    height: 400

    ListModel {
      id: heads
      ListElement{
        assets: "assets/jono"
        sounds: 8
      }
      ListElement{
        assets: "assets/jono"
        sounds: 8
      }
      ListElement{
        assets: "assets/jono"
        sounds: 8
      }
      ListElement{
        assets: "assets/jono"
        sounds: 8
      }
      ListElement{
        assets: "assets/jono"
        sounds: 8
      }
    }

    ListView {
      anchors.fill: parent
      orientation: ListView.Horizontal
      snapMode: ListView.SnapOneItem
      model: heads
      delegate: Talker { 
        assets: model.assets
        sounds: model.sounds
      }
      focus: false
    }
}
