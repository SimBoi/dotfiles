pragma ComponentBehavior: Bound
import QtQuick
import Quickshell
import Quickshell.Widgets
import Quickshell.Hyprland

Item {
    id: root

    implicitWidth: 1000
    implicitHeight: 20
    property real gapSize: 4
    property string highlightedColor: "white"
    property string neutralColor: "gray"
    readonly property real workspaceBarSize: (width - gapSize * 5) / 6

    WrapperMouseArea {
        property int scrollAccumulatedY: 0

        onWheel: event => {
            if (Math.sign(event.angleDelta.y) !== Math.sign(scrollAccumulatedY))
                scrollAccumulatedY = 0;
            scrollAccumulatedY += event.angleDelta.y;

            if (Math.abs(scrollAccumulatedY) >= 120) {
                const delta = scrollAccumulatedY > 0 ? -1 : 1;
                Hyprland.dispatch(`hl.dsp.focus({workspace=${Hyprland.focusedWorkspace.id + delta}})`);
                scrollAccumulatedY = 0;
                wheel.accepted = true;
            }
        }

        Row {
            anchors.centerIn: parent

            component WorkspaceIndicator: Rectangle {
                id: workspaceIndicator
                required property int workspaceId

                anchors.verticalCenter: parent.verticalCenter
                radius: 100
                width: root.workspaceBarSize
                height: Hyprland.focusedWorkspace.id == workspaceId ? root.height : (root.height / 2)
                color: Hyprland.focusedWorkspace.id == workspaceId ? root.highlightedColor : root.neutralColor

                MouseArea {
                    width: root.workspaceBarSize + root.gapSize
                    height: root.height

                    onClicked: Hyprland.dispatch(`hl.dsp.focus({workspace=${workspaceIndicator.workspaceId}})`)
                }
            }
            component Gap: Item {
                width: root.gapSize
                height: 1
            }

            WorkspaceIndicator { workspaceId: 1 }
            Gap {}
            WorkspaceIndicator { workspaceId: 2 }
            Gap {}
            WorkspaceIndicator { workspaceId: 3 }
            Gap {}
            WorkspaceIndicator { workspaceId: 4 }
            Gap {}
            WorkspaceIndicator { workspaceId: 5 }
            Gap {}
            WorkspaceIndicator { workspaceId: 6 }
        }
    }
}
