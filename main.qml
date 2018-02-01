import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0

ApplicationWindow {
    visible: true
    width: 480
    height: 800
    title: qsTr("Organizer")

    SwipeView {
        id: swipeView
        anchors.fill: parent
        currentIndex: tabBar.currentIndex
        CurrentTasks{
            id: currentTasks
        }

        EditMenu{
            id: editMenu
        }

        onCurrentItemChanged: {
            if(currentIndex === 1){
                editMenu.control_task_date.setDate(Qt.formatDateTime(new Date(), "dd")-(-1))
                editMenu.update()
            }
            else{
                currentTasksListModel.updateModel(Qt.formatDateTime(currentTasks.selected_date, "yyyy-MM-dd"))
            }
        }
    }

    footer: TabBar {
        id: tabBar
        currentIndex: swipeView.currentIndex
        TabButton {
            text: qsTr("Завдання")
        }
        TabButton {
            text: qsTr("Меню")
        }
    }
}
