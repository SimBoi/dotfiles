pragma ComponentBehavior: Bound
import QtQuick
import qs.components.icons

Rectangle {
    id: root
    implicitHeight: 30
    implicitWidth: 30
    radius: 100

    PowerIcon {
        anchors.centerIn: parent
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
