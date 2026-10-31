import QtQuick
import Quickshell
import qs.components.widgets
import Quickshell.Wayland

Scope {
    // bar
    PanelWindow {
        implicitHeight: 12
        color: "black"
        WlrLayershell.layer: WlrLayer.Bottom
        anchors {
            top: true
            left: true
            right: true
        }
    }

    // widgets
    PanelWindow {
        id: root

        anchors {
            top: true
            left: true
            right: true
        }
        exclusionMode: ExclusionMode.Ignore
        color: "transparent"
        implicitHeight: 20

        LinearClockWidget {
            anchors.horizontalCenter: parent.horizontalCenter
            width: 700
        }
    }
}
