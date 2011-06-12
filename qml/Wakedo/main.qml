import QtQuick 1.0

Rectangle{
    id: window
    width: 800; height: 430

    color: "#e5e5e5"


    Row {
        anchors.centerIn: parent; spacing: 0
        WakeDo { //image: "content/9_club.png";
            angle: 180; yAxis: 1 }
//Switch { anchors.centerIn: parent; on: false }
    }
}

