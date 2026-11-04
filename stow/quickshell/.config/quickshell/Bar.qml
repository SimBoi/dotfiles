pragma ComponentBehavior: Bound
import QtQuick
import Quickshell
import qs.components.widgets
import qs.components.basic
import Quickshell.Wayland

Scope {
    enum BarState {
        Compact,
        Expanded,
        Popped
    }

    // bar
    PanelWindow {
        anchors {
            top: true
            left: true
            right: true
        }
        exclusiveZone: dynamicBar.compactHeight
        color: "transparent"
        mask: Region {
            item: dynamicBar
        }
        implicitHeight: 500

        // dynamic bar
        Rectangle {
            id: dynamicBar
            property var state: BarState.Compact
            property bool hovered: false
            property int compactHeight: 12
            property int expandedHeight: 200

            color: "black"
            implicitWidth: 1000
            implicitHeight: 20
            anchors.top: parent.top
            anchors.horizontalCenter: parent.horizontalCenter

            Timer {
                id: hoverDelayTimer
                interval: 1000
                triggeredOnStart: true
                onTriggered: {
                    hovered = false;
                    compact();
                }
            }

            MouseArea {
                anchors.fill: parent
                hoverEnabled: true
                onEntered: {
                    hovered = true;
                    expand();
                    hoverDelayTimer.stop();
                }
                onExited: hoverDelayTimer.restart()
            }

            function compact() {
                if (state.Popped)
                    return;

                state = BarState.Compact;
                anchors.topMargin = 0;
                implicitWidth = parent.width;
                implicitHeight = compactHeight;
            }

            function expand() {
                if (state.Popped)
                    return;

                state = BarState.Expanded;
                anchors.topMargin = 0;
                implicitWidth = parent.width;
                implicitHeight = expandedHeight;
            }

            function pop() {
                state = BarState.Popped;
                color = "white"
                anchors.topMargin = 100;
                implicitWidth = 300;
                implicitHeight = 200;
            }

            function attach() {
                if (hovered)
                    expand();
                else
                    compact();
            }
        }

        // compact bar widgets
        Item {
            anchors.fill: dynamicBar
            visible: dynamicBar.state == BarState.Compact

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
            anchors.fill: dynamicBar
            visible: dynamicBar.state == BarState.Expanded

            ExpandedBarClockWidget {
                anchors.centerIn: parent
            }
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
            anchors.topMargin: {
                if (dynamicBar.state == BarState.Compact || dynamicBar.state == BarState.Expanded)
                    return dynamicBar.height;
                return 0;
            }
        }
        RoundedCorner {
            corner: RoundedCorner.CornerEnum.TopRight
            implicitSize: screenCorners.implicitSize
            anchors.top: parent.top
            anchors.right: parent.right
            anchors.topMargin: {
                if (dynamicBar.state == BarState.Compact || dynamicBar.state == BarState.Expanded)
                    return dynamicBar.height;
                return 0;
            }
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
