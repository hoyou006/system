import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls.Material
Rectangle {
    property bool dated: true
    id: root
    color: "#f5f5f5"
    property var userlist: [
        { user_id: "张三", history_books: 5, dated_books: 0, avatar_url: "" },
        { user_id: "李四", history_books: 3, dated_books: 2, avatar_url: "" },
        { user_id: "王五", history_books: 7, dated_books: 0, avatar_url: "" },
        { user_id: "赵六", history_books: 2, dated_books: 1, avatar_url: "" },
        { user_id: "钱七", history_books: 4, dated_books: 0, avatar_url: "" }
    ]

    ColumnLayout {
        anchors.fill: parent
        anchors.leftMargin: 12
        anchors.rightMargin: 12
        spacing: 10

        // 顶部通知栏 (保持不变)
        Rectangle {
            Layout.fillWidth: true
            Layout.preferredHeight: 40
            Layout.topMargin: 10
            radius: 5
            color: "white"

            RowLayout {
                anchors.fill: parent
                spacing: 10

                Rectangle {
                    id: notice
                    Layout.leftMargin: 30
                    Layout.preferredWidth: parent.width * 0.75
                    Layout.preferredHeight: parent.height
                    radius: 8
                    color: "#8D99AE"

                    Text {
                        anchors.centerIn: parent
                        text: "🥳没有违约书目🥳"
                        font {
                            pixelSize: 15
                            bold: true
                            letterSpacing: 1
                        }
                        color: "black"
                    }
                }

                Button {
                    text: "一键提醒"
                    font {
                        pixelSize: 14
                        bold: true
                        letterSpacing: 1.5
                    }
                    Layout.fillWidth: true
                    Layout.preferredHeight: 50
                }
            }
        }

        // 列表区域
        Rectangle {
            Layout.fillWidth: true
            Layout.fillHeight: true
            Layout.leftMargin: 5
            Layout.rightMargin: 5
            color: "#EEEEEE"

            ListView {
                id: historyListView
                anchors.fill: parent
                anchors.rightMargin: 12 // 增加右边距，为滚动条留出空间
                clip: true
                spacing: 8
                model: root.userlist

                delegate: Rectangle {
                    width: ListView.view.width-10
                    height: 80
                    radius: 5
                    color: modelData.dated_books === 0 ? "white" : "#fbd3d3"
                    border.color: "#E0E0E0"
                    border.width: 1

                    RowLayout {
                        anchors.fill: parent
                        anchors.margins: 12
                        spacing: 15

                        // 左侧头像
                        Image {
                            Layout.preferredWidth: 50
                            Layout.preferredHeight: 50
                            source: modelData.avatar_url || ""
                            fillMode: Image.PreserveAspectFit
                        }

                        // 中间用户名
                        Text {
                            text: modelData.user_id
                            font {
                                pixelSize: 16
                                bold: true
                            }
                            Layout.fillWidth: true
                        }

                        // 右侧数字（整体左移）
                        RowLayout {
                            spacing: 10
                            Layout.rightMargin: 15 // 右侧留出空白

                            // 历史借阅
                            Rectangle {
                                color: "transparent"
                                radius: 4
                                Layout.preferredHeight: 30
                                implicitWidth: historyText.width +50

                                RowLayout {
                                    anchors.fill: parent
                                    anchors.margins: 5
                                    spacing: 5

                                    Text {
                                        text: "历史:"
                                        font.pixelSize: 12
                                        color: "gray"
                                    }

                                    Text {
                                        id: historyText
                                        text: modelData.history_books
                                        font {
                                            pixelSize: 14
                                            bold: true
                                        }
                                        color: modelData.history_books === 0 ? "green" : "gray"
                                    }
                                }
                            }

                            // 逾期
                            Rectangle {
                                color: "transparent"
                                radius: 4
                                Layout.preferredHeight: 30
                                implicitWidth: datedText.width + 50

                                RowLayout {
                                    anchors.fill: parent
                                    anchors.margins: 5
                                    spacing: 5

                                    Text {
                                        text: "逾期:"
                                        font.pixelSize: 12
                                        color: "gray"
                                    }

                                    Text {
                                        id: datedText
                                        text: modelData.dated_books
                                        font {
                                            pixelSize: 14
                                            bold: true
                                        }
                                        color: modelData.dated_books === 0 ? "green" : "red"
                                    }
                                }
                            }
                        }
                    }
                }

                // 滚动条（增加间距）
                ScrollBar.vertical: ScrollBar {
                    width: 8
                    policy: ScrollBar.AsNeeded
                    anchors.right: parent.right
                    anchors.rightMargin: 2 // 增加滚动条与列表的间距
                }
            }
        }
    }
}
