import QtQuick 1.0
import "../colibri"
Rectangle{
    id: alertSettings

    property alias hour: spinnerHour.currentIndex
    property alias minute: spinnerMinute.currentIndex

    property alias alarmOn: alarmSwitch.on

    property string secondsPadded
    property string minutesPadded
    property string hoursPadded

    property int hours
    property int minutes
    property int seconds
    // time zone shift; not in use
    property real shift: 0

// an attempt to have minutes padded with zeroes in minute spinner
/*    property int i;


    function initSpinner(){
        for(i=0;i<60;i++){
            if(i<10){
                i="0"+i
            }
            minutemodel.append(""+i)
        }
        return minutemodel
    }
*/


    function updateUntilAlarm() {
        if(alarmOn){
            var date = new Date;
            hours = shift ? date.getUTCHours() + Math.floor(clock.shift) : date.getHours()
            minutes = shift ? date.getUTCMinutes() + ((clock.shift % 1) * 60) : date.getMinutes()
            seconds = date.getUTCSeconds();

            var totalMinutes = hours*60+minutes;
            var totalAlarmMinutes = hour*60+minute;
            var hoursLeft;
            var minutesLeft;
            if(totalMinutes > totalAlarmMinutes){
                // the alarm is tomorrow
                var minutesLeftToday = 60*24-totalMinutes
                hoursLeft=Math.floor((minutesLeftToday + totalAlarmMinutes)/60)
                minutesLeft=Math.floor((minutesLeftToday + totalAlarmMinutes)%60)
            }else{
                // the alarm is today
                hoursLeft=Math.floor((totalAlarmMinutes-totalMinutes)/60);
                minutesLeft=Math.floor((totalAlarmMinutes-totalMinutes)%60);
            }

            if(hoursLeft<10){
                hoursPadded="0"+hoursLeft
            }else{
                hoursPadded=hoursLeft
            }
            if(minutesLeft<10){
                minutesPadded="0"+minutesLeft
            }else{
                minutesPadded=minutesLeft
            }

            //timeText.text = hoursPadded +":"+ minutesPadded // SECONDS ARE DISTRACTING? +":"+ secondsPadded
            // the date was too much
            //dateText.text = date.getDate() +"."+  date.getMonth() +"."+  date.getFullYear();
            /// @todo get local date format
            //dateText.text = date.toDateString();

            untilAlarm.text = "Time until alarm:\n"+hoursPadded+" h "+minutesPadded+" min"
        }
        else{
            untilAlarm.text="";
        }



    }



    Timer {
        interval: 1000; running: true; repeat: true;
        onTriggered: updateUntilAlarm();
    }

    onAlarmOnChanged: {
        updateUntilAlarm();
    }
    onHourChanged: {
        if(!alarmSwitch.on){
            alarmSwitch.toggle();
        }
    }
    onMinuteChanged: {
        if(!alarmSwitch.on){
            alarmSwitch.toggle();
        }
    }

    width: 800; height: 430
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
    border.color: "black"

    Image{
        x: 561
        y: 281
        anchors.bottom: parent.bottom;
        anchors.left: parent.left;
        width:240;
        height:150;
        anchors.bottomMargin: -1
        anchors.leftMargin: 561
        source: "TimeDisplayCorner.svg"
        Image{
            source:"ok.svg"
            x:164
            y:95
            visible: false
        }


    }
    MouseArea {
        onClicked: wakedo.flipped = !wakedo.flipped
        anchors.bottom: parent.bottom;
        anchors.right: parent.right;
        width:240;
        height:150;

        Text {
            id: text1
            x: 171
            y: 89
            color: "#aaaaaa"
            text: "Ok!"
            font.bold: false
            font.pixelSize: 36
        }
    }

    Text{
        id: buttonLabel
        x: 518
        y: 26
        color: "#aaaaaa"
        text: "Alarm:"
        font.bold: false
        font.pointSize: 35
        z:1;
    }
    Switch {
        id:alarmSwitch
        x: 518
        y: 92
        width: 0
        height: 0
                on: false;
                z: 0
        }

    Rectangle {
        x: -1
        y: -1
        width: 0; height: 0
        Text{
            id: buttonLabel2
            x: 77
            y: 25
            color: "#aaaaaa"
            text: "Alarm time:"
            font.bold: false
            font.pointSize: 35
            z:1;

            Image {
                x: -56
                y: 4
                width: 50
                height: 48
                smooth: true
                source: "bell.png"
            }
        }

        Column {
            y: 90; x: 21; spacing: 40

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
            y: 90; x: 251; spacing: 40
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

    Text {
        id: untilAlarm
        x: 518
        y: 231
        color: "#aaaaaa"
        text: ""
        font.pixelSize: 28
    }

}
