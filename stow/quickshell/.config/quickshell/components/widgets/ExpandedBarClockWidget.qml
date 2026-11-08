pragma ComponentBehavior: Bound
import QtQuick

Rectangle {
    implicitHeight: 50
    implicitWidth: 300
    radius: 100

    Text {
        anchors.centerIn: parent
        text: "test"

        MouseArea {
            anchors.fill: parent
            onClicked: barPanel.pop()
        }
    }
}
