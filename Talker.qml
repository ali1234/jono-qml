import QtQuick 2.0
import QtMultimedia 5.0

Item {

    anchors.fill: parent

    property string assets: "assets/jono"
    property int sounds: 1

    Image {
      id: shadow
      source: assets + "/shadow.png"
      fillMode: Image.PreserveAspectFit
      anchors.fill: parent
    }

    Image {
      id: face
      state: "RELEASED"
      source: assets + "/face.png"
      fillMode: Image.PreserveAspectFit
      anchors.fill: parent
    }

    Timer {
      id: facetimer
      interval: 500; running: false; repeat: false
      onTriggered: {
        face.source = assets + "/face.png"
      }
    }

    property real head_rotation
  
    MouseArea {
      anchors.fill: parent

      MediaPlayer {
        id: media
      }

      property int sound: 0

      onPressed: { 
        media.stop();
        sound = Math.floor(Math.random()*sounds);
        media.source = assets + "/" + sound + ".ogg";
        facetimer.stop();
        face.source = assets + "/face1.png"
        facetimer.interval = 500; // media.duration; // media duration not available on all ogg files.
        console.log(media.duration);
        facetimer.start();
        media.play();
        parent.head_rotation = ((Math.random() - 0.5) * 25.0);
        parent.state = "PRESSED";
      }

      onReleased: { 
        parent.state = "RELEASED";
      }

      onCanceled: { 
        parent.state = "RELEASED";
      }

    }

    state: "RELEASED"

    states: [
      State {
        name: "PRESSED"
        PropertyChanges { target: face; scale: 0.85; rotation: head_rotation }
        PropertyChanges { target: shadow; scale: 0.85 }
      },
      State {
        name: "RELEASED"
        PropertyChanges { target: face; scale: 1.0; rotation: 0 }
        PropertyChanges { target: shadow; scale: 1.0; }
      }
    ]

    transitions: [
      Transition {
        from: "RELEASED"
        to: "PRESSED"
        PropertyAnimation { target: face; properties: "scale"; easing.type: Easing.InOutQuad; duration: 50 }
        RotationAnimation { target: face; easing.type: Easing.InOutQuad; duration: 50 }
        PropertyAnimation { target: shadow; properties: "scale"; easing.type: Easing.InOutQuad; duration: 50 }
      },
      Transition {
        from: "PRESSED"
        to: "RELEASED"
        PropertyAnimation { target: face; properties: "scale"; easing.type: Easing.InOutQuad; duration: 300 }
        RotationAnimation { target: face; easing.type: Easing.InOutQuad; duration: 100 }
        PropertyAnimation { target: shadow; properties: "scale"; easing.type: Easing.InOutQuad; duration: 300 }
      }
    ]
}
