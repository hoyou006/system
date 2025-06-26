import QtQuick
import QtQuick.Controls 2.15
import QtQuick.Layouts
import QtQuick.Controls.Material

Item {
    width: parent.width
    height: parent.height

    // 背景图片（使用绝对路径）
    Image {
        id: testbg
        anchors.fill: parent
        source: "file:///D:/Files/c++/qt/untitled4/image/bg.png"
        fillMode: Image.Stretch
        z: -1
    }

    // 白色遮罩层（包裹Column并大一圈）
    Rectangle {
        anchors.centerIn: parent
        width: column.width + 40
        height: column.height + 40
        color: "white"
        radius: 5
        z: 0
    }

    // 完全保持原有的Column布局
    Column {
        id: column
        anchors.centerIn: parent
        spacing: 5

        Custom_textinput{hint:"请输入用户名"}
        Custom_textinput{hint:"请输入邮箱"}
        Custom_textinput{hint:"请输入密码" ;is_password: true}

        Item { width: 230; height: 5 }

        Button {
            text: "注 册"
            width: 230
            height: 50
            onClicked: bubble.show("注册成功!", false)
        }
    }

    // 使用封装好的Bubble组件
    Bubble {
        id: bubble
    }
}
