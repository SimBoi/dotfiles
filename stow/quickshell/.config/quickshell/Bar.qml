pragma ComponentBehavior: Bound
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

        ClockBarWidget {
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.top
            implicitWidth: Screen.width / 3
            implicitHeight: 40
            dotSize: 10
            handWidth: 10
        }

        WorkspacesBarWidget {
            anchors.verticalCenter: parent.top
            anchors.left: parent.left
            anchors.leftMargin: Screen.width / 9
            implicitWidth: Screen.width / 9
            implicitHeight: 20
            gapSize: 4
        }

        BatteryBarWidget {
            anchors.verticalCenter: parent.top
            anchors.right: parent.right
            anchors.rightMargin: Screen.width / 9
            valueBarWidth: Screen.width / 9
            valueBarHeight: 10
            showStopPoint: false
        }
    }
}
