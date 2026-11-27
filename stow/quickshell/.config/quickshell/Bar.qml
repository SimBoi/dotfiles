pragma ComponentBehavior: Bound
import QtQuick
import Quickshell
import qs.components.widgets
import qs.components.basic
import Quickshell.Wayland
import Quickshell.Hyprland

Scope {
    PanelWindow {
        id: barPanel
        anchors {
            top: true
            left: true
            right: true
        }
        exclusiveZone: dynamicBar.compactHeight
        color: "transparent"
        mask: Region {
            item: dynamicBar
            Region {
                item: dynamicPopoutPanel
            }
        }
        implicitHeight: Screen.height

        BarState {
            id: barState
        }

        Rectangle {
            id: dynamicPopoutPanel
            color: "black"
            anchors.bottom: dynamicBar.bottom
            height: dynamicPopoutLoader.height + 200
            width: dynamicPopoutLoader.width + 200
            x: dynamicBar.x + (dynamicBar.width - width) / 2

            Loader {
                id: dynamicPopoutLoader
                anchors.centerIn: parent
            }
        }

        Rectangle {
            id: dynamicBar
            property int compactHeight: 12
            property int expandedHeight: 50

            color: "black"
            implicitWidth: parent.width
            implicitHeight: compactHeight
            anchors.top: parent.top
            anchors.horizontalCenter: parent.horizontalCenter
        }

        Item {
            id: compactBarWidgets
            anchors.fill: dynamicBar
            visible: barState.state == BarState.Compact

            CompactBarClockWidget {
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.top
            }

            CompactBarWorkspacesWidget {
                anchors.verticalCenter: parent.top
                anchors.left: parent.left
                anchors.leftMargin: Screen.width / 9
            }

            CompactBarBatteryWidget {
                anchors.verticalCenter: parent.top
                anchors.right: parent.right
                anchors.rightMargin: Screen.width / 9
            }
        }

        Item {
            id: expandedBarWidgets
            anchors.fill: dynamicBar
            visible: barState.state != BarState.Compact

            Row {
                anchors.left: parent.left
                layoutDirection: Qt.LeftToRight
                spacing: 10
                padding: 10
                ExpandedBarPowerWidget {}
            }
            Row {
                anchors.centerIn: parent
                layoutDirection: Qt.LeftToRight
                spacing: 10
                padding: spacing
                ExpandedBarClockWidget {}
            }
            Row {
                anchors.right: parent.right
                layoutDirection: Qt.RightToLeft
                spacing: 10
                padding: spacing
                ExpandedBarSystemMonitorWidget {}
                StyledText {
                    text: "Hello \uf4bc"
                }
            }
        }
    }

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
        exclusionMode: ExclusionMode.Ignore
        mask: Region {}

        RoundedCorner {
            corner: RoundedCorner.CornerEnum.TopLeft
            implicitSize: screenCorners.implicitSize
            anchors.top: parent.top
            anchors.left: parent.left
            anchors.topMargin: dynamicBar.height
        }
        RoundedCorner {
            corner: RoundedCorner.CornerEnum.TopRight
            implicitSize: screenCorners.implicitSize
            anchors.top: parent.top
            anchors.right: parent.right
            anchors.topMargin: dynamicBar.height
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
