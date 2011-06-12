import QtQuick 1.0

Flipable {
    id: clock

    //property alias image: frontImage.source
    property bool flipped: false
    property int xAxis: 0
    property int yAxis: 0
    property int angle: 0

    width: 550; height: 575

    front: TimeDisplay{}
    back: AlertSettings{}


    MouseArea { anchors.fill: parent;
        onClicked: clock.flipped = !clock.flipped
    }


//    state: "front"

    states: State {
        name: "backstate"; when: clock.flipped
        PropertyChanges { target: rotation1; angle: clock.angle }
    }
    transform: Rotation {
        id: rotation1; origin.x: clock.width / 2; origin.y: clock.height / 2
        axis.x: clock.xAxis; axis.y: clock.yAxis; axis.z: 0
    }

    transitions: Transition {
        ParallelAnimation {
            NumberAnimation { target: rotation1; properties: "angle"; duration: 600 }
            SequentialAnimation {
                NumberAnimation { target: clock; property: "scale"; to: 0.55; duration: 300 }
                NumberAnimation { target: clock; property: "scale"; to: 1.0; duration: 300 }
            }
        }
    }
}
