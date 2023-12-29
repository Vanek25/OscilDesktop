import QtQuick 2.11
import QtQuick.Window 2.11
import QtQuick.Controls 2.2
import io.qt.TcpClientHelepr 1.0

Window
{
    width: 1150
    height: 566
    title: qsTr("Send / Receive test")


    TcpClientHelepr
    {
        id: tcpClientHelper
        onStatusChanged:
        {
            field_incomincMes.append(addMsg(newStatus));
        }
        onSomeMessage:
        {
            field_incomincMes.text = addMsg(message);
        }
        onSomeError:
        {
            field_incomincMes.append(addMsg("Error! " + err));
            if (currentStatus !== true)
            {
                tcpClientHelper.disconnectClicked();
            }
            button2.enabled = true;
        }
    }

    TextArea
    {
        id: field_commandSend
        x: 8
        y: 54
        width: 848
        height: 50
        placeholderText: qsTr("Command to send")
        color: "#000000"
        verticalAlignment: Text.AlignVCenter
    }

    TextArea
    {
        id: field_incomincMes
        x: 8
        y: 110
        width: 992
        height: 443
        placeholderText: qsTr("Incoming messages")
        color: "#000000"
        verticalAlignment: Text.AlignTop
    }

    TextField
    {
        id: field_ipAddr
        x: 8
        y: 8
        width: 238
        height: 40
        placeholderText: qsTr("IP addr")
        color: "#000000"
        text: "192.168.1.102"
    }

    TextField
    {
        id: field_port
        x: 252
        y: 8
        width: 111
        height: 40
        placeholderText: qsTr("Port")
        color: "#000000"
        text: "8080"
        validator: IntValidator {bottom: 1; top: 9999}
    }

    Button
    {
        id: button
        x: 862
        y: 54
        width: 138
        height: 50
        text: qsTr("Send command")
        onClicked:
        {
            tcpClientHelper.sendClicked(field_commandSend.text);
            field_commandSend.clear();
        }
    }

    Button
    {
        id: button2
        x: 370
        y: 8
        width: 103
        height: 40
        text: qsTr("Connect")
        onClicked:
        {
            if(button2.text === "Connect")
            {
                tcpClientHelper._ipAddr = field_ipAddr.text;
                tcpClientHelper._port = parseInt(field_port.text);

                tcpClientHelper.connectClicked();
                button2.text = "Disconnect";
            }
            else
            {
                tcpClientHelper.disconectClicked();
                button2.text = "Connect";
            }
        }
    }

    Button
    {
        id: simulation
        x: 538
        y: 8
        width: 184
        height: 40
        text: qsTr("CH1:SCALe? 60 recv/s")
        onClicked: tcpClientHelper.startTimerSim();
    }

    Button
    {
        id: simof
        x: 747
        y: 8
        width: 143
        height: 40
        text: qsTr("Stop 60 recv/s")
        onClicked: tcpClientHelper.stopTimerSim();
    }

    Button
    {
        id: stop
        x: 1022
        y: 59
        width: 102
        height: 40
        text: qsTr("Stop")
        onClicked:
        {
            tcpClientHelper.sendClicked(":STOP");
        }
    }

    Button
    {
        id: auto
        x: 1022
        y: 105
        width: 102
        height: 40
        text: qsTr("Auto")
        onClicked:
        {
            tcpClientHelper.sendClicked(":AUTO");
        }
    }

    Button
    {
        id: normal
        x: 1022
        y: 151
        width: 102
        height: 40
        text: qsTr("Normal")
        onClicked:
        {
            tcpClientHelper.sendClicked(":NORMal");
        }
    }

    Button
    {
        id: single
        x: 1022
        y: 197
        width: 102
        height: 40
        text: qsTr("Single")
        onClicked:
        {
            tcpClientHelper.sendClicked(":SINGle");
        }
    }

    function addMsg(someText)
    {
        return "[" + currentTime() + "] " + someText;
    }

    function currentTime()
    {
        var now = new Date();
        var nowString = ("0" + now.getHours()).slice(-2) + ":"
            + ("0" + now.getMinutes()).slice(-2) + ":"
            + ("0" + now.getSeconds()).slice(-2);
        return nowString;
    }
}
