import QtQuick 1.0

Rectangle{
    width: 550; height: 575
    color: "grey"
    Text{
        id: buttonLabel
        anchors.centerIn: parent
        text: "Alert settings"
        font.family: "Centabel Book"
        font.bold: true
        font.pointSize: 20
    }   Text{
        id: buttonLabel2
        anchors.centerIn: parent
        text: ""
        font.family: "Centabel Book"
        font.bold: true
        font.pointSize: 20
    }
}
