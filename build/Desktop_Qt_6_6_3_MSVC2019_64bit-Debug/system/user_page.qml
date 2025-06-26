import QtQuick 2.15
import QtQuick.Controls
import QtQuick.Layouts 1.15

Item {
    width: parent.width// 必须指定宽度
    height: parent.height// 必须指定高度

    RowLayout {
        anchors.fill: parent
        spacing: 10

        Rectangle {
            Layout.preferredWidth: 250
            Layout.fillHeight: true
            border.color: "black"

            ColumnLayout {
                anchors.fill: parent
                spacing: 20

                Button { text: "查找"; Layout.alignment: Qt.AlignHCenter }
                Button { text: "还书"; Layout.alignment: Qt.AlignHCenter }
                Button { text: "历史记录"; Layout.alignment: Qt.AlignHCenter }
            }
        }

        Rectangle {
            Layout.fillWidth: true
            Layout.fillHeight: true
            color: "yellow"
        }
    }
}
//rectangle颜色的正确显示依赖于宽高的正确设置,最外层的item进去的其parent也不是window
