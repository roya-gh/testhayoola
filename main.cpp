#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlFileSelector>
#include <QQuickView>

int main(int argc, char *argv[])
{
//    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

//    QGuiApplication app(argc, argv);

//    QQmlApplicationEngine engine;
//    q
//    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
//    if (engine.rootObjects().isEmpty())
//        return -1;

//    return app.exec();



    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    QGuiApplication app(argc,argv);

    QQuickView view;
    view.setFlag(Qt::FramelessWindowHint,true);
    view.connect(view.engine(), &QQmlEngine::quit, &app, &QCoreApplication::quit);
    new QQmlFileSelector(view.engine(), &view);
    view.setSource(QUrl("qrc:/main.qml"));
    if (view.status() == QQuickView::Error)\
        return -1;\
    view.setResizeMode(QQuickView::SizeRootObjectToView);
    view.show();
    return app.exec();
}
