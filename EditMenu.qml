import QtQuick 2.4
import QtQuick.Dialogs 1.2
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4

EditMenuForm {
    property var control_task_date: new Date()
    function update(){
        date_text.text = qsTr("Дата: ")+control_task_date.toLocaleDateString()
        editMenuListModel.updateModel(Qt.formatDateTime(control_task_date,"yyyy-MM-dd"))
    }
    calendar_show_btn.onClicked: function(){
        edit_calendar.selectedDate = control_task_date
        edit_calendar.height = 300
        edit_calendar.visible = true
    }
    edit_calendar.onClicked: function(_date){
        control_task_date = _date
        date_text.text = qsTr("Дата: ")+control_task_date.toLocaleDateString()
        edit_calendar.visible = false
        edit_calendar.height = 40
        update()
    }

    editTasksListView.delegate: Item {
        anchors{
            right: parent.right
            left: parent.left
            rightMargin: 5
            leftMargin: 5
        }
        height: 40
        Rectangle{
            anchors.fill: parent
            color: "white"
            radius: 10
            opacity: 0.7
        }
        Row {
            anchors.fill: parent
            spacing: 10
            Text{
                anchors{
                    left: parent.left
                    verticalCenter: parent.verticalCenter
                    right: parent.right
                    leftMargin: 50
                }
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                text: task_text
            }
            Text{
                text: solving_time
                font.pixelSize: 18
                anchors.left: parent.left
                anchors.leftMargin: 5
                anchors.verticalCenter: parent.verticalCenter
            }
            Image {
                source: "qrc:/img/remove-icon.png"
                width: 25
                height: 25
                anchors{
                    verticalCenter: parent.verticalCenter
                    right: parent.right
                    rightMargin: 10
                }

                MouseArea{
                    anchors.fill: parent
                    onClicked: function(){
                        if(database.deleteTask(_id)){
                            editMenuListModel.updateModel(Qt.formatDateTime(control_task_date,"yyyy-MM-dd"))
                        }
                    }
                }
            }
        }
    }
    editTasksListView.model: editMenuListModel

    saveBtn.onClicked: function(){
        if(timeHM.text.match(/^([0-1]?[0-9]|2[0-3]):([0-5][0-9])$/)&&taskText.text.length>0){
            if(database.createNewTask(
                        taskText.text,
                        (timeHM.text.length===4 ? "0":"")+timeHM.text,
                        Qt.formatDateTime(control_task_date,"yyyy-MM-dd"))){
                editMenuListModel.updateModel(Qt.formatDateTime(control_task_date,"yyyy-MM-dd"))
                timeHM.text = ""
                taskText.text = ""
            }
        }
        else{
            dialog.visible = true
        }
    }

    Dialog {
        id: dialog
        visible: false
        title: "Повідомлення"
        modality: Qt.WindowModal

        standardButtons: StandardButton.Save | StandardButton.Cancel

        onAccepted: console.log("Saving the date " +
                calendar.selectedDate.toLocaleDateString())

        contentItem: Rectangle{
            color: "lightskyblue"
            implicitWidth: 400
            implicitHeight: 100
            Text {
                id: dialog_text
                text: qsTr("Hello")
                color:"navy"
                anchors.centerIn: parent
            }
        }
    }
}

