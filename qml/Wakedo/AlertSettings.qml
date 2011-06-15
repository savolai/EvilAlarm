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
            color: "#131313";
        }
        GradientStop {
            position: 1.00;
            color: "#131313";
        }
    }
    border.color: "black"

    Image{
        anchors.bottom: parent.bottom;
        anchors.left: parent.left;
        width:240;
        height:150;
        source: "AlertSettingsCorner.svg"
        Image{
            source:"ok.svg"
            x:16
            y:93
        }


    }

    Text{
        id: buttonLabel
        x: 26
        y: 20
        color: "#aaaaaa"
        text: "Alarm:"
        font.bold: false
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
            color: "#aaaaaa"
            text: "Alarm time:"
            font.bold: false
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

}
