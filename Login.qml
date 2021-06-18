import QtQuick 2.14
import QtQuick.Controls 2.14

Popup {
    id: loginForm
    padding: 0

    signal loginSucces()

    Timer {
           id: timer
       }

       function delay(delayTime, cb) {
           timer.interval = delayTime;
           timer.repeat = false;
           timer.triggered.connect(cb);
           timer.start();
       }

    Image {
        id: logoImage
        y: 20
        height: 64
        anchors.right: parent.right
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.topMargin: 50
        fillMode: Image.PreserveAspectFit
        source: "res/logo.png"
    }

    Rectangle {
        id: backRect
        color: "#0d51bb"
        height: 200
        anchors.right: parent.right
        anchors.rightMargin: 0
        anchors.left: parent.left
        anchors.leftMargin: 0
        anchors.top: logoImage.bottom
        anchors.topMargin: 0

        Image {
            id: backImage
            height: 125
            anchors.fill: parent
            fillMode: Image.PreserveAspectFit
            source: "res/Login.png"
        }

        Text {
            id: appCaption
            color: "#ffffff"
            text: qsTr("东莞市旭田电子有限公司\nPartnership for Success")
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            style: Text.Raised
            font.weight: Font.Bold
            font.family: "Courier"
            font.pointSize: 26
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
        }
    }

    Column {
        id: column
        anchors.right: parent.right
        anchors.rightMargin: 30
        anchors.left: parent.left
        anchors.leftMargin: 30
        anchors.top: backRect.bottom
        anchors.topMargin: 10
        spacing: 10

        TextField {
            id: userName
            text: User.code
            width: parent.width
            anchors.top: parent.top
            anchors.topMargin: 10
            placeholderText: qsTr("Please input username")
        }
        TextField {
            id: passWord
            text: User.passWord
            width: parent.width
            anchors.top: userName.bottom
            anchors.topMargin: 10
            placeholderText: qsTr("Please input password")
            echoMode: TextInput.Password
        }

        Row {
            id: optionRow
            height: 20
            anchors.top: passWord.bottom
            anchors.topMargin: 20
            width: column.width - 20
            spacing: 0

            CheckBox {
                id: rememberMe
                checked: User.rememberMe
                width: (optionRow.width - optionRow.spacing * 3) / 2
                text: qsTr("记住密码")
                anchors.bottom: parent.bottom
                anchors.top: parent.top
            }

            CheckBox {
                id: autoLogin
                checked: User.autoLogin
                width: (optionRow.width - optionRow.spacing * 3) / 2
                text: qsTr("自动登录")
                anchors.bottom: parent.bottom
                anchors.top: parent.top
            }
        }

        Button {
            id: button
            height: 50
            text: qsTr("登录")
            layer.smooth: true
            font.family: "Courier"
            font.bold: true
            font.pointSize: 20
            anchors.right: parent.right
            anchors.rightMargin: 10
            anchors.left: parent.left
            anchors.leftMargin: 10
            anchors.top: optionRow.bottom
            anchors.topMargin: 20
            onClicked: {
                User.code = userName.text
                User.passWord = passWord.text
                User.rememberMe = rememberMe.checked
                User.autoLogin = autoLogin.checked;
                User.editFinished();
            }
        }
    }

    Text {
        id: errorMessage
        color: "red"
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 10
        //style: Text.Raised
        font.weight: Font.Bold
        font.family: "Courier"
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        Behavior on opacity {
            NumberAnimation {
                duration: 500
            }
        }
    }

    Component.onCompleted: {
        User.onCheckInput.connect(checkLogin);
    }

    function checkLogin(v1, v2)
    {
        if (v1 == "0")
        {
            loginForm.loginSucces();
        }
        else
        {
            showErrorMessage(v2);
        }
    }

    function showErrorMessage(v)
    {
        errorMessage.text = v;
        errorMessage.opacity = 1;
        delay(2000, function(){
            errorMessage.opacity = 0;
        })
    }
}
