#ifndef LISTMODEL_H
#define LISTMODEL_H

#include <QObject>
#include <QSqlQueryModel>

class ListModel : public QSqlQueryModel
{
    Q_OBJECT
public:
    enum Roles {
        ID_ROLE = Qt::UserRole + 1,
        TIME,
        TEXT,
        STATUS
    };

    explicit ListModel(QObject *parent = 0);

    QVariant data(const QModelIndex & index, int role = Qt::DisplayRole) const;
protected:
    QHash<int, QByteArray> roleNames() const;

public slots:
    void updateModel();
    void updateModel(QString date);
    int getId(int row);
};

#endif // LISTMODEL_H
