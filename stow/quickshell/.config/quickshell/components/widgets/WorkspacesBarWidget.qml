pragma ComponentBehavior: Bound
import QtQuick
import Quickshell
import qs.components.basic
import Quickshell.Hyprland

Item {
    id: root

    width: 1000
    height: 20
    property real gapSize: 4
    property string highlightedColor: "white"
    property string neutralColor: "gray"
    readonly property real workspaceBarSize: (width - gapSize * 5) / 6

    Row {
        anchors.centerIn: parent
        width: parent.width

        Rectangle {
            radius: 100; width: workspaceBarSize; height: root.height
            color: Hyprland.focusedWorkspace.id == 1 ? highlightedColor : neutralColor
        }
        Item { width: gapSize; height: 1 }
        Rectangle {
            radius: 100; width: workspaceBarSize; height: root.height
            color: Hyprland.focusedWorkspace.id == 2 ? highlightedColor : neutralColor
        }
        Item { width: gapSize; height: 1 }
        Rectangle {
            radius: 100; width: workspaceBarSize; height: root.height
            color: Hyprland.focusedWorkspace.id == 3 ? highlightedColor : neutralColor
        }
        Item { width: gapSize; height: 1 }
        Rectangle {
            radius: 100; width: workspaceBarSize; height: root.height
            color: Hyprland.focusedWorkspace.id == 4 ? highlightedColor : neutralColor
        }
        Item { width: gapSize; height: 1 }
        Rectangle {
            radius: 100; width: workspaceBarSize; height: root.height
            color: Hyprland.focusedWorkspace.id == 5 ? highlightedColor : neutralColor
        }
        Item { width: gapSize; height: 1 }
        Rectangle {
            radius: 100; width: workspaceBarSize; height: root.height
            color: Hyprland.focusedWorkspace.id == 6 ? highlightedColor : neutralColor
        }
    }
}
