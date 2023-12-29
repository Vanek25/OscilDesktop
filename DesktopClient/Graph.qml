import QtQuick 2.0
import QtQuick.Controls 2.2

Rectangle
{
    border.width: 2

    Text {
        id: text1
        text: qsTr("Граффик")
        anchors.fill: parent
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        font.pixelSize: 19

    }

}
