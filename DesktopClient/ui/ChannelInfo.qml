import QtQuick 2.11
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3

Rectangle
{
    id: main
    width: 200
    height: 80
    border.width: 2

    RowLayout {
        id: row
        anchors.rightMargin: 2
        anchors.leftMargin: 2
        anchors.bottomMargin: 2
        anchors.topMargin: 2
        anchors.fill: parent
        spacing: 0

        Button {
            id: button
            x: 8
            y: 20
            width: 60
            text: qsTr("CH N")
            padding: 6
            Layout.fillHeight: true
            background: Rectangle
            {
                color: "#ffff00"
            }

            contentItem: Text {
                text: button.text
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                color: "#000000"
            }
        }


        GridLayout {
            id: gridLayout
            scale: 0.01
            Layout.fillWidth: true
            Layout.fillHeight: true
            Layout.margins: 2
            Layout.topMargin: 0
            rows: 3
            columns: 2

            Label
            {
                text: "Param 1"
                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                Layout.fillHeight: true
                Layout.fillWidth: true
                color: "#000000"
                verticalAlignment: Qt.AlignVCenter
            }

            Label
            {
                text: "Param 2"
                horizontalAlignment: Text.AlignHCenter
                Layout.fillHeight: true
                Layout.fillWidth: true
                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                color: "#000000"
                verticalAlignment: Qt.AlignVCenter
            }

            Label
            {
                text: "Param 3"
                horizontalAlignment: Text.AlignHCenter
                Layout.fillHeight: true
                Layout.fillWidth: true
                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                color: "#000000"
                verticalAlignment: Qt.AlignVCenter
            }

            Label
            {
                text: "Param 4"
                horizontalAlignment: Text.AlignHCenter
                Layout.fillHeight: true
                Layout.fillWidth: true
                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                color: "#000000"
                verticalAlignment: Qt.AlignVCenter
            }

            Label
            {
                text: "Param 5"
                horizontalAlignment: Text.AlignHCenter
                Layout.fillHeight: true
                Layout.fillWidth: true
                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                color: "#000000"
                verticalAlignment: Qt.AlignVCenter
            }

            Label
            {
                text: "Param 6"
                horizontalAlignment: Text.AlignHCenter
                Layout.fillHeight: true
                Layout.fillWidth: true
                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                color: "#000000"
                verticalAlignment: Qt.AlignVCenter
            }

        }



    }




}
