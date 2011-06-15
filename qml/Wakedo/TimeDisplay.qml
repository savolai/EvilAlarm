import QtQuick 1.0

Rectangle{
    width: 800; height: 430
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
    Clock2{
        anchors.centerIn: parent
    }

    Text {
        id: timeText
        x: 390;
        y: 90;
        //anchors.horizontalCenter: parent.horizontalCenter
        color: "white"
        font.family: "Nokia Sans"
        font.pixelSize: 100
        style: Text.Raised; styleColor: "grey"
    }
    Text {
        id: noAlarmText
        x: 395;
        y: 220
        text: "No alarms and no surprises"
        visible: true
        //anchors.horizontalCenter: parent.horizontalCenter
        color: "#555"
        font.family: "Nokia Sans"
        font.pixelSize: 30
        //style: Text.Raised; styleColor: "white"
    }

    Rectangle {
        id: alarmBox
        x: 395
        y: 203
        width: 370
        height: 64
        color: "#00000000"
        visible: false

        Image {
            id: image2
            x: 0
            y: 0
            source: "Wakedo.png"
        }

        Text {
            id: alarmText
            x: 80
            y: 17
            color: "#c4c4c4"
            text: "Alarm at 15:03"
            visible: true
            font.pixelSize: 30
        font.family: "Nokia Sans"
    }

    }
}
