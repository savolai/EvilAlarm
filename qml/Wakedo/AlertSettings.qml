import QtQuick 1.0

Rectangle{
    width: 550; height: 575
    color: "grey"
    Text{
        id: buttonLabel
        color: "#ffffff"
        anchors.centerIn: parent
        text: "Alert settings"
        font.family: "Centabel Book"
        font.bold: true
        font.pointSize: 20
        z:1;
    }   Text{
        id: buttonLabel2
        anchors.centerIn: parent
        text: ""
        font.family: "Centabel Book"
        font.bold: true
        font.pointSize: 20
    }    Switch { anchors.centerIn: parent; on: false;z: 0 }

}
