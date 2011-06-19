import QtQuick 1.0
import "../colibri"
Rectangle{
    property alias hour: spinnerHour.currentIndex
    property alias minute: spinnerMinute.currentIndex
    property alias alarmOn: alarm.on
    onHourChanged: {
        if(!alarm.on){
            alarm.toggle()
        }
    }
    onMinuteChanged: {
        if(!alarm.on){
            alarm.toggle()
        }
    }
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
        x: 84
        y: 20
        color: "#aaaaaa"
        text: "Alarm:"
        font.bold: false
        font.pointSize: 35
        z:1;
    }
    Switch {
        id:alarm
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
            x: 21
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
                id: spinnerHour
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
                //the following works well otherwise but the spinner breaks:
                /*MouseArea {
                    anchors.fill: parent
                    onFocusChanged: {
                        alarm.knob.x=1
                        alarm.on=true
                    }
                }*/
                id: spinnerMinute
                width: 220; height: 320
                focus: true
                model: 60
                itemHeight: 60
                delegate: Text { font.pixelSize: 45;  text: index; height: 60 }
            }
        }


    }

    Image {
        x: 28
        y: 23
        width: 50
        height: 48
        smooth: true
        source: "bell.png"
    }

}
