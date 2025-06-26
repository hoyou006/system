import QtQuick
import QtQuick.Controls 2.15
import QtQuick.Layouts
import QtQuick.Controls.Material

Item {
    width: parent.width
    height:parent.height

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
        width: column.width + 40  // 比Column宽40像素（左右各20）
        height: column.height + 40 // 比Column高40像素（上下各20）
        color: "white"            // 测试用白色
        radius: 5                 // 圆角效果
        z: 0                      // 在背景之上，内容之下
    }

    // 完全保持原有的Column布局
    Column {
        id: column                // 添加id以便遮罩层引用尺寸
        anchors.centerIn: parent
        spacing: 5

        Custom_textinput { hint: "请输入用户名" }
        Custom_textinput { hint: "请输入密码"; is_password: true }

        Item { width: 230; height: 5 }

        Button {
            text: "登录"
            width: 230
            height: 50
            onClicked: bubble.show("登陆失败",false)
        }

        Item { width: 230; height: 5 }

        Label {
            width: 230
            horizontalAlignment: Text.AlignRight
            text: "没有账号?点击注册"
            height: 30
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    s1.pop()
                    s1.push("sign_up.qml")
                }
            }
        }
    }
    Bubble{
    id:bubble
    }
}
