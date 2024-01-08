import QtQuick 2.11
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

Rectangle
{
    id: main
    width: 200
    height: 80
    border.width: 2

    RowLayout {
        id: row
        anchors.fill: parent
        spacing: 0

        Button
        {
            id: button
            width: 50
            Layout.preferredHeight: row.height
            Layout.preferredWidth: row.width * 0.25
            height: row.height
            text: qsTr("CH N")
            Layout.margins: 2
            highlighted: false
            flat: false
            display: AbstractButton.TextOnly
            Layout.fillHeight: true
            background: Rectangle
            {
                color: "#ffff00"
            }

            contentItem: Text {
                text: button.text
                anchors.verticalCenter: parent.verticalCenter
                horizontalAlignment: Text.AlignHCenter
                anchors.horizontalCenter: parent.horizontalCenter
                verticalAlignment: Text.AlignVCenter
                color: "#000000"
            }

        }

        GridLayout {
            id: gridLayout
            anchors.left: button.right
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            Layout.fillHeight: true
            Layout.margins: 2
            Layout.topMargin: 0
            rows: 3
            columns: 2

            Label
            {
                text: "Param 1"
                horizontalAlignment: Text.AlignHCenter
                Layout.fillHeight: true
                Layout.fillWidth: true
                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
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
