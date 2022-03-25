import QtQuick 2.12
import QtQml 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.5

Item {
    id: currentElement
    property bool selected: false;
    property bool entered: false;
    property SelectableArea selectableArea;

    width: 100
    height: 100
    Connections {
        target: selectableArea

        function onCheckSelection(highlightX, highlightY, highlightWidth, highlightHeight) {
            var itemCoords = currentElement.mapToItem(selectableArea, 0, 0);

            if (Math.abs((highlightX+highlightWidth/2) - (itemCoords.x+currentElement.width/2)) < ((highlightWidth + currentElement.width)/2) &&
                    Math.abs((highlightY+highlightHeight/2) - (itemCoords.y+currentElement.height/2)) < ((highlightHeight + currentElement.height)/2))
                currentElement.selected = true
            else
                currentElement.selected = false
        }

        function onMousePosition (mouseX, mouseY) {
            var itemCoords = currentElement.mapToItem(selectableArea, 0, 0);
            var currentElementWidth = itemCoords.x + currentElement.width
            var currentElementHeight = itemCoords.y + currentElement.height
            if (itemCoords.x < mouseX && itemCoords.y < mouseY && currentElementWidth > mouseX && currentElementHeight > mouseY) {
                currentElement.entered=true;
            } else {
                currentElement.entered=false;
            }
        }
    }
}
