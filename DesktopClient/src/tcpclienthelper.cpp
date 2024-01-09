#include "include/tcpclienthelper.h"

TcpClientHelper::TcpClientHelper(QObject *parent)
    : QObject{parent}, tch_ipAddr("192.168.1.102"), tch_port(8080)
{
    timerSim = new QTimer();
    connect(timerSim, SIGNAL(timeout()), this, SLOT(sendMesSim()));
}

bool TcpClientHelper::getStatus()
{
    return tcpClient->getStatus();
}

QString TcpClientHelper::getIpAddr()
{
    return tch_ipAddr;
}

int TcpClientHelper::getPort()
{
    return tch_port;
}

void TcpClientHelper::setIpAddr(QString ipAddr)
{
    tch_ipAddr = ipAddr;

    emit ipAddrChanged(tch_ipAddr);
}

void TcpClientHelper::setPort(int port)
{
    tch_port = port;

    emit portChanged(tch_port);
}

void TcpClientHelper::startTimerSim()
{
    if(!getStatus())
    {
        qDebug() << "NO connection! Timer will not start!";
        return;
    }
    timerSim->start(16);
    qDebug() << "TimerSim started";
}

void TcpClientHelper::stopTimerSim()
{
    if(!getStatus())
    {
        qDebug() << "NO connection! Timer will not stop!";
        return;
    }
    timerSim->stop();
    qDebug() << "TimerSim stoped";
}

void TcpClientHelper::sendMesSim()
{
    sendClicked(":TEMP1?:TEMP2?:TEMP3?:TEMP4?");

}

void TcpClientHelper::setStatus(bool newStatus)
{
    if(newStatus)
    {
        emit statusChanged("Connected.");
    }
    else
    {
        emit statusChanged("Disconnected.");
    }
}

void TcpClientHelper::receivedSomething(QString message)
{
    emit someMessage(message);
}

void TcpClientHelper::gotError(QAbstractSocket::SocketError errorSocket)
{
    QString strError = "";

    switch(errorSocket)
    {
    case 0:
        strError = "Connection was refused";
        break;
    case 1:
        strError = "Remote host closed the connection";
        break;
    case 2:
        strError = "Host address was not found";
        break;
    case 5:
        strError = "Connection timed out";
        break;
    default:
        strError = "Unknown error";
    }

    emit someError(strError);
}

void TcpClientHelper::sendClicked(QString message)
{
    if(!getStatus())
    {
        qDebug() << "NO connection!";
        return;
    }

    tcpClient->tcpSocket->write(message.toStdString().data());
    qDebug() << "Send message: " << message;
}

void TcpClientHelper::connectClicked()
{
    tcpClient = new TcpClient(tch_ipAddr, tch_port);

    connect(tcpClient, &TcpClient::readMessage,   this, &TcpClientHelper::receivedSomething);
    connect(tcpClient, &TcpClient::statusChanged, this, &TcpClientHelper::setStatus);

    tcpClient->connectToHost();
}

void TcpClientHelper::disconectClicked()
{
    tcpClient->closeConnection();
}
