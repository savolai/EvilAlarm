import QtQuick 1.0

Flipable {
    id: wakedo

    //property alias image: frontImage.source
    property int xAxis: 0
    property int yAxis: 0
    property int angle: 0
    property string alarmMinutesPadded
    property string alarmHoursPadded
    property bool flipped: false

    function showAlarmTime() {
        timeDisplay.clock.alarmHours=alertSettings.hour;
        timeDisplay.clock.alarmMinutes=alertSettings.minute;

        timeDisplay.clock.alarmOn=alertSettings.alarmOn;

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



//    state: "front"

    states: [State {
        name: "backstate"; when: wakedo.flipped
        PropertyChanges {
            target: rotation1;
            // this is negative to make rotation go reverse, i.e. to have paper fold approach user
            angle: -wakedo.angle }
    },State {
    name: "alarmOn"; when: alertSettings.alarmOn
        StateChangeScript {
            script: showAlarmTime();
        }
        PropertyChanges {
            target: timeDisplay.alarm;
            visible:true
        }
        PropertyChanges {
            target: timeDisplay.alarmTime;
            visible:true
        }
        PropertyChanges {
            target: timeDisplay.noAlarm;
            visible:false
        }
    },State {
            name: "alarmOff"; when: !alertSettings.alarmOn
                StateChangeScript {
                    script: showAlarmTime();
                }
                PropertyChanges {
                    target: timeDisplay.noAlarm;
                    // this is negative to make rotation go reverse, i.e. to have paper fold approach user
                    text: "No alarm" //alertSettings.hour+":"+alertSettings.minute
                    visible:true
                }
            }]
    transform: Rotation {
        id: rotation1; origin.x: wakedo.width / 2; origin.y: wakedo.height / 2
        axis.x: wakedo.xAxis; axis.y: wakedo.yAxis;axis.z: 0;
    }

    transitions: Transition {
        ParallelAnimation {
            NumberAnimation { target: rotation1; properties: "angle"; duration: 600 }
            /*SequentialAnimation {
                NumberAnimation { target: wakedo; property: "scale"; to: 1.0; duration: 300 }
                NumberAnimation { target: wakedo; property: "scale"; to: 1.00; duration: 300 }
            }*/
        }
    }

}
