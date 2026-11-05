pragma ComponentBehavior: Bound
import QtQuick
import Quickshell

Item {
    id: root

    property int dotSize: 10
    property int handWidth: 10
    readonly property real gapSize: (width - dotSize * 13) / 12
    implicitWidth: Screen.width / 3
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

        BoldHourNotch {}
        Gap {}
        HourNotch {}
        Gap {}
        HourNotch {}
        Gap {}
        BoldHourNotch {}
        Gap {}
        HourNotch {}
        Gap {}
        HourNotch {}
        Gap {}
        BoldHourNotch {}
        Gap {}
        HourNotch {}
        Gap {}
        HourNotch {}
        Gap {}
        BoldHourNotch {}
        Gap {}
        HourNotch {}
        Gap {}
        HourNotch {}
        Gap {}
        BoldHourNotch {}
    }

    component BoldHourNotch: Rectangle {
        radius: 100
        width: root.dotSize
        implicitHeight: root.dotSize
        color: "white"
    }
    component HourNotch: Rectangle {
        radius: 100
        width: root.dotSize
        implicitHeight: root.dotSize
        color: "grey"
    }
    component Gap: Item {
        width: root.gapSize
        implicitHeight: 1
    }

    Rectangle {
        anchors.verticalCenter: parent.verticalCenter
        anchors.left: parent.left
        anchors.leftMargin: (root.width - root.dotSize) * (clock.minutesSinceMidnightOrNoon / 720)
        radius: 100
        width: root.handWidth
        implicitHeight: root.implicitHeight
        color: clock.isPM ? "orange" : "purple"
    }
}
