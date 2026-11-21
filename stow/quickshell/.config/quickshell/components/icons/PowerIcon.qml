// Generated from SVG file mode_off_on_24dp_E3E3E3_FILL0_wght400_GRAD0_opsz24.svg
import QtQuick
import QtQuick.VectorImage
import QtQuick.VectorImage.Helpers
import QtQuick.Shapes
import QtQuick.Effects

Item {
    implicitWidth: 24
    implicitHeight: 24
    component AnimationsInfo : QtObject
    {
        property bool paused: false
        property int loops: 1
        signal restart()
    }
    property AnimationsInfo animations : AnimationsInfo {}
    Item {
        width: 1
        height: 1
        ItemSpy { id: __qt_toplevel_scale_itemspy; anchors.fill: parent }
    }
    transform: [
        Scale { xScale: width / 24; yScale: height / 24 }
    ]
    id: __qt_toplevel
    Shape {
        id: _qt_node0
        transformOrigin: Item.TopLeft
        ShapePath {
            id: _qt_node1_fill_stroke
            strokeColor: "transparent"
            fillColor: "#ffe3e3e3"
            fillRule: ShapePath.WindingFill
            PathSvg { path: "M 11.29 11.71 C 11.0967 11.5233 11 11.2867 11 11 L 11 3 C 11 2.71333 11.0967 2.47667 11.29 2.29 C 11.4833 2.10333 11.72 2.00667 12 2 C 12.28 1.99333 12.5167 2.09 12.71 2.29 C 12.9033 2.49 13 2.72667 13 3 L 13 11 C 13 11.28 12.9033 11.5167 12.71 11.71 C 12.5167 11.9033 12.28 12 12 12 C 11.72 12 11.4833 11.9033 11.29 11.71 M 8.49 20.29 C 7.39667 19.8167 6.44667 19.1733 5.64 18.36 C 4.83333 17.5467 4.19 16.5967 3.71 15.51 C 3.23 14.4233 2.99333 13.2533 3 12 C 3 10.98 3.16667 9.99333 3.5 9.04 C 3.83333 8.08667 4.31667 7.20667 4.95 6.4 C 5.13667 6.16667 5.37 6.05333 5.65 6.06 C 5.93 6.06667 6.18 6.18 6.4 6.4 C 6.58667 6.58667 6.67 6.81 6.65 7.07 C 6.63 7.33 6.54 7.58 6.38 7.82 C 5.92667 8.42667 5.58333 9.08667 5.35 9.8 C 5.11667 10.52 5 11.2533 5 12 C 5 13.9467 5.68 15.6 7.04 16.96 C 8.4 18.32 10.0533 19 12 19 C 13.9467 19 15.6 18.32 16.96 16.96 C 18.32 15.6067 19 13.9533 19 12 C 19 11.2333 18.8867 10.4867 18.66 9.76 C 18.4333 9.03333 18.08 8.37 17.6 7.77 C 17.4333 7.55667 17.34 7.32 17.32 7.06 C 17.3 6.8 17.3867 6.58 17.58 6.4 C 17.78 6.2 18.0233 6.09667 18.31 6.09 C 18.5967 6.08333 18.8267 6.18667 19 6.4 C 19.6533 7.2 20.15 8.07667 20.49 9.03 C 20.83 9.98333 21 10.9733 21 12 C 21 13.2533 20.7633 14.4233 20.29 15.51 C 19.8167 16.5967 19.1733 17.5467 18.36 18.36 C 17.5467 19.1733 16.5967 19.8167 15.51 20.29 C 14.4233 20.7633 13.2533 21 12 21 C 10.7467 21 9.57667 20.7633 8.49 20.29 " }
        }
    }
}
