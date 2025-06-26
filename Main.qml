import QtQuick
import QtQuick.Controls 2.15
import QtQuick.Layouts
Window {
    width: 640
    height: 450
    visible: true
    title: qsTr("图书管理系统")

    StackView {
            id: s1
            initialItem: "sign_in.qml"  // 初始页面
            anchors.fill: parent
        }
}
