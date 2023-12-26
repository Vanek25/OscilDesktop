#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include "tcpclienthelper.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    qmlRegisterType<TcpClientHelper>("io.qt.TcpClientHelepr", 1, 0, "TcpClientHelepr");

    QQmlApplicationEngine engine;
    const QUrl url(u"qrc:/SCPI_Quick_noDesignStudio/Main.qml"_qs);
    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreationFailed,
        &app,
        []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
