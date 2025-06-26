import QtQuick 2.15
import QtQuick.Controls
import QtQuick.Layouts 1.15

Item {
    width: parent.width
    height: parent.height

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

                Button { text: "查1找"; Layout.alignment: Qt.AlignHCenter }
                Button { text: "还1书"; Layout.alignment: Qt.AlignHCenter }
                Button { text: "历史1记录"; Layout.alignment: Qt.AlignHCenter }
            }
        }

        Rectangle {
            Layout.fillWidth: true
            Layout.fillHeight: true
            color: "yellow"
        }
    }
}
