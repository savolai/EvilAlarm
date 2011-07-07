import QtQuick 1.0
import "../colibri"
Rectangle{
    id: alarmSettings

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

            untilAlarm.text = "Until alarm:\n"+hoursLeft+" hours "+minutesLeft+" minutes"
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
            alarmSwitch.aswitch.toggle();
        }
    }
    onMinuteChanged: {
        if(!alarmSwitch.on){
            alarmSwitch.aswitch.toggle();
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

    AlarmSwitch{
        id: alarmSwitch
        x: 503
        y: 18
    }

    AlarmSettingsCorner{
        id:alarmSettingsCorner
        anchors.bottom: parent.bottom;
        anchors.right: parent.right;
    }

    Rectangle {
        x: -1
        y: -1
        width: 0; height: 0
        Text{
            id: buttonLabel2
            x: 77
            y: 18
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
            y: 83; x: 21; spacing: 40

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
            y: 83; x: 251; spacing: 40
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
                delegate: Text {
                    font.pixelSize: 45;
                    text: index;
                    //text: name;
                    height: 60 }
            }
        }


    }
    ListModel { id: minuteModel
/*        function(){
                                    for(i=0;i<=60;i++){
                                        var name=""+i
                                        if(i<10){
                                            name="0"+name;
                                        }
                                        model.append({'name': name})

                                    }
                                    return model;
                                }*/}

    Text {
        id: untilAlarm
        x: 508
        y: 218
        color: "#555555"
        text: ""
        font.pixelSize: 28
    }

    Rectangle {
        id: changeAlarmType
        x: 485
        y: 280
        width: 124
        height: 87
        gradient: Gradient {
            GradientStop {
                position: 0.00;
                color: "#4b4f59";
            }
            GradientStop {
                position: 0.6;
                color: "#232323";
            }
            GradientStop {
                position: 1.00;
                color: "#232323";
            }
        }

        MouseArea {
            id: mouse_area1
            onClicked: window.selectAlarmType()
            x: 0
            y: 0
            width: 90
            height: 41
            transformOrigin: Item.TopLeft
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 0
            anchors.right: parent.right
            anchors.rightMargin: 0
            anchors.left: parent.left
            anchors.leftMargin: 0
            anchors.top: parent.top
            anchors.topMargin: 0
        }

        Text {
            id: text1
            x: -12
            y: 6
            width: 148
            color: "#aaaaaa"
            text: "Normal alarm"
            horizontalAlignment: Text.AlignHCenter
            wrapMode: Text.WordWrap
            font.pixelSize: 28
        }
    }


}