import QtQuick 1.0
import "../colibri"
Rectangle{
    width: 800; height: 430
    color: "grey"
    Text{
        id: buttonLabel
        color: "#ffffff"
        anchors.centerIn: parent
        text: "aaa"
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
    }
    Switch {
                anchors.centerIn: parent;
                on: false;
                z: 0
        }
    Rectangle {
        width: 240; height: 320

        Column {
            y: 20; x: 20; spacing: 20

            Spinner {
                id: spinner
                width: 200; height: 240
                focus: true
                model: 20
                itemHeight: 30
                delegate: Text { font.pixelSize: 25; text: index; height: 30 }
            }

//            Text { text: "Current item index: " + spinner.currentIndex }
        }
    }
}
