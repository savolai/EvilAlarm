import QtQuick 1.0

Flipable {
    id: wakeDo

    //property alias image: frontImage.source
    property int xAxis: 0
    property int yAxis: 0
    property int angle: 0
    property string alarmMinutesPadded
    property string alarmHoursPadded

    function showTime() {
        if(alertSettings.hour>0 && alertSettings.hour<10){
            alarmHoursPadded="0"+alertSettings.hour
        }else{
            alarmHoursPadded=alertSettings.hour
        }
        if(alertSettings.minute<10){
            alarmMinutesPadded="0"+alertSettings.minute
        }else{
            alarmMinutesPadded=alertSettings.minute
        }
        timeDisplay.alarmTimeText="Alarm at "+alarmHoursPadded+":"+alarmMinutesPadded
    }

    width: 800; height: 430

    front: TimeDisplay{id:timeDisplay}
    back: AlertSettings{id:alertSettings}

    MouseArea {
        onClicked: timeDisplay.flipped = !timeDisplay.flipped
        anchors.bottom: parent.bottom;
        anchors.right: parent.right;
        width:240;
        height:150;
    }


//    state: "front"

    states: [State {
        name: "backstate"; when: timeDisplay.flipped
        PropertyChanges {
            target: rotation1;
            // this is negative to make rotation go reverse, i.e. to have paper fold approach user
            angle: -wakeDo.angle }
    },State {
    name: "alarmOn"; when: alertSettings.alarmOn
        StateChangeScript {
            script: showTime();
        }
        PropertyChanges {
            target: timeDisplay.alarm;
            // this is negative to make rotation go reverse, i.e. to have paper fold approach user
            visible:true
        }
        PropertyChanges {
            target: timeDisplay.alarmTime;
            // this is negative to make rotation go reverse, i.e. to have paper fold approach user
            visible:true
        }
        PropertyChanges {
            target: timeDisplay.noAlarm;
            // this is negative to make rotation go reverse, i.e. to have paper fold approach user
            visible:false
        }
    },State {
            name: "alarmOff"; when: !alertSettings.alarmOn
                PropertyChanges {
                    target: timeDisplay.noAlarm;
                    // this is negative to make rotation go reverse, i.e. to have paper fold approach user
                    text: "No alarm" //alertSettings.hour+":"+alertSettings.minute
                    visible:true
                }
            }]
    transform: Rotation {
        id: rotation1; origin.x: wakeDo.width / 2; origin.y: wakeDo.height / 2
        axis.x: wakeDo.xAxis; axis.y: wakeDo.yAxis;axis.z: 0;
    }

    transitions: Transition {
        ParallelAnimation {
            NumberAnimation { target: rotation1; properties: "angle"; duration: 600 }
            /*SequentialAnimation {
                NumberAnimation { target: wakeDo; property: "scale"; to: 1.0; duration: 300 }
                NumberAnimation { target: wakeDo; property: "scale"; to: 1.00; duration: 300 }
            }*/
        }
    }

}
