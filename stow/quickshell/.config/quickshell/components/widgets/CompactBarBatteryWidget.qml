pragma ComponentBehavior: Bound
import qs.components.basic
import QtQuick
import Quickshell.Services.UPower

M3ProgressBar {
    showStopPoint: false
    value: UPower.displayDevice.percentage
    valueBarWidth: Screen.width / 9
    valueBarHeight: 10
}
