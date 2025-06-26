import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls.Material
Rectangle {
    property bool dated: true
    id: root
    color: "#f5f5f5"
    property var historyResults: [
        { title: "Qt Quick开发指南", author: "张伟", borrow_time: 2022, deadline: 2023, is_dated: false },
        { title: "深入理解C++", author: "李娜", borrow_time: 2022, deadline: 2023, is_dated: false },
        { title: "JavaScript高级编程", author: "王强", borrow_time: 2022, deadline: 2023, is_dated: true },
        { title: "Python数据分析", author: "赵敏", borrow_time: 2022, deadline: 2023, is_dated: false },
        { title: "设计模式之美", author: "刘洋", borrow_time: 2022, deadline: 2023, is_dated: false }
    ]

    ColumnLayout {
        anchors.fill: parent
        anchors.leftMargin: 12
        anchors.rightMargin: 12
        spacing: 10  // 调整间距

        // 顶部通知栏
        Rectangle {
            Layout.fillWidth: true
            Layout.preferredHeight: 40
            Layout.topMargin: 10
            radius: 5
            color: "white"

            Rectangle {
                id: notice
                anchors.centerIn: parent
                width: parent.width * 0.9
                height: parent.height
                radius: 8
                color: dated ? "#f9b6b6" : "#d0eec5"

                Text {
                    anchors.centerIn: parent
                    text: qsTr(dated ? "您有书逾期了哦😡" : "🥳没有违约书目🥳")
                    font {
                        pixelSize: 15
                        bold: true
                        letterSpacing: 1
                    }
                    color: "black"
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
                anchors.fill: parent  // 关键！填充父项
                clip: true
                spacing: 8
                model: root.historyResults

                delegate: Rectangle {
                    width: ListView.view.width-10
                    height: 80
                    radius: 5
                    color: "white"
                    border.color: "#E0E0E0"
                    border.width: 1

                    RowLayout {
                        anchors.fill: parent
                        anchors.margins: 12
                        spacing: 15

                        ColumnLayout {
                            Layout.fillWidth: true
                            spacing: 5

                            Text {
                                text: modelData.title
                                font {
                                    pixelSize: 16
                                    bold: true
                                }
                                elide: Text.ElideRight
                                Layout.fillWidth: true
                            }

                            Row {
                                spacing: 15
                                Text {
                                    text: "作者: " + modelData.author
                                    font.pixelSize: 12
                                    color: "#666666"
                                }
                                Text {
                                    text: "借阅时间: " + modelData.borrow_time
                                    font.pixelSize: 12
                                    color: "#666666"
                                }
                                Text {
                                    text: "应还时间: " + modelData.deadline
                                    font.pixelSize: 12
                                    color: "#666666"
                                }
                            }
                        }
                        Button {
                            text:  modelData.is_dated?"已逾期":"还书"
                            Layout.alignment: Qt.AlignHCenter
                            Layout.preferredWidth: 90
                            Layout.preferredHeight: 45

                            background: Rectangle {
                                radius: 4
                                color: "#E0E0E0"
                            }
                            contentItem: Text {
                                text: parent.text
                                font {
                                    pixelSize: 14
                                    bold: true
                                }
                                color: modelData.is_dated?"red":"#050505"
                                horizontalAlignment: Text.AlignHCenter
                                verticalAlignment: Text.AlignVCenter
                            }
                            onClicked: {
                                console.log("归还:",modelData.title)
                            }
                        }
                    }
                }
                // 滚动条
                ScrollBar.vertical: ScrollBar {
                    width: 6
                    policy: ScrollBar.AsNeeded
                }
            }
        }
    }
}
