import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls.Material

Rectangle {
    id: root
    color: "#f5f5f5"
    property var bookList: [
        { book: "Qt Quick开发指南", author: "张伟", year: 2022, add_time: "2023-05-10" },
        { book: "深入理解C++", author: "李娜", year: 2021, add_time: "2023-06-15" },
        { book: "JavaScript高级编程", author: "王强", year: 2020, add_time: "2023-07-20" },
        { book: "Python数据分析", author: "赵敏", year: 2022, add_time: "2023-08-05" },
        { book: "设计模式之美", author: "刘洋", year: 2023, add_time: "2023-09-12" }
    ]
    Menu {
        id: contextMenu
        width: 70
        height: 85
        MenuItem {
            text: "编辑"
            height: 35
            onTriggered: console.log("编辑:", contextMenu.currentBook.book)
        }
        MenuItem {
            text: "删除"
            height: 35
            onTriggered: console.log("删除:", contextMenu.currentBook.book)
        }
        property var currentBook: null // 存储当前点击的书籍
    }

    ColumnLayout {
        anchors.fill: parent
        anchors.leftMargin: 12
        anchors.rightMargin: 12
        spacing: 10

        // 顶部导航栏
        Rectangle {
            Layout.fillWidth: true
            Layout.preferredHeight: 50
            Layout.topMargin: 10
            radius: 5
            color: "white"

            RowLayout {
                anchors.fill: parent
                spacing: 10
                anchors.margins: 5

                // 库存信息
                Rectangle {
                    Layout.preferredWidth: parent.width * 0.35
                    Layout.fillHeight: true
                    radius: 8
                    color: "#8D99AE"

                    Text {
                        anchors.centerIn: parent
                        text: "📚 库存: 128"
                        font {
                            pixelSize: 14
                            bold: true
                        }
                        color: "black"
                    }
                }

                // 更新时间
                Rectangle {
                    Layout.preferredWidth: parent.width * 0.35
                    Layout.fillHeight: true
                    radius: 8
                    color: "#8D99AE"

                    Text {
                        anchors.centerIn: parent
                        text: "🔄 更新: 09-15"
                        font {
                            pixelSize: 14
                            bold: true
                        }
                        color: "black"
                    }
                }

                // 入库按钮
                Rectangle {
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    radius: 8
                    color: Material.accent

                    Text {
                        anchors.centerIn: parent
                        text: "入库"
                        font {
                            pixelSize: 14
                            bold: true
                        }
                        color: "white"
                    }

                    MouseArea {
                        anchors.fill: parent
                        onClicked: console.log("入库操作")
                    }
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
                id: bookListView
                anchors.fill: parent
                anchors.rightMargin: 12
                clip: true
                spacing: 8
                model: root.bookList

                delegate: Rectangle {
                    width: ListView.view.width-10
                    height: 70
                    radius: 5
                    color: "white"
                    border.color: "#E0E0E0"
                    border.width: 1

                    RowLayout {
                        anchors.fill: parent
                        anchors.margins: 12
                        spacing: 10

                        // 书籍信息
                        ColumnLayout {
                            spacing: 5
                            Layout.fillWidth: true

                            Text {
                                text: modelData.book
                                font {
                                    pixelSize: 16
                                    bold: true
                                }
                                elide: Text.ElideRight
                                Layout.fillWidth: true
                            }

                            RowLayout {
                                Text {
                                    text: modelData.author
                                    font.pixelSize: 12
                                    color: "gray"
                                }

                                Text {
                                    text: "· " + modelData.year
                                    font.pixelSize: 12
                                    color: "gray"
                                }

                                Text {
                                    text: "· 入库:" + modelData.add_time
                                    font.pixelSize: 12
                                    color: "gray"
                                }
                            }
                        }

                        // 操作区域（替代Button）
                        Rectangle {
                            Layout.preferredWidth: 40
                            Layout.preferredHeight: 40
                            color: "transparent"

                            Text {
                                anchors.centerIn: parent
                                text: "⋮"
                                font.pixelSize: 24
                                color: Material.foreground
                            }

                            MouseArea {
                                anchors.fill: parent
                                onClicked: {
                                               contextMenu.currentBook = modelData // 设置当前书籍
                                               contextMenu.popup() // 弹出菜单
                                           }
                            }
                        }
                    }
                }

                ScrollBar.vertical: ScrollBar {
                    width: 6
                    policy: ScrollBar.AsNeeded
                }
            }
        }
    }
}
