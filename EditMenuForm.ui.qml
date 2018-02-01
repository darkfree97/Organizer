import QtQuick 2.4
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
import QtQuick.Extras 1.4

Item {
    property alias saveBtn: saveBtn
    property alias edit_calendar: edit_calendar
    property alias timeHM: timeH
    property alias taskText: taskText
    property alias calendar_show_btn: calendar_show_btn
    property alias editTasksListView: editTasksListView
    property alias date_text: date_text
    width: 480
    height: 800
    Image {
        anchors.fill: parent
        source: "qrc:/img/background/720x1200_right.png"
    }

    TextField{
        id: timeH
        inputMethodHints: Qt.ImhDigitsOnly
        validator: RegExpValidator { regExp: /^([0-1]?[0-9]|2[0-3]):([0-5][0-9])$ / }
        height:40
        placeholderText: "23:59"
        anchors.right: parent.right
        anchors.rightMargin: 10
        anchors.left: parent.left
        anchors.leftMargin: 10
        font.pixelSize: 30
        horizontalAlignment: Text.AlignHCenter
        anchors.top: text1.bottom
        anchors.topMargin: 10
        font.family: "Ubuntu Arial"
        opacity: 0.7
    }

    Button {
        id: saveBtn
        height: 40
        anchors.right: parent.right
        anchors.rightMargin: 10
        anchors.left: parent.left
        anchors.leftMargin: 10
        anchors.top: taskText.bottom
        anchors.topMargin: 10
        style: ButtonStyle{
            label: Label{
                text: qsTr("Зберегти")
                font.pixelSize: 20
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
            }
            background: Rectangle {
                implicitWidth: 100
                implicitHeight: 25
                border.width: control.activeFocus ? 2 : 1
                border.color: "#888"
                radius: 4
                opacity: 0.7
                gradient: Gradient {
                    GradientStop { position: 0 ; color: control.pressed ? "white" : "white" }
                    GradientStop { position: 0.9 ; color: control.pressed ? "white" : "white" }
                    GradientStop { position: 1 ; color: control.pressed ? "lightBlue" : "lightBlue" }
                }
            }
        }
    }



    Text {
        id: text1
        color: "#ffffff"
        text: qsTr("Час завдння")
        anchors.left: parent.left
        anchors.leftMargin: 20
        font.pixelSize: 15
        anchors.top: rectangle.bottom
        anchors.topMargin: 10

    }

    Text {
        id: text2
        color: "#ffffff"
        text: qsTr("Опис завдання")
        anchors.left: parent.left
        anchors.leftMargin: 20
        anchors.top: timeH.bottom
        anchors.topMargin: 10
        font.pixelSize: 15
    }


    TextField {
        id: taskText
        height: 40
        font.pointSize: 20
        anchors.right: parent.right
        anchors.rightMargin: 10
        anchors.left: parent.left
        anchors.leftMargin: 10
        anchors.top: text2.bottom
        anchors.topMargin: 15
        placeholderText: qsTr("")
        horizontalAlignment: Text.AlignHCenter
        opacity: 0.7
    }
    Rectangle {
        id: rectangle
        height: 60
        anchors.right: parent.right
        anchors.rightMargin: 0
        anchors.left: parent.left
        anchors.leftMargin: 0
        anchors.top: parent.top
        anchors.topMargin: 0
        color: "white"
        opacity: 0.9
        Rectangle{
            anchors{
                bottom: parent.bottom
                left: parent.left
                right: parent.right
            }
            color: "darkGray"
            height: 2
        }

        Image {
            id: image
            x: 400
            y: 10
            width: 40
            height: 40
            anchors.top: parent.top
            anchors.topMargin: 10
            anchors.right: parent.right
            anchors.rightMargin: 10
            source: "qrc:/img/calendar.png"
            MouseArea{
                id: calendar_show_btn
                z: 1
                anchors.fill: parent
            }
        }

        Label {
            id: date_text
            x: 10
            y: 18
            text: qsTr("Дата ")
            horizontalAlignment: Text.AlignHCenter
            font.capitalization: Font.AllUppercase
            anchors.right: image.left
            anchors.rightMargin: 10
            anchors.verticalCenter: image.verticalCenter
            font.pointSize: 15
            anchors.left: parent.left
            anchors.leftMargin: 10
        }
    }

    ListView {
        id: editTasksListView
        width: 110
        spacing: 10
        anchors.right: parent.right
        anchors.rightMargin: 10
        anchors.left: parent.left
        anchors.leftMargin: 10
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 60
        anchors.top: saveBtn.bottom
        anchors.topMargin: 10
    }

    Calendar{
        id: edit_calendar
        x: 10
        y: 10
        height: 40
        anchors.right: parent.right
        anchors.rightMargin: 10
        anchors.left: parent.left
        anchors.leftMargin: 10
        anchors.top: parent.top
        anchors.topMargin: 10
        visible: false
    }
}
