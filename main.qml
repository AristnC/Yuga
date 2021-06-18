import QtQuick 2.14
import QtQuick.Window 2.14

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")

    Login{
        id : login
        width: window.width + 4
        height: window.height + 4
        x: -2
        y: -2
        modal: true
        focus: true
        closePolicy: Popup.CloseOnEscape | Popup.CloseOnPressOutsideParent
    }

    Component.onCompleted: {
        login.open();
    }
}
