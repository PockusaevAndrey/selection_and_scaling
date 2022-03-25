import QtQuick 2.0

SelectableElement {
    property int number: 0
    property bool select: false

    height: 160
    width:  160
    Rectangle {
        id: _rect_1
        visible: entered
        anchors.fill: parent
        color:  "lightblue"
    }
    Rectangle {
        id: _rect_2
        anchors.fill: parent
        color:  "green"
        scale:  selected ? 1.0 : 0.90
        Text{
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            text: selected ?"selected":"not selected"
        }
    }
}


