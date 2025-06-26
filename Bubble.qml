// Bubble.qml
import QtQuick
import QtQuick.Controls 2.15
import QtQuick.Controls.Material

Popup {
    id: root

    // 内置颜色配置
    readonly property color successColor: "#67c23a"  // 成功颜色
    readonly property color failureColor: "#F56C6C"  // 失败颜色

    // 可配置属性
    property string text: ""
    property bool isSuccess: true  // 默认为成功模式
    property int duration: 1500    // 显示持续时间(ms)
    property int fontSize: 16

    margins: 10
    width: parent.width / 2
    height: 40
    x: (Overlay.overlay.width - width) / 2
    y: 0

    background: Rectangle {
        color: isSuccess ? successColor : failureColor
        radius: 5
    }

    Label {
        text: root.text
        font.pixelSize: root.fontSize
        color: "white"
        anchors.centerIn: parent
    }

    Timer {
        id: timer
        interval: root.duration
        onTriggered: root.close()
    }

    onOpened: timer.start()

    // 显示气泡的便捷方法
    function show(message, success, displayDuration) {
        if (message !== undefined) root.text = message
        if (success !== undefined) root.isSuccess = success
        if (displayDuration !== undefined) root.duration = displayDuration
        open()
    }
}
