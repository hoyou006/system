import QtQuick
import QtQuick.Controls.Material
Column{
    property string hint: "none"
    property bool is_password: false
    spacing: 5
    Text{
    id:lable
    text: hint
    font.pixelSize: 12
    color: "gray"
    }
    Rectangle {
        id:rec_1
        width: 230
        height: 35
        border.color: "black"
        radius: 6
        Item {
            anchors.centerIn: parent
            width: childrenRect.width
            height: parent.height//中间添加item嵌套控制居中
            TextInput {
                anchors.verticalCenter: parent.verticalCenter
                width: rec_1.width-8
                font.pixelSize: 16
                maximumLength: 30
                echoMode: if(!is_password){
                              TextInput.Normal
                          }
                          else{
                          TextInput.Password}
            }
        }
    }
}
