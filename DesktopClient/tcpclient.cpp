#include "tcpclient.h"

TcpClient::TcpClient(QString ipAddress, int port) : QObject(), m_nNextBlockSize(0)
{
    _ipAddress = ipAddress;
    _port = port;

    _status = false;

    tcpSocket = new QTcpSocket();
    connect(tcpSocket, &QTcpSocket::disconnected, this, &TcpClient::closeConnection);
}

bool TcpClient::getStatus()
{
    return _status;
}

void TcpClient::connectToHost()
{
    qDebug() << "Try to connect to host:" << _ipAddress << _port;

    tcpSocket->connectToHost(_ipAddress, _port);

    connect(tcpSocket, &QTcpSocket::connected, this, &TcpClient::connected);
    connect(tcpSocket, &QTcpSocket::readyRead, this, &TcpClient::readyRead);

    if(!tcpSocket->waitForConnected(3000))
    {
        qDebug() << "Error: " << tcpSocket->errorString();
    }
}

void TcpClient::connectionTimeout()
{
    if(tcpSocket->state() == QAbstractSocket::ConnectingState)
    {
        tcpSocket->abort();
        emit tcpSocket->error();
    }

    qDebug() << "Connection timeout" << _ipAddress << _port;
}

void TcpClient::closeConnection()
{
    disconnect(tcpSocket, &QTcpSocket::connected, 0, 0);
    disconnect(tcpSocket, &QTcpSocket::readyRead, 0, 0);

    bool shouldEmit = false;
    switch (tcpSocket->state())
    {
    case 0:
        tcpSocket->disconnectFromHost();
        shouldEmit = true;
        break;
    case 2:
        tcpSocket->abort();
        shouldEmit = true;
        break;
    default:
        tcpSocket->abort();
    }

    if (shouldEmit)
    {
        _status = false;
        emit statusChanged(_status);
    }
}

void TcpClient::readyRead()
{
    QByteArray arrayAllMessage;
    arrayAllMessage = tcpSocket->readAll();

    emit readMessage(arrayAllMessage);

    qDebug() << "Recv message: " << arrayAllMessage;
}

void TcpClient::connected()
{
    qDebug() << "Connection success";
    _status = true;
    emit statusChanged(_status);
}

