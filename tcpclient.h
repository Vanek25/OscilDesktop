#ifndef TCPCLIENT_H
#define TCPCLIENT_H

#include <QObject>
#include <QTcpSocket>
#include <QTimer>
#include <QDataStream>

class TcpClient : public QObject
{
    Q_OBJECT
public:
    TcpClient(QString ipAddress, int port);

    bool getStatus();
    QTcpSocket *tcpSocket;

public slots:
    void connectToHost();
    void closeConnection();

signals:
    void readMessage(QString message);
    void statusChanged(bool);

private slots:
    void readyRead();
    void connected();
    void connectionTimeout();

private:
    QString _ipAddress;
    int _port;
    bool _status;
    quint16 m_nNextBlockSize;
};

#endif // TCPCLIENT_H
