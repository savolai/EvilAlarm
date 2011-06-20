import QtQuick 1.0
//import Qt.labs.gestures 1.0

Rectangle{
    width: 800; height: 430
    property bool flipped: false
    property alias alarmTime: alarmText
    property alias alarmTimeText: alarmText.text
    property alias alarm: alarmBox
    property alias noAlarm: noAlarmText

    //property alias alarmTimeVisible: timeText.visible
    gradient: Gradient {
        GradientStop {
            position: 0.00;
            color: "#4b4f59";
        }
        GradientStop {
            position: 0.35;
            color: "#232323";
        }
        GradientStop {
            position: 1.00;
            color: "#232323";
        }
    }
    Clock2{
        anchors.centerIn: parent
        MouseArea {
            onClicked: timeDisplay.flipped = !timeDisplay.flipped
            x:0;
            y:0;
            width:320;
            height:430;
        }
    }
    // none of this works on n900, will test once can get a hold on a better device
/*    GestureArea {
        anchors.fill: parent
        focus: true

        // Only some of the many gesture properties are shown. See Gesture documentation.

          onTap:
            noAlarmText.text="tap pos = ("+gesture.position.x+","+gesture.position.y+")";
        onTapAndHold:
            noAlarmText.text="tap and hold pos = ("+gesture.position.x+","+gesture.position.y+")";
        onPan:
            noAlarmText.text="pan delta = ("+gesture.delta.x+","+gesture.delta.y+") acceleration = "+gesture.acceleration;
        onPinch:
            noAlarmText.text="pinch center = ("+gesture.centerPoint.x+","+gesture.centerPoint.y+") rotation ="+gesture.rotationAngle+" scale ="+gesture.scaleFactor;
        onSwipe:
            noAlarmText.text="swipe angle="+gesture.swipeAngle
        onGesture:
            noAlarmText.text="gesture hot spot"+gesture.hotSpot.x+" "+gesture.hotSpot.y+")"
    }
    */
    // usability test conclusion: clock picture
    // should also serve as trigger for setting alarm
    // it is an alarm clock so it is reasonable that users assume
    // it can be used to access alarm settings

    Text {
        id: timeText
        x: 390;
        y: 90;
        //anchors.horizontalCenter: parent.horizontalCenter
        color: "#dddddd"
        font.family: "Nokia Sans"
        font.pixelSize: 100
        style: Text.Raised; styleColor: "grey"
    }
    Text {
        id: noAlarmText
        x: 395;
        y: 220
        text: ""
        visible: true
        //anchors.horizontalCenter: parent.horizontalCenter
        color: "#555"
        font.family: "Nokia Sans"
        font.pixelSize: 30
        //style: Text.Raised; styleColor: "white"
    }
    Image{
        anchors.bottom: parent.bottom;
        anchors.right: parent.right;
        width:240;
        height:150;
        Image{
            source:"bell.png"
            x:160
            y:67
        }

        source: "TimeDisplayCorner.svg"

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
            text: "Alarm at"
            visible: true
            font.pixelSize: 30
        font.family: "Nokia Sans"
    }

    }
}
