import QtQuick 2.0
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.0

Rectangle {
    id: rectMain
    border.width: 2
    RowLayout
    {
        id: rowLayout
        anchors.rightMargin: 8
        anchors.bottomMargin: 8
        anchors.leftMargin: 8
        anchors.topMargin: 8
        anchors.fill: parent
        spacing: 5

        Button
        {
            id: button
            x: 56
            y: 5
            text: qsTr("Button")
        }

        Button
        {
            id: button1
            x: 156
            y: 5
            text: qsTr("Button")
        }

        Button
        {
            id: button2
            x: 156
            y: 5
            text: qsTr("Button")
        }

        Button
        {
            id: button3
            x: 156
            y: 5
            text: qsTr("Button")
        }

        Button
        {
            id: button4
            x: 156
            y: 5
            text: qsTr("Button")
        }

        Button
        {
            id: button5
            x: 156
            y: 5
            text: qsTr("Button")
        }
    }

}
