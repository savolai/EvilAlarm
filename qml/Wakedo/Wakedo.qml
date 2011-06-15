import QtQuick 1.0

Flipable {
    id: wakeDo

    //property alias image: frontImage.source
    property int xAxis: 0
    property int yAxis: 0
    property int angle: 0

    width: 800; height: 430

    front: TimeDisplay{id:timeDisplay}
    back: AlertSettings{}

    MouseArea {
        onClicked: timeDisplay.flipped = !timeDisplay.flipped
        anchors.bottom: parent.bottom;
        anchors.right: parent.right;
        width:240;
        height:150;
    }


//    state: "front"

    states: State {
        name: "backstate"; when: timeDisplay.flipped
        PropertyChanges {
            target: rotation1;
            // this is negative to make rotation go reverse, i.e. to have paper fold approach user
            angle: -wakeDo.angle }
    }
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
