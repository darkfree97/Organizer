#include "listmodel.h"
#include <QDateTime>

ListModel::ListModel(QObject *parent) :
    QSqlQueryModel(parent)
{
    this->updateModel();
}

QVariant ListModel::data(const QModelIndex &index, int role) const{
    int columnId = role - Qt::UserRole - 1;
    // Создаём индекс с помощью новоиспечённого ID колонки
    QModelIndex modelIndex = this->index(index.row(), columnId);
    /* И с помощью уже метода data() базового класса
     * вытаскиваем данные для таблицы из модели
     * */
    return QSqlQueryModel::data(modelIndex, Qt::DisplayRole);
}

QHash<int, QByteArray> ListModel::roleNames() const {
    /* То есть сохраняем в хеш-таблицу названия ролей
     * по их номеру
     * */
    QHash<int, QByteArray> roles;
    roles[ID_ROLE] = "_id";
    roles[TIME] = "solving_time";
    roles[TEXT] = "task_text";
    roles[STATUS] = "status";
    return roles;
}

void ListModel::updateModel()
{
    // Обновление производится SQL-запросом к базе данных
    this->setQuery("SELECT id, solving_time, task_text, status FROM tasks WHERE solving_date=\""+QDateTime().currentDateTime().toString("yyyy-MM-dd")+"\" ORDER BY solving_time;");
}

void ListModel::updateModel(QString date)
{
    // Обновление производится SQL-запросом к базе данных
    this->setQuery("SELECT id, solving_time, task_text, status FROM tasks WHERE solving_date=\""+date+"\" ORDER BY solving_time;");
}

int ListModel::getId(int row)
{
    return this->data(this->index(row, 0), ID_ROLE).toInt();
}
