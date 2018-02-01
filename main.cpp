#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>

#include "database.h"
#include "listmodel.h"

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    QGuiApplication app(argc, argv);
    QQmlApplicationEngine engine;

    Database database;
    database.connectToDatabase();

    ListModel *model1 = new ListModel();
    ListModel *model2 = new ListModel();

    engine.rootContext()->setContextProperty("currentTasksListModel", model1);
    engine.rootContext()->setContextProperty("editMenuListModel", model2);
    engine.rootContext()->setContextProperty("database", &database);

    engine.load(QUrl(QLatin1String("qrc:/main.qml")));

    return app.exec();
}
