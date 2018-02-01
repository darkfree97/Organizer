import QtQuick 2.4
import QtQml 2.2
import QtQuick.Controls 2.0
import QtQuick.Controls.Styles 1.4


CurrentTasksForm {
    property var selected_date : new Date()
    date_text.text:  selected_date.toLocaleDateString()
    listView.delegate: Item {
        width: parent.width
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
            SwitchDelegate{
                anchors.fill: parent
                anchors.leftMargin: 50
                text: task_text
                checked: (status==='true'?true:false)
                onClicked: function(){
                    database.updateTaskStatus(text,checked.toString())
                }
                background: Rectangle{
                    radius: 10
                    opacity: 0
                }
            }
            Text{
                text: solving_time
                font.pixelSize: 18
                anchors.left: parent.left
                anchors.leftMargin: 5
                anchors.verticalCenter: parent.verticalCenter
            }
        }
    }
    listView.model: currentTasksListModel

    l_arrow.onClicked: function(){
        selected_date.setDate(Qt.formatDateTime(selected_date, "dd")-1)
        changeDate(selected_date)
    }

    r_arrow.onClicked: function(){
        selected_date.setDate(Qt.formatDateTime(selected_date, "dd")-(-1))
        changeDate(selected_date)
    }

    calendar_ext.onClicked: function(){
        calendar.visible = true
        calendar.height = 300
    }

    calendar.onClicked: function(_date){
        selected_date = _date
        changeDate(_date)
        calendar.visible = false
        calendar.height = 25
    }

    function changeDate(_date){
        date_text.text = _date.toLocaleDateString()
        currentTasksListModel.updateModel(Qt.formatDateTime(_date,"yyyy-MM-dd"))
    }
}
