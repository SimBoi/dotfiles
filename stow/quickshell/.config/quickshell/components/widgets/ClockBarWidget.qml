pragma ComponentBehavior: Bound
import QtQuick
import Quickshell

Item {
    id: root

    property int dotSize: 10
    property int handWidth: 10
    readonly property real gapSize: (width - dotSize * 13) / 12
    implicitWidth: 1000
    implicitHeight: 40

    SystemClock {
        id: clock
        precision: SystemClock.Minutes
        property bool isPM: hours >= 12
        property int minutesSinceMidnightOrNoon: hours * 60 + minutes - (isPM ? 720 : 0)
    }

    Row {
        anchors.centerIn: parent
        width: parent.width

        component HourNotch: Rectangle {
            radius: 100
            width: root.dotSize
            implicitHeight: root.dotSize
        }
        component Gap: Item {
            width: root.gapSize
            implicitHeight: 1 
        }

        HourNotch { color: "white" }
        Gap {}
        HourNotch { color: "gray" }
        Gap {}
        HourNotch { color: "gray" }
        Gap {}
        HourNotch { color: "white" }
        Gap {}
        HourNotch { color: "gray" }
        Gap {}
        HourNotch { color: "gray" }
        Gap {}
        HourNotch { color: "white" }
        Gap {}
        HourNotch { color: "gray" }
        Gap {}
        HourNotch { color: "gray" }
        Gap {}
        HourNotch { color: "white" }
        Gap {}
        HourNotch { color: "gray" }
        Gap {}
        HourNotch { color: "gray" }
        Gap {}
        HourNotch { color: "white" }
    }

    Rectangle {
        anchors.verticalCenter: parent.verticalCenter
        anchors.left: parent.left
        anchors.leftMargin: (root.width - root.dotSize) * (clock.minutesSinceMidnightOrNoon / 720)
        radius: 100; width: root.handWidth; implicitHeight: root.implicitHeight
        color: clock.isPM ? "orange" : "purple"
    }
}
