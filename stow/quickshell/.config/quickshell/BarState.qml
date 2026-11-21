pragma ComponentBehavior: Bound
import QtQuick
import Quickshell

Item {
    id: barState
    enum BarState {
        Compact,
        Expanded,
        CompactTimer,
        Hovered,
        AttachTimer,
        Popped
    }
    property var state: BarState.Compact
    property bool buttonHovering: false
    property bool popping: false

    HoverHandler {
        id: barHoverArea
        parent: dynamicBar
        enabled: state == BarState.Compact || state == BarState.CompactTimer || state == BarState.Expanded
        onHoveredChanged: updateState()
    }

    HoverHandler {
        id: popoutHoverArea
        parent: dynamicPopoutPanel
        enabled: state == BarState.Hovered || state == BarState.AttachTimer
        onHoveredChanged: updateState()
    }

    Timer {
        id: compactTimer
        property bool triggering: false
        interval: 1000
        running: state == BarState.CompactTimer
        onTriggered: {
            triggering = true;
            updateState();
            triggering = false;
        }
    }

    Timer {
        id: attachTimer
        property bool triggering: false
        interval: 500
        running: state == BarState.AttachTimer
        onTriggered: {
            triggering = true;
            updateState();
            triggering = false;
        }
    }

    PanelWindow {
        id: popoutDismissArea
        property bool triggering: false
        visible: state == BarState.Popped
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
            Region {
                item: dynamicPopoutPanel
            }
        }
        exclusionMode: ExclusionMode.Ignore
        MouseArea {
            anchors.fill: parent
            preventStealing: true
            onClicked: {
                popoutDismissArea.triggering = true;
                updateState();
                popoutDismissArea.triggering = false;
            }
        }
    }

    function updateState() {
        // transition
        switch (state) {
        case BarState.Compact:
            if (barHoverArea.hovered)
                state = BarState.Expanded;
            else
                return;
            break;
        case BarState.Expanded:
            if (!barHoverArea.hovered)
                state = BarState.CompactTimer;
            else if (buttonHovering)
                state = BarState.Hovered;
            else if (popping)
                state = BarState.Popped;
            else
                return;
            break;
        case BarState.CompactTimer:
            if (compactTimer.triggering)
                state = BarState.Compact;
            else if (barHoverArea.hovered)
                state = BarState.Expanded;
            else
                return;
            break;
        case BarState.Hovered:
            if (!buttonHovering && !popoutHoverArea.hovered)
                state = BarState.AttachTimer;
            else if (popping)
                state = BarState.Popped;
            else
                return;
            break;
        case BarState.AttachTimer:
            if (buttonHovering || popoutHoverArea.hovered)
                state = BarState.Hovered;
            else if (attachTimer.triggering)
                state = BarState.Expanded;
            else
                return;
            break;
        case BarState.Popped:
            if (popoutDismissArea.triggering)
                state = BarState.Expanded;
            else
                return;
            break;
        }

        console.log(state);

        // apply state
        switch (state) {
        case BarState.Compact:
            dynamicBar.implicitHeight = dynamicBar.compactHeight;
            break;
        case BarState.Expanded:
            dynamicBar.implicitHeight = dynamicBar.expandedHeight;
            dynamicPopoutPanel.anchors.top = undefined;
            dynamicPopoutPanel.anchors.bottom = dynamicBar.bottom;
            dynamicPopoutLoader.source = "";
            break;
        case BarState.CompactTimer:
            break;
        case BarState.Hovered:
            dynamicPopoutPanel.anchors.bottom = undefined;
            dynamicPopoutPanel.anchors.top = dynamicBar.bottom;
            break;
        case BarState.AttachTimer:
            break;
        case BarState.Popped:
            dynamicPopoutPanel.anchors.bottom = undefined;
            dynamicPopoutPanel.anchors.top = dynamicBar.bottom;
            break;
        }

        // chain transisions
        updateState();
    }

    function pop(popout) {
        popping = true;
        updateState();
        popping = false;
        if (state != BarState.Popped)
            return;
        dynamicPopoutLoader.source = popout;
        dynamicPopoutPanel.x = (dynamicBar.width - dynamicPopoutPanel.width) / 2;
    }

    function hoverButton(popout, button) {
        buttonHovering = true;
        updateState();
        if (state != BarState.Hovered)
            return;
        dynamicPopoutLoader.source = popout;
        var newX = button.parent.mapToItem(dynamicPopoutPanel.parent, button.x, 0).x;
        dynamicPopoutPanel.x = newX + (button.width - dynamicPopoutPanel.width) / 2;
    }

    function unhoverButton() {
        buttonHovering = false;
        updateState();
    }

    function dismissPopout() {
        popoutDismissArea.triggering = true;
        updateState();
        popoutDismissArea.triggering = false;
    }
}
