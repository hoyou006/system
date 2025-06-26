import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls.Material 2.15

Rectangle {
    id: root
    color: "#EEEEEE"
    Material.accent: "#409EFF"
    // 模拟后端返回数据（使用属性变量以便更新时触发界面刷新）
    property var searchResults: [
        { title: "Qt Quick开发指南", author: "张伟", year: 2022, available: true },
        { title: "深入理解C++", author: "李娜", year: 2020, available: false },
        { title: "JavaScript高级编程", author: "王强", year: 2021, available: true },
        { title: "Python数据分析", author: "赵敏", year: 2019, available: true },
        { title: "设计模式之美", author: "刘洋", year: 2023, available: true }
    ]

    // 更新书籍状态函数
    function updateBookStatus(bookTitle, newStatus) {
        for (var i = 0; i < searchResults.length; i++) {
            if (searchResults[i].title === bookTitle) {
                // 创建新数组触发QML属性绑定更新
                var updatedResults = searchResults.slice()
                updatedResults[i] = {
                    title: searchResults[i].title,
                    author: searchResults[i].author,
                    year: searchResults[i].year,
                    available: newStatus
                }
                searchResults = updatedResults
                break
            }
        }
    }
//此处后端对接需要改动,此处是通过遍历进行寻找,未应对同名情况,应当换为id查找,每本书都有对应的id
    ColumnLayout {
        anchors.fill: parent
        anchors.leftMargin: 12
        anchors.rightMargin: 12
        spacing: 15

        /* [原有搜索区域代码保持不变...] */
        Rectangle {
            Layout.fillWidth: true
            Layout.preferredHeight: 60
            color: "white"
            radius: 5

            RowLayout {
                anchors.fill: parent
                anchors.margins: 10
                spacing: 10

                TextField {
                    id: searchInput
                    Layout.fillWidth: true
                    Layout.alignment: Qt.AlignVCenter
                    placeholderText: "输入书名/作者/ISBN..."
                    font.pixelSize: 14
                    selectByMouse: true
                    topPadding: 10
                    bottomPadding: 10
                    leftPadding: 12

                    background: Rectangle {
                        implicitHeight: 40
                        radius: 4
                        border.color: "#dddddd"
                    }
                }

                Button {
                    text: "搜索"
                    Layout.preferredWidth: 100
                    Layout.preferredHeight: 50
                    Layout.alignment: Qt.AlignVCenter

                    font {
                        pixelSize: 14
                        bold: true
                        letterSpacing: 1.5
                    }
                    contentItem: Text {
                        text: parent.text
                        font: parent.font
                        color: "black"
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                    }

                    onClicked: {
                        console.log("搜索关键词:", searchInput.text)
                        resultListView.model = root.searchResults
                    }
                }
            }
        }

        // ===== 结果列表 =====
        ListView {
            id: resultListView
            Layout.fillWidth: true
            Layout.fillHeight: true
            clip: true
            spacing: 8
            visible: count > 0
            model: root.searchResults // 直接绑定到属性变量

            delegate: Rectangle {
                border.color: "#E0E0E0"
                border.width: 1
                width: ListView.view.width-10
                height: 80
                radius: 5
                color: "white"

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
                                text: "年份: " + modelData.year
                                font.pixelSize: 12
                                color: "#666666"
                            }
                        }
                    }

                    Rectangle {
                        width: 60
                        height: 24
                        radius: 12
                        color: modelData.available ? "#4CAF50" : "#F44336"
                        border.color: "#dddddd"

                        Text {
                            anchors.centerIn: parent
                            text: modelData.available ? "可借" : "已借出"
                            font {
                                pixelSize: 10
                                bold: true
                            }
                            color: "white"
                        }
                    }
                }

                MouseArea {
                    anchors.fill: parent
                    onClicked: detailPopup.show(modelData)
                }
            }
            // 滚动条
            ScrollBar.vertical: ScrollBar {
                width: 6
                policy: ScrollBar.AsNeeded
            }
        }
    }

    // ===== 详情弹窗 =====
    Popup {
        id: detailPopup
        width: Math.min(parent.width * 0.7, 500)
        height: Math.min(parent.height * 0.5, 400)
        x: (parent.width - width) / 2
        y: (parent.height - height) / 2
        modal: true
        padding: 0
        closePolicy: Popup.CloseOnEscape | Popup.CloseOnPressOutside

        property var currentBook: null

        function show(bookData) {
            currentBook = bookData
            open()
        }

        background: Rectangle {
            radius: 8
            color: "white"
            border.color: "#dddddd"
        }

        ColumnLayout {
            anchors.fill: parent
            anchors.margins: 20
            spacing: 15

            Text {
                text: detailPopup.currentBook ? detailPopup.currentBook.title : ""
                font {
                    pixelSize: 20
                    bold: true
                }
                Layout.fillWidth: true
                wrapMode: Text.Wrap
            }

            Rectangle {
                Layout.fillWidth: true
                Layout.preferredHeight: 1
                color: "#eeeeee"
            }

            GridLayout {
                columns: 2
                columnSpacing: 15
                rowSpacing: 12

                Label {
                    text: "作者:"
                    font.bold: true
                    color: "#666666"
                }
                Label {
                    text: detailPopup.currentBook ? detailPopup.currentBook.author : ""
                    color: "#333333"
                }

                Label {
                    text: "出版年份:"
                    font.bold: true
                    color: "#666666"
                }
                Label {
                    text: detailPopup.currentBook ? detailPopup.currentBook.year : ""
                    color: "#333333"
                }

                Label {
                    text: "库存状态:"
                    font.bold: true
                    color: "#666666"
                }
                Label {
                    text: detailPopup.currentBook ?
                          (detailPopup.currentBook.available ? "可借阅" : "已借出") : ""
                    color: detailPopup.currentBook && detailPopup.currentBook.available ?
                          "#4CAF50" : "#F44336"
                    font.bold: true
                }
            }

            Item { Layout.fillHeight: true }

            Button {
                text: detailPopup.currentBook && detailPopup.currentBook.available ? "借阅此书" : "已借出"
                enabled: detailPopup.currentBook && detailPopup.currentBook.available
                Layout.alignment: Qt.AlignHCenter
                Layout.preferredWidth: 200
                Layout.preferredHeight: 50

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
                    color: parent.enabled ? "green" : "red"
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                }

                onClicked: {
                    console.log("借阅:", detailPopup.currentBook.title)
                    // 1. 更新本地数据状态
                    root.updateBookStatus(detailPopup.currentBook.title, false)
                    // 2. 关闭弹窗
                    detailPopup.close()
                    // 3. 这里可以添加实际借阅请求
                    // backend.borrowBook(detailPopup.currentBook.title)
                }
            }
        }
    }
}
