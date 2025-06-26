import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls.Material
Item {
    width: parent.width
    height: parent.height

    // 外部数据数组（后期替换为后端API数据）
    property var historyData: [
        {
            title: "Qt Quick核心编程",
            author: "王磊",
            borrow_time: "2023-03-15",
            return_time: "2023-04-20",
            is_overdue: false
        },
        {
            title: "Qt Quick核心编程",
            author: "王磊",
            borrow_time: "2023-03-15",
            return_time: "2023-04-20",
            is_overdue: false
        },
        {
            title: "Qt Quick核心编程",
            author: "王磊",
            borrow_time: "2023-03-15",
            return_time: "2023-04-20",
            is_overdue: false
        },
        {
            title: "Qt Quick核心编程",
            author: "王磊",
            borrow_time: "2023-03-15",
            return_time: "2023-04-20",
            is_overdue: false
        },
        {
            title: "C++设计模式",
            author: "李华",
            borrow_time: "2023-05-10",
            return_time: "2023-06-05",
            is_overdue: true
        },
        {
                    title: "Qt Quick核心编程",
                    author: "王磊",
                    borrow_time: "2023-03-15",
                    return_time: "2023-04-20",
                    is_overdue: false
                },
        {
                    title: "Qt Quick核心编程",
                    author: "王磊",
                    borrow_time: "2023-03-15",
                    return_time: "2023-04-20",
                    is_overdue: false
                },
        {
                    title: "Qt Quick核心编程",
                    author: "王磊",
                    borrow_time: "2023-03-15",
                    return_time: "2023-04-20",
                    is_overdue: false
                },
        {
            title: "Python数据分析实战",
            author: "张伟",
            borrow_time: "2023-07-22",
            return_time: "2023-08-18",
            is_overdue: false
        }
    ]

    ListView {
        id: historyListView
        anchors {
            fill: parent
            topMargin: 20  // 顶部留白
            bottomMargin: 20  // 底部留白
            leftMargin: 15
            rightMargin: 15
        }
        clip: true
        spacing: 10  // 项间距
        model: historyData

        delegate: Rectangle {
            width: historyListView.width - 30  // 减去左右边距
            height: 80
            radius: 6
            color: "#FFFFFF"
            border.color: "#E0E0E0"
            border.width: 1

            RowLayout {
                anchors.fill: parent
                anchors.margins: 12
                spacing: 15

                // 书籍信息列
                ColumnLayout {
                    Layout.fillWidth: true
                    spacing: 6

                    Text {
                        text: modelData.title
                        font {
                            pixelSize: 16
                            bold: true
                        }
                        color: "#333333"
                        elide: Text.ElideRight
                    }

                    Row {
                        spacing: 15
                        Text {
                            text: "作者: " + modelData.author
                            font.pixelSize: 12
                            color: "#666666"
                        }
                        Text {
                            text: "借阅: " + modelData.borrow_time
                            font.pixelSize: 12
                            color: "#666666"
                        }

                        Text {
                            text: "归还: " + modelData.return_time
                            font.pixelSize: 12
                            color: "#666666"
                        }
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
