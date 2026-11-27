pragma ComponentBehavior: Bound
import QtQuick
import qs.components.basic

Rectangle {
    implicitHeight: 30
    implicitWidth: styledText.width
    radius: 100
    color: "grey"

    StyledText {
        id: styledText
        anchors.centerIn: parent
        text: "\uf011 \uf011"
    }
}
