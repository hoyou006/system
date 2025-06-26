import QtQuick 2.15

Rectangle {
    id: root
    required property int buttonIndex
    required property QtObject stateManager
    property alias text: label.text
    signal clicked()

    height: 42
    radius: 4
    color: root.stateManager.currentIndex === buttonIndex ? "white" : "transparent"

    Text {
        id: label
        anchors.centerIn: parent
        color: root.stateManager.currentIndex === buttonIndex ? "black" : "white"
        font.pixelSize: 16
    }

    MouseArea {
        anchors.fill: parent
        onClicked: root.clicked()
    }
}
