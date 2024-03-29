/****************************************************************************
**
** Copyright (C) 2011 Nokia Corporation and/or its subsidiary(-ies).
** All rights reserved.
** Contact: Nokia Corporation (qt-info@nokia.com)
**
** This file is part of the examples of the Qt Toolkit.
**
** $QT_BEGIN_LICENSE:BSD$
** You may use this file under the terms of the BSD license as follows:
**
** "Redistribution and use in source and binary forms, with or without
** modification, are permitted provided that the following conditions are
** met:
**   * Redistributions of source code must retain the above copyright
**     notice, this list of conditions and the following disclaimer.
**   * Redistributions in binary form must reproduce the above copyright
**     notice, this list of conditions and the following disclaimer in
**     the documentation and/or other materials provided with the
**     distribution.
**   * Neither the name of Nokia Corporation and its Subsidiary(-ies) nor
**     the names of its contributors may be used to endorse or promote
**     products derived from this software without specific prior written
**     permission.
**
** THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
** "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
** LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
** A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
** OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
** SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
** LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
** DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
** THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
** (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
** OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE."
** $QT_END_LICENSE$
**
****************************************************************************/

import QtQuick 2.0

Item {
    id: clock
    width: 725; height: 430

    //property alias city: cityLabel.text
    property int hours
    property int minutes
    property int seconds
    property string secondsPadded
    property string minutesPadded
    property string hoursPadded
    property real shift: 0
    property bool night: false

    function timeChanged() {
        var date = new Date;
        hours = shift ? date.getUTCHours() + Math.floor(clock.shift) : date.getHours()
        night = ( hours < 7 || hours > 19 )
        minutes = shift ? date.getUTCMinutes() + ((clock.shift % 1) * 60) : date.getMinutes()
        seconds = date.getUTCSeconds();
        if(hours>0 && hours<10){
            hoursPadded="0"+hours
        }else{
            hoursPadded=hours
        }
        if(minutes<10){
            minutesPadded="0"+minutes
        }else{
            minutesPadded=minutes
        }
        if(seconds<10){
            secondsPadded="0"+seconds
        }else{
            secondsPadded=seconds
        }

        timeText.text = hoursPadded +":"+ minutesPadded // SECONDS ARE DISTRACTING? +":"+ secondsPadded
        // the date was too much
        //dateText.text = date.getDate() +"."+  date.getMonth() +"."+  date.getFullYear();
        /// @todo get local date format
        //dateText.text = date.toDateString();
    }

    Timer {
        interval: 100; running: true; repeat: true;
        onTriggered: clock.timeChanged()
    }

    Image { id: background; source: "alarmclock-photo_small.png"; visible: clock.night == false }
    Image { source: "alarmclock-photo_small.png"; visible: clock.night == true

    Image {
        id: image1
        x: 133
        y: 189
        source: "clockscreen.svg"
    } }


    Image {
        x: 154.5; y: 177
        source: "hour.svg"
        smooth: true
        transform: Rotation {
            id: hourRotation
            origin.x: 5; origin.y: 85;
            angle: (clock.hours * 30) + (clock.minutes * 0.5)
            Behavior on angle {
                SpringAnimation { spring: 15; damping: 6; modulus: 360 }
            }
        }
    }

    Image {
        x: 156.5; y: 154
        source: "minute.svg"
        smooth: true
        transform: Rotation {
            id: minuteRotation
            origin.x: 5; origin.y: 107;
            angle: clock.minutes * 6
            Behavior on angle {
                SpringAnimation { spring: 2; damping: 0.2; modulus: 360 }
            }
        }
    }

    Image {
        x: 157.5; y: 183
        fillMode: Image.PreserveAspectFit
        source: "second.png"
        smooth: true
        transform: Rotation {
            id: secondRotation
            origin.x: 2.5; origin.y: 80;
            angle: clock.seconds * 6
            Behavior on angle {
                SpringAnimation { spring: 70; damping: 0.6; modulus: 360 }
            }
        }
    }

    Image {
        anchors.centerIn: background; source: "center2.png"
    }

}

