pragma ComponentBehavior: Bound
import qs.components.basic
import Quickshell.Services.UPower

M3ProgressBar {
    value: UPower.displayDevice.percentage
}
