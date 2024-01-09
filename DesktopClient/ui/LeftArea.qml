import QtQuick 2.0
import QtQuick.Controls 2.2

Rectangle
{
    id: rectangle
    border.width: 2

    Text
    {
        id: text1
        anchors.fill: parent
        fontSizeMode: Text.FixedSize
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        font.pixelSize: 19
    }

}
