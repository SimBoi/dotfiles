pragma ComponentBehavior: Bound
import QtQuick
import qs.components.basic

Rectangle {
    id: root
    implicitHeight: 30
    implicitWidth: 30
    radius: 100

    StyledText {
        anchors.centerIn: parent
        text: "\uf011"
    }

    HoverHandler {
        onHoveredChanged: {
            if (hovered)
                barState.hoverButton("components/widgets/PopoutClockWidget.qml", root);
            else
                barState.unhoverButton()
        }
    }
}
