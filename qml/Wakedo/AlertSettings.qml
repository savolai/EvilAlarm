import QtQuick 1.0
import "../colibri"
Rectangle{
    id: rectangle1
    width: 800; height: 430
    color: "#333";
    Text{
        id: buttonLabel
        x: 371
        y: 324
        color: "#535353"
        text: "Alarm:"
        font.family: "DejaVu Sans Mono"
        font.bold: true
        font.pointSize: 35
        z:1;
    }   Text{
        id: buttonLabel2
        anchors.centerIn: parent
        text: ""
        font.family: "Nokia Sans"
        font.bold: true
        font.pointSize: 20
    }
    Switch {
        x: 530
        y: 290
        width: 0
        height: 0
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
