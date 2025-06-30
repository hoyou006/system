import QtQuick
import QtQuick.Controls 2.15
import QtQuick.Layouts
Window {
minimumHeight: 500
minimumWidth: 800
maximumHeight: 500
maximumWidth: 800
    visible: true
    title: qsTr("图书管理系统")
    flags: Qt.Window | Qt.WindowTitleHint | Qt.WindowCloseButtonHint | Qt.WindowMinimizeButtonHint
    StackView {
            id: s1
            initialItem: "sign_in.qml"  // 初始页面
            anchors.fill: parent
        }
}
