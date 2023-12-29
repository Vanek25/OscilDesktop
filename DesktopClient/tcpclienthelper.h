#ifndef TCPCLIENTHELPER_H
#define TCPCLIENTHELPER_H

#include <QObject>
#include "tcpclient.h"
#include <QAbstractSocket>

class TcpClientHelper : public QObject
{
    Q_OBJECT
    Q_PROPERTY(bool currentStatus READ   getStatus
                   NOTIFY statusChanged
               )
    Q_PROPERTY(QString _ipAddr WRITE  setIpAddr
                   READ   getIpAddr
                       NOTIFY ipAddrChanged
               )
    Q_PROPERTY(int _port  WRITE  setPort
                   READ   getPort
                       NOTIFY portChanged
               )

    QString tch_ipAddr;
    int tch_port;

public:
    explicit TcpClientHelper(QObject *parent = nullptr);

    bool    getStatus();
    QString getIpAddr();
    int     getPort();

    void setIpAddr(QString ipAddr);
    void setPort(int port);


signals:
    void statusChanged(QString newStatus);
    void someError(QString error);
    void someMessage(QString message);
    void ipAddrChanged(QString ipAddr);
    void portChanged(int port);
    void timerOn();
    void timerOff();

public slots:
    void setStatus(bool newStatus);
    void receivedSomething(QString message);
    void gotError(QAbstractSocket::SocketError errorSocket);
    void sendClicked(QString message);
    void connectClicked();
    void disconectClicked();
    void startTimerSim();
    void stopTimerSim();
    void sendMesSim();

private:
    TcpClient *tcpClient;
    QTimer *timerSim;
};

#endif // TCPCLIENTHELPER_H
