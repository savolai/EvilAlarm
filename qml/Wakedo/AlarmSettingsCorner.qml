import QtQuick 1.0

Rectangle {
    id: rectangle1
    width: 240
    height: 150
    color: "#00000000"
    MouseArea {
        onClicked: wakedo.flipped = !wakedo.flipped
        anchors.bottom: parent.bottom;
        anchors.right: parent.right;
        width:240;
        height:150;
    }
    Image{
        id: image1
        x: 0
        height:150;
        anchors.right: parent.right
        anchors.rightMargin: 0
        source: "TimeDisplayCorner.svg"
        Image{
            source:"ok.svg"
            x:165
            y:95
            anchors.right: parent.right
            anchors.rightMargin: 9
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 15
            visible: false
        }
    }

    Text {
        id: text1
        x: 171
        y: 89
        color: "#aaaaaa"
        text: "Ok!"
        font.bold: false
        font.pixelSize: 36
    }
}
