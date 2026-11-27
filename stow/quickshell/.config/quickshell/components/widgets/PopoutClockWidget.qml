pragma ComponentBehavior: Bound
import QtQuick

Rectangle {
    implicitHeight: 50
    implicitWidth: 400
    radius: 100

    Text {
        anchors.centerIn: parent
        text: "test"
        color: "pink"

        MouseArea {
            anchors.fill: parent
            onClicked: barState.dismissPopout()
        }
    }
}
