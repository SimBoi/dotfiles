import QtQuick
import Quickshell
import qs.components.basic

Scope {
    id: root
    property int implicitSize: 20

    component RoundedScreenCornerPanel: PanelWindow {
        id: roundedScreenCornerPanel

        property var corner

        implicitWidth: root.implicitSize
        implicitHeight: root.implicitSize
        color: "transparent"
        anchors {
            top: corner == RoundedCorner.CornerEnum.TopLeft || corner == RoundedCorner.CornerEnum.TopRight
            left: corner == RoundedCorner.CornerEnum.TopLeft || corner == RoundedCorner.CornerEnum.BottomLeft
            right: corner == RoundedCorner.CornerEnum.TopRight || corner == RoundedCorner.CornerEnum.BottomRight
            bottom: corner == RoundedCorner.CornerEnum.BottomLeft || corner == RoundedCorner.CornerEnum.BottomRight
        }

        RoundedCorner {
            id: roundedCorner
            corner: roundedScreenCornerPanel.corner
            implicitSize: root.implicitSize
        }
    }

    RoundedScreenCornerPanel {
        corner: RoundedCorner.CornerEnum.TopLeft
    }
    RoundedScreenCornerPanel {
        corner: RoundedCorner.CornerEnum.TopRight
    }
    RoundedScreenCornerPanel {
        corner: RoundedCorner.CornerEnum.BottomLeft
    }
    RoundedScreenCornerPanel {
        corner: RoundedCorner.CornerEnum.BottomRight
    }
}
