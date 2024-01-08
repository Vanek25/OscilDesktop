import QtQuick 2.11
import QtQuick.Window 2.11
import QtQuick.Controls 2.2
import io.qt.TcpClientHelepr 1.0

Window
{
    id: window
    visible: true
    width: 1150
    height: 750
    title: qsTr("Oscilloscope Client")

    SendRecvTest
    {
        id: sendRecvTest
    }

    BottomArea
    {
        id: bottomArea
        anchors.top: parent.top
        anchors.topMargin: 570
        anchors.right: parent.right
        anchors.rightMargin: 5
        anchors.left: leftArea.right
        anchors.leftMargin: 5
        border.width: 2
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 5
    }

    TopArea
    {
        id: topArea
        height: 68
        anchors.right: parent.right
        anchors.rightMargin: 5
        anchors.left: parent.left
        anchors.leftMargin: 5
        anchors.top: parent.top
        anchors.topMargin: 5
        border.width: 2

        Button {
            x: 556
            y: 17
            width: 165
            height: 36
            text: "Open Test"
            onClicked: sendRecvTest.show()
        }
    }

    LeftArea
    {
        id: leftArea
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 6
        anchors.top: topArea.bottom
        anchors.topMargin: 7
        anchors.left: parent.left
        anchors.leftMargin: 5
        anchors.right: graph.left
        anchors.rightMargin: 6
    }

    Graph
    {
        id: graph
        anchors.bottom: bottomArea.top
        anchors.bottomMargin: 6
        anchors.top: topArea.bottom
        anchors.topMargin: 7
        anchors.left: leftArea.left
        anchors.leftMargin: 157
        anchors.right: parent.right
        anchors.rightMargin: 5
    }
    
}
