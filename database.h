#ifndef DATABASE_H
#define DATABASE_H

#define DATABASE_HOSTNAME "127.0.0.1"
#define DATABASE_NAME "organizer.db"

#include <QObject>
#include <QSql>
#include <QSqlQuery>
#include <QSqlError>
#include <QSqlDatabase>
#include <QFile>
#include <QDate>
#include <QDebug>

class Database : public QObject
{
    Q_OBJECT
public:
    explicit Database(QObject *parent = 0);
    ~Database();

    void connectToDatabase();
private:
    QSqlDatabase db;
    bool openDataBase();        // Открытие базы данных
    bool restoreDataBase();     // Восстановление базы данных
    void closeDataBase();       // Закрытие базы данных
    bool createTable();         // Создание базы таблицы в базе данных

signals:

public slots:
    void updateTaskStatus(QString task, QString status);
    bool createNewTask(QString task, QString time, QString date);
    bool deleteTask(QString id);
};

#endif // DATABASE_H
