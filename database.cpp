#include "database.h"


Database::Database(QObject *parent) : QObject(parent)
{
}

Database::~Database(){
    this->closeDataBase();
}

void Database::connectToDatabase(){
    if(!QFile("./" DATABASE_NAME).exists()){
        this->restoreDataBase();
    }
    else {
        this->openDataBase();
    }
}

bool Database::restoreDataBase(){
    if (this->openDataBase()){
        return (this->createTable()) ? true : false ;
    }
    else{
        return false;
    }
}

bool Database::openDataBase(){
    db = QSqlDatabase::addDatabase("QSQLITE");
    db.setHostName(DATABASE_HOSTNAME);
    db.setDatabaseName("./" DATABASE_NAME);
    if(db.open()){
        return true;
    } else {
        return false;
    }
}

void Database::closeDataBase(){
    db.close();
}

bool Database::createTable(){
    QSqlQuery query;
    if(!query.exec("CREATE TABLE tasks("
                   "id INTEGER PRIMARY KEY AUTOINCREMENT,"
                   "solving_time VARCHAR(5) NOT NULL,"
                   "task_text VARCHAR(255) NOT NULL,"
                   "status BOOLEAN DEFAULT 0,"
                   "solving_date DATE NOT NULL);")){
        return false;
    }
    else{
        return true;
    }
}

void Database::updateTaskStatus(QString task, QString status){
    QSqlQuery query;
    query.exec("UPDATE tasks SET status=\""+status+"\" WHERE task_text=\""+task+"\";");
}

bool Database::createNewTask(QString task, QString time, QString date){
    QSqlQuery query;
    return query.exec("INSERT INTO tasks(solving_time, task_text, solving_date) VALUES (\""+time+"\", \""+task+"\", \""+date+"\");");
}
bool Database::deleteTask(QString id){
    QSqlQuery query;
    return query.exec("DELETE FROM tasks WHERE id="+id+";");
}
