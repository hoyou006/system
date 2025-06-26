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
    property Component searchPage: Qt.createComponent("search_page.qml")
    property Component returnPage: Qt.createComponent("return_page.qml")
    property Component historyPage: Qt.createComponent("history_page.qml")

    RowLayout {
        anchors.fill: parent
        spacing: 0

        // ===== 左侧导航栏 =====
        Rectangle {
            Layout.preferredWidth: 150
            Layout.fillHeight: true
            color: "#EEEEEE"

            ColumnLayout {
                anchors.fill: parent
                spacing: 15
                anchors.margins: 10

                // 用户头像
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
                        text: "查 找"
                        buttonIndex: 0
                        stateManager: navState
                        onClicked: navState.currentIndex = 0
                    }

                    CustomButton {
                        width: parent.width
                        text: "还 书"
                        buttonIndex: 1
                        stateManager: navState
                        onClicked: navState.currentIndex = 1
                    }

                    CustomButton {
                        width: parent.width
                        text: "历 史 记 录"
                        buttonIndex: 2
                        stateManager: navState
                        onClicked: navState.currentIndex = 2
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
                if (navState.currentIndex === 0 && searchPage.status === Component.Ready) {
                    return searchPage
                } else if (navState.currentIndex === 1 && returnPage.status === Component.Ready) {
                    return returnPage
                } else if (historyPage.status === Component.Ready) {
                    return historyPage
                }
                return null
            }
        }
    }
}
