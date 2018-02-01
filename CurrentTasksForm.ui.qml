import QtQuick 2.4
import QtQuick.Extras 1.4
import QtQuick.Controls 1.4
import QtQuick.Controls 2.0
import QtQuick.Dialogs 1.2

Item {
    property alias date_text: date_text
    property alias listView: listView
    property alias l_arrow: l_arrow
    property alias r_arrow: r_arrow
    property alias calendar_ext: calendar_ext
    property alias calendar: calendar
    id: item1
    width: 480
    height: 800
    Image {
        anchors.fill: parent
        source: "qrc:/img/background/720x1200_left.png"
    }

    ListView {
        id: listView
        visible: true
        anchors.bottomMargin: 50
        anchors.top: rectangle.bottom
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        highlightRangeMode: ListView.NoHighlightRange
        anchors.topMargin: 10
        anchors.rightMargin: 10
        anchors.leftMargin: 10
        spacing: 5
        orientation: ListView.Vertical

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

        Item {
            id: date
            x: 10
            y: 10
            height: 25
            anchors.verticalCenter: parent.verticalCenter
            anchors.right: parent.right
            anchors.rightMargin: 10
            anchors.left: parent.left
            anchors.leftMargin: 10
            Image {
                source: "/img/left_arrow_dark.png"
                anchors.left: parent.left
                width: 30
                height: 30
                MouseArea{
                    id: l_arrow
                    anchors.fill: parent
                }
            }
            Text{
                id:date_text
                anchors.verticalCenterOffset: 2
                horizontalAlignment: Text.AlignHCenter
                font.capitalization: Font.AllUppercase
                font.pointSize: 15
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                MouseArea {
                    id: calendar_ext
                    anchors.fill: parent
                }
            }

            Image {
                source: "/img/right_arrow_dark.png"
                anchors.right: parent.right
                width: 30
                height: 30
                MouseArea{
                    id: r_arrow
                    anchors.fill: parent
                }
            }
        }
    }

    Calendar{
        id: calendar
        x: 10
        y: 10
        visible: false
        anchors.right: parent.right
        anchors.rightMargin: 10
        anchors.left: parent.left
        anchors.leftMargin: 10
        anchors.top: parent.top
        anchors.topMargin: 10
        height: 25
    }
}
