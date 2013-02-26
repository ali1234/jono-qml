import QtQuick 2.0
import Ubuntu.Components 0.1
import QtMultimedia 5.0

MainView {
    // objectName for functional testing purposes (autopilot-qt5)
    objectName: "mainView"
    applicationName: Jono

    width: units.gu(100)
    height: units.gu(75)

    Talker{
        assets: "assets/jono"
        sounds: 8
    }
}
