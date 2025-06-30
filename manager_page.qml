import QtQuick 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls 2.15

Item {
    id: root
    width: parent.width
    height: parent.height

    // 状态管理
    QtObject {
        id: navState
        property int currentIndex: 0
    }

    // 页面组件缓存
    property Component book_page: Qt.createComponent("book_management.qml")
    property Component user_page: Qt.createComponent("user_management.qml")

    RowLayout {
        anchors.fill: parent
        spacing: 0
        Rectangle {
            Layout.preferredWidth: 150
            Layout.fillHeight: true
            color: "#EEEEEE"

            ColumnLayout {
                anchors.fill: parent
                spacing: 15
                anchors.margins: 10
                Rectangle {
                    Layout.alignment: Qt.AlignHCenter
                    Layout.topMargin: 20
                    width: 70
                    height: 70
                    Image {
                        id: avatar
                        source: "file:///D:\\Files\\c++\\qt\\system\\image\\bg.png"
                        fillMode: Image.Stretch
                        anchors.fill: parent
                    }
                }
                // 导航按钮
                Column {
                    Layout.fillWidth: true
                    spacing: 8

                    CustomButton {
                        width: parent.width
                        text: "图书管理"
                        buttonIndex: 0
                        stateManager: navState
                        onClicked: navState.currentIndex = 0
                    }

                    CustomButton {
                        width: parent.width
                        text: "用户管理"
                        buttonIndex: 1
                        stateManager: navState
                        onClicked: navState.currentIndex = 1
                    }
                }
                Item { Layout.fillHeight: true }
            }
        }
        // ===== 右侧内容区 =====
        Loader {
            id: contentLoader
            Layout.fillWidth: true
            Layout.fillHeight: true
            sourceComponent: {
                if (navState.currentIndex === 0 && book_page.status === Component.Ready) {
                    return book_page
                } else if (navState.currentIndex === 1 && user_page.status === Component.Ready) {
                    return user_page
                }
                return null
            }
        }
    }
}
