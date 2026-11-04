pragma ComponentBehavior: Bound
import QtQuick
import Quickshell
import qs.components.widgets
import qs.components.basic
import Quickshell.Wayland

Scope {
    id: root
    property int compactBarHeight: 12
    property int expandedBarHeight: 40

    // bar
    PanelWindow {
        anchors {
            top: true
            left: true
            right: true
        }
        exclusiveZone: root.compactBarHeight
        color: "transparent"
        mask: Region {
            item: dynamicBar
        }

        // dynamic bar
        Rectangle {
            id: dynamicBar
            property bool hovered

            implicitWidth: parent.width
            implicitHeight: hovered ? root.expandedBarHeight : root.compactBarHeight
            color: "black"

            MouseArea {
                anchors.fill: parent
                hoverEnabled: true
                onEntered: dynamicBar.hovered = true
                onExited: dynamicBar.hovered = false
            }
        }

        // compact bar widgets
        Item {
            anchors.centerIn: parent
            anchors.fill: parent
            visible: !dynamicBar.hovered

            CompactBarClockWidget {
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.top
                implicitWidth: Screen.width / 3
                implicitHeight: 40
                dotSize: 10
                handWidth: 10
            }

            CompactBarWorkspacesWidget {
                anchors.verticalCenter: parent.top
                anchors.left: parent.left
                anchors.leftMargin: Screen.width / 9
                implicitWidth: Screen.width / 9
                implicitHeight: 20
                gapSize: 4
            }

            CompactBarBatteryWidget {
                anchors.verticalCenter: parent.top
                anchors.right: parent.right
                anchors.rightMargin: Screen.width / 9
                valueBarWidth: Screen.width / 9
                valueBarHeight: 10
                showStopPoint: false
            }
        }

        // expanded bar widgets
        Item {
            anchors.centerIn: parent
            anchors.fill: parent
            visible: dynamicBar.hovered
        }
    }

    // screen corners
    PanelWindow {
        id: screenCorners
        property int implicitSize: 20

        color: "transparent"
        anchors {
            top: true
            left: true
            right: true
            bottom: true
        }
        mask: Region {}

        RoundedCorner {
            corner: RoundedCorner.CornerEnum.TopLeft
            implicitSize: screenCorners.implicitSize
            anchors.top: parent.top
            anchors.left: parent.left
            anchors.topMargin: dynamicBar.hovered ? root.expandedBarHeight - root.compactBarHeight : 0
        }
        RoundedCorner {
            corner: RoundedCorner.CornerEnum.TopRight
            implicitSize: screenCorners.implicitSize
            anchors.top: parent.top
            anchors.right: parent.right
            anchors.topMargin: dynamicBar.hovered ? root.expandedBarHeight - root.compactBarHeight : 0
        }
        RoundedCorner {
            corner: RoundedCorner.CornerEnum.BottomLeft
            implicitSize: screenCorners.implicitSize
            anchors.bottom: parent.bottom
            anchors.left: parent.left
        }
        RoundedCorner {
            corner: RoundedCorner.CornerEnum.BottomRight
            implicitSize: screenCorners.implicitSize
            anchors.bottom: parent.bottom
            anchors.right: parent.right
        }
    }
}
