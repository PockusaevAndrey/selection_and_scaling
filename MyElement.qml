import QtQuick 2.0

SelectableElement {
    id: base
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
        scale:  base.selected ? 1.0 : 0.90
        Text{
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            text: base.selected ?"selected":"not selected"
        }
    }
}


