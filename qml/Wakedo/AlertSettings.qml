import QtQuick 1.0
import "../colibri"
Rectangle{
    id: rectangle1
    width: 800; height: 430
    color: "#2e3442"
    gradient: Gradient {
        GradientStop {
            position: 0.00;
            color: "#3b3f49";
        }
        GradientStop {
            position: 0.35;
            color: "#1c1c1c";
        }
        GradientStop {
            position: 1.00;
            color: "#1c1c1c";
        }
    }
    border.color: "black"
    Text{
        id: buttonLabel
        x: 26
        y: 20
        color: "#ffffff"
        text: "Alarm:"
        font.family: "Nokia Sans"
        font.bold: true
        font.pointSize: 35
        z:1;
    }
    Switch {
        x: 29
        y: 98
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
                width: 220; height: 320
                focus: true
                model: 24
                itemHeight: 60
                delegate: Text { font.pixelSize: 45;  text: index; height: 60 }
            }

        }
        Column {
            y: 80; x: 250; spacing: 40
            Spinner {
                id: spinner2
                width: 220; height: 320
                focus: true
                model: 60
                itemHeight: 60
                delegate: Text { font.pixelSize: 45;  text: index; height: 60 }
            }
        }

    }

    Text {
        id: buttonLabel1
        x: 118
        y: 256
        color: "#535353"
        text: "Surprise: ?"
        font.family: "Nokia Sans"
        font.bold: true
        font.pointSize: 20
        z: 1
    }

}
