import QtQuick 6.2
import QtQuick.Controls 6.2
import io.qt.TcpClientHelepr

Window {
    width: 1100
    height: 600

    visible: true
    title: "SCPI_client_QtQuick"

    TcpClientHelepr
    {
        id: tcpClientHelper
        onStatusChanged: {
            field_incomincMes.append(addMsg(newStatus));
        }
        onSomeMessage: {
            field_incomincMes.text = addMsg(message);
        }
        onSomeError: {
            field_incomincMes.append(addMsg("Error! " + err));
            if (currentStatus != true)
            {
                tcpClientHelper.disconnectClicked();
            }
            button2.enabled = true;
        }
    }

    TextArea {
        id: field_commandSend
        x: 8
        y: 77
        width: 1000
        height: 50
        placeholderText: qsTr("Command to send")
        color: "#000000"
    }

    TextArea {
        id: field_incomincMes
        x: 8
        y: 137
        width: 700
        height: 443
        placeholderText: qsTr("Incoming messages")
        color: "#000000"
    }

    TextField {
        id: field_ipAddr
        x: 8
        y: 8
        width: 238
        height: 40
        placeholderText: qsTr("IP addr")
        color: "#F0F0F0"
        text: "192.168.1.102"
    }

    TextField {
        id: field_port
        x: 252
        y: 8
        width: 111
        height: 40
        placeholderText: qsTr("Port")
        color: "#F0F0F0"
        text: "8080"
        validator: IntValidator {bottom: 1; top: 9999}
    }

    Button {
        id: button
        x: 86
        y: 526
        width: 199
        height: 53
        text: qsTr("Send command")
        onClicked:
        {
            tcpClientHelper.sendClicked(field_commandSend.text);
            field_commandSend.clear();
        }
    }

    Button {
        id: button2
        x: 370
        y: 8
        width: 100
        height: 40
        text: qsTr("Connect")
        onClicked:
        {
            if(button2.text == "Connect")
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

    Button{
        id: simulation
        x: 500
        y: 8
        width: 100
        height: 40
        text: qsTr("CH1:SCALe?")
        onClicked: tcpClientHelper.startTimerSim();
    }

    Button{
        id: simof
        x: 630
        y: 8
        width: 70
        height: 40
        text: qsTr("Sim off")
        onClicked: tcpClientHelper.stopTimerSim();
    }

    Button{
        id: stop
        x: 720
        y: 8
        width: 60
        height: 40
        text: qsTr("Stop")
        onClicked:
        {
            tcpClientHelper.sendClicked(":STOP");
        }
    }

    Button{
        id: auto
        x: 790
        y: 8
        width: 60
        height: 40
        text: qsTr("Auto")
        onClicked:
        {
            tcpClientHelper.sendClicked(":AUTO");
        }
    }

    Button{
        id: normal
        x: 870
        y: 8
        width: 60
        height: 40
        text: qsTr("Normal")
        onClicked:
        {
            tcpClientHelper.sendClicked(":NORMal");
        }
    }

    Button{
        id: single
        x: 950
        y: 8
        width: 60
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
