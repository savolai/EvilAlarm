import QtQuick 1.0

Rectangle{
    id: window
    width: 800; height: 430

    color: "#141518"


    Row {
        anchors.centerIn: parent; spacing: 0
        Wakedo {
            angle: 180; yAxis: 1 }
    }
}

