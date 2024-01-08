import QtQuick 2.0
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.0

Rectangle {
    id: rectMain
    width: 900
    border.width: 2

    RowLayout
    {
        id: rowLayout
        anchors.fill: parent
        spacing: 5

        ChannelInfo
        {
            id: chInfo1
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
        }

        ChannelInfo
        {
            id: chInfo2
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
        }

        ChannelInfo
        {
            id: chInfo3
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
        }

        ChannelInfo
        {
            id: chInfo4
        }

    }

}
