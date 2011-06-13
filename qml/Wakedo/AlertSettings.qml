import QtQuick 1.0
import "../colibri"
Rectangle{
    id: rectangle1
    width: 800; height: 430
    color: "#1c1c1c";
    Text{
        id: buttonLabel
        x: 20
        y: 20
        color: "#ffffff"
        text: "Alarm:"
        font.family: "Nokia Sans"
        font.bold: true
        font.pointSize: 35
        z:1;
    }
    Switch {
        x: 15
        y: 80
        width: 0
        height: 0
                on: false;
                z: 0
        }
    Rectangle {
        x: 286
        y: 0
        width: 0; height: 0
        Text{
            id: buttonLabel2
            x: 20
            y: 20
            color: "#ffffff"
            text: "Alarm time:"
            font.family: "Nokia Sans"
            font.bold: true
            font.pointSize: 35
            z:1;
        }

        Column {
            y: 80; x: 20; spacing: 40

            Spinner {
                id: spinner
                width: 220; height: 350
                focus: true
                model: 24
                itemHeight: 60
                delegate: Text { font.pixelSize: 40; color:white; text: index; height: 30 }
            }

        //Text { text: "Current item index: " + spinner.currentIndex }
        }
        Column {
            y: 80; x: 250; spacing: 40
            Spinner {
                id: spinner2
                width: 220; height: 350
                focus: true
                model: 60
                itemHeight: 60
                delegate: Text { font.pixelSize: 40; color:white; text: index; height: 30 }
            }
        }

    }

}
