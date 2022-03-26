import QtQuick 2.12
import QtQml 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.5

MouseArea{
    property color highlightColor: "blue"
    property Rectangle highlightItem: null;
    property real lastWheelPosX: 0
    property real lastWheelPosY: 0
    property point clickPos: "0,0"

    hoverEnabled: true

    id: selectableArea
    signal checkSelection (
        real highlightX,
        real highlightY,
        real highlightWidth,
        real highlightHeight
    )
    signal mousePosition (
        real mouseX,
        real mouseY
    )

    Component {
        id: highlightComponent;
        Rectangle {
            color: highlightColor;
            opacity: 0.35;
        }
    }
//    onWheel: {
//        if (wheel.angleDelta.y>0)
//        { my_scale*=1.05; }
//        else { my_scale*=0.95; }
//        lastWheelPosX = wheel.x
//        lastWheelPosY = wheel.y

//    }// реакция на скролл

    onPressed: {
        if (highlightItem !== null) {
            // if there is already a selection, delete it
            highlightItem.destroy();
        }
        // create a new rectangle at the wanted position
        clickPos  = Qt.point(mouse.x,mouse.y)
        highlightItem = highlightComponent.createObject (selectableArea, {
            "x" : mouse.x,
            "y" : mouse.y
        });
        // here you can add you zooming stuff if you want
    }

    onPositionChanged: {
        // on move, update the width of rectangle
        if (highlightItem !== null) {
            highlightItem.x=Math.min(mouse.x,clickPos.x)
            highlightItem.y=Math.min(mouse.y,clickPos.y)
            highlightItem.width=Math.abs(clickPos.x-mouse.x)
            highlightItem.height=Math.abs(clickPos.y-mouse.y)
        }
        mousePosition(mouse.x,mouse.y)
    }

    onReleased: {
        // here you can add you zooming stuff if you want
        // highlightItem.destroy();
        console.log(highlightItem.x, highlightItem.y, highlightItem.width, highlightItem.height);
        checkSelection(highlightItem.x, highlightItem.y, highlightItem.width, highlightItem.height);
        highlightItem.destroy();
    }
    onCheckSelection: {
        console.log(highlightItem.x, highlightItem.y, highlightItem.width, highlightItem.height);
    }
}
