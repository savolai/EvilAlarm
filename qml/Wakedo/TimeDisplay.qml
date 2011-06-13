import QtQuick 1.0

Rectangle{
    width: 800; height: 430
    gradient: Gradient {
        GradientStop {
            position: 0.00;
            color: "#3b3f49";
        }
        GradientStop {
            position: 0.35;
            color: "#1c1c1c";
        }
        GradientStop {
            position: 1.00;
            color: "#1c1c1c";
        }
    }
    Clock{
        anchors.centerIn: parent
    }
}
