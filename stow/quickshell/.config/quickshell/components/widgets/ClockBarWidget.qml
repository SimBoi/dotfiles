pragma ComponentBehavior: Bound
import QtQuick
import Quickshell

Item {
    id: root

    property int dotSize: 10
    property int handHeight: 40
    property int handWidth: 10
    readonly property real gapSize: (width - dotSize * 13) / 12
    width: 1000
    height: handHeight

    SystemClock {
        id: clock
        precision: SystemClock.Minutes
        property bool isPM: hours >= 12
        property int minutesSinceMidnightOrNoon: hours * 60 + minutes - (isPM ? 720 : 0)
    }

    Row {
        anchors.centerIn: parent
        width: parent.width

        Rectangle {
            radius: 100; width: dotSize; height: dotSize
            color: "white"
        }
        Item { width: gapSize; height: 1 }
        Rectangle {
            radius: 100; width: dotSize; height: dotSize
            color: "gray"
        }
        Item { width: gapSize; height: 1 }
        Rectangle {
            radius: 100; width: dotSize; height: dotSize
            color: "gray"
        }
        Item { width: gapSize; height: 1 }
        Rectangle {
            radius: 100; width: dotSize; height: dotSize
            color: "white"
        }
        Item { width: gapSize; height: 1 }
        Rectangle {
            radius: 100; width: dotSize; height: dotSize
            color: "gray"
        }
        Item { width: gapSize; height: 1 }
        Rectangle {
            radius: 100; width: dotSize; height: dotSize
            color: "gray"
        }
        Item { width: gapSize; height: 1 }
        Rectangle {
            radius: 100; width: dotSize; height: dotSize
            color: "white"
        }
        Item { width: gapSize; height: 1 }
        Rectangle {
            radius: 100; width: dotSize; height: dotSize
            color: "gray"
        }
        Item { width: gapSize; height: 1 }
        Rectangle {
            radius: 100; width: dotSize; height: dotSize
            color: "gray"
        }
        Item { width: gapSize; height: 1 }
        Rectangle {
            radius: 100; width: dotSize; height: dotSize
            color: "white"
        }
        Item { width: gapSize; height: 1 }
        Rectangle {
            radius: 100; width: dotSize; height: dotSize
            color: "gray"
        }
        Item { width: gapSize; height: 1 }
        Rectangle {
            radius: 100; width: dotSize; height: dotSize
            color: "gray"
        }
        Item { width: gapSize; height: 1 }
        Rectangle {
            radius: 100; width: dotSize; height: dotSize
            color: "white"
        }
    }

    Rectangle {
        anchors.verticalCenter: parent.verticalCenter
        anchors.left: parent.left
        anchors.leftMargin: (root.width - dotSize) * (clock.minutesSinceMidnightOrNoon / 720)
        radius: 100; width: handWidth; height: handHeight
        color: clock.isPM ? "orange" : "purple"
    }
}
