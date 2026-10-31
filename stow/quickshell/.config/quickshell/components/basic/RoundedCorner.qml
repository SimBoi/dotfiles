pragma ComponentBehavior: Bound
import QtQuick
import QtQuick.Shapes

Item {
    id: root

    enum CornerEnum { TopLeft, TopRight, BottomLeft, BottomRight }

    property var corner: RoundedCorner.CornerEnum.TopLeft
    property int implicitSize: 25
    property color color: "black"

    implicitWidth: implicitSize
    implicitHeight: implicitSize

    Shape {
        id: shape
        anchors {
            top: root.isTop ? parent.top : undefined
            bottom: root.isBottom ? parent.bottom : undefined
            left: root.isLeft ? parent.left : undefined
            right: root.isRight ? parent.right : undefined
        }
        layer.enabled: true
        layer.smooth: true
        preferredRendererType: Shape.CurveRenderer

        ShapePath {
            id: shapePath
            strokeWidth: 0
            fillColor: root.color
            pathHints: ShapePath.PathSolid & ShapePath.PathNonIntersecting

            startX: switch (root.corner) {
                case RoundedCorner.CornerEnum.TopLeft:
                case RoundedCorner.CornerEnum.BottomLeft: return 0;
                case RoundedCorner.CornerEnum.TopRight:
                case RoundedCorner.CornerEnum.BottomRight: return root.implicitSize;
            }
            startY: switch (root.corner) {
                case RoundedCorner.CornerEnum.TopLeft:
                case RoundedCorner.CornerEnum.TopRight: return 0;
                case RoundedCorner.CornerEnum.BottomLeft:
                case RoundedCorner.CornerEnum.BottomRight: return root.implicitSize;
            }
            PathAngleArc {
                moveToStart: false
                centerX: root.implicitSize - shapePath.startX
                centerY: root.implicitSize - shapePath.startY
                radiusX: root.implicitSize
                radiusY: root.implicitSize
                startAngle: switch (root.corner) {
                    case RoundedCorner.CornerEnum.TopLeft: return 180;
                    case RoundedCorner.CornerEnum.TopRight: return -90;
                    case RoundedCorner.CornerEnum.BottomLeft: return 90;
                    case RoundedCorner.CornerEnum.BottomRight: return 0;
                }
                sweepAngle: 90
            }
            PathLine {
                x: shapePath.startX
                y: shapePath.startY
            }
        }
    }
}
