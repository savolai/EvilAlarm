import QtQuick 1.0

Flipable {
    id: wakeDo

    //property alias image: frontImage.source
    property bool flipped: false
    property int xAxis: 0
    property int yAxis: 0
    property int angle: 0

    width: 550; height: 575

    front: TimeDisplay{}
    back: AlertSettings{}


    MouseArea { anchors.fill: parent;
        onClicked: wakeDo.flipped = !wakeDo.flipped
    }


//    state: "front"

    states: State {
        name: "backstate"; when: wakeDo.flipped
        PropertyChanges { target: rotation1; angle: wakeDo.angle }
    }
    transform: Rotation {
        id: rotation1; origin.x: wakeDo.width / 2; origin.y: wakeDo.height / 2
        axis.x: wakeDo.xAxis; axis.y: wakeDo.yAxis; axis.z: 0
    }

    transitions: Transition {
        ParallelAnimation {
            NumberAnimation { target: rotation1; properties: "angle"; duration: 600 }
            SequentialAnimation {
                NumberAnimation { target: wakeDo; property: "scale"; to: 0.55; duration: 300 }
                NumberAnimation { target: wakeDo; property: "scale"; to: 1.0; duration: 300 }
            }
        }
    }
}