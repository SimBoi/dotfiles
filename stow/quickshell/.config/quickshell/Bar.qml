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
        property bool expanded: false
        property bool popped: false
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

        MouseArea {
            id: hoverArea
            property bool hovered: false
            anchors.fill: parent
            hoverEnabled: true
            onEntered: {
                hovered = true;
                barPanel.expand();
                compactTimer.stop();
            }
            onExited: compactTimer.restart()
            Timer {
                id: compactTimer
                interval: 1000
                onTriggered: {
                    hoverArea.hovered = false;
                    barPanel.compact();
                }
            }
        }

        PanelWindow {
            id: popoutDismissalArea
            visible: barPanel.popped
            anchors {
                top: true
                left: true
                right: true
                bottom: true
            }
            color: "transparent"
            mask: Region {
                item: dynamicBar
                intersection: Intersection.Xor
            }
            exclusionMode: ExclusionMode.Ignore
            MouseArea {
                anchors.fill: parent
                onClicked: barPanel.attach()
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

            Rectangle {
                id: dynamicPopoutPanel
                color: "black"
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.bottom: parent.bottom
                implicitHeight: 100
                implicitWidth: 100
            }
        }

        Item {
            id: compactBarWidgets
            anchors.fill: dynamicBar
            visible: !barPanel.expanded

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
            visible: barPanel.expanded

            ExpandedBarClockWidget {
                anchors.centerIn: parent
            }
        }

        function compact() {
            if (!barPanel.expanded || barPanel.popped)
                return;

            barPanel.expanded = false;
            dynamicBar.implicitHeight = dynamicBar.compactHeight;
        }

        function expand() {
            if (barPanel.expanded || barPanel.popped)
                return;

            barPanel.expanded = true;
            dynamicBar.implicitHeight = dynamicBar.expandedHeight;
        }

        function pop() {
            if (barPanel.popped)
                return;
            barPanel.popped = true;
            dynamicBar.implicitHeight = dynamicBar.expandedHeight;
            dynamicPopoutPanel.anchors.top = dynamicBar.bottom
        }

        function attach() {
            if (!barPanel.popped)
                return;
            barPanel.popped = false;
            if (hoverArea.hovered)
                barPanel.expand();
            else
                barPanel.compact();
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
