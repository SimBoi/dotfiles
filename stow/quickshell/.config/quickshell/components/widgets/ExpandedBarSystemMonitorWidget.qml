pragma ComponentBehavior: Bound
import QtQuick
import Quickshell
import Quickshell.Io
import qs.components.basic

Rectangle {
    id: root
    implicitHeight: 30
    implicitWidth: styledText.width + 20
    radius: 100
    color: "grey"
    property real cpuUsage
    property real ramUsage
    property real gpuUsage

    Process {
        id: cpuProcess
        property real prevCpuTotal: 0
        property real prevCpuIdle: 0
        command: ["head", "-1", "/proc/stat"]
        stdout: StdioCollector {
            onStreamFinished: {
                const parts = text.trim().split(/\s+/).slice(1).map(Number);
                const idle = parts[3] + parts[4];
                const total = parts.reduce((a, b) => a + b, 0);
                const deltaTotal = total - cpuProcess.prevCpuTotal;
                const deltaIdle = idle - cpuProcess.prevCpuIdle;
                root.cpuUsage = deltaTotal <= 0 ? 0 : Math.round(100 * (1 - deltaIdle / deltaTotal));
                cpuProcess.prevCpuTotal = total;
                cpuProcess.prevCpuIdle = idle;
            }
        }
    }

    Process {
        id: ramProcess
        command: ["free", "-b"]
        stdout: StdioCollector {
            onStreamFinished: {
                const parts = text.trim().split("\n")[1].trim().split(/\s+/);
                root.ramUsage = Math.round(100 * Number(parts[2]) / Number(parts[1]));
            }
        }
    }

    Process {
        id: gpuProcess
        command: ["nvidia-smi", "--query-gpu=utilization.gpu", "--format=csv,noheader,nounits"]
        stdout: StdioCollector {
            onStreamFinished: {
                root.gpuUsage = Number(text.trim());
            }
        }
    }

    Timer {
        interval: 1000
        repeat: true
        running: true
        onTriggered: {
            cpuProcess.running = true;
            ramProcess.running = true;
            gpuProcess.running = true;
        }
    }

    StyledText {
        id: styledText
        anchors.centerIn: parent
        text: `\uf4bc ${root.cpuUsage}% \uefc5 ${root.ramUsage}% \udb82\ude07 ${root.gpuUsage}%`
    }
}
