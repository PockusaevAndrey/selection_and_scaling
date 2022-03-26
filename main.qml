import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.5

ApplicationWindow {
    id: window
    visible:    true
    title:      qsTr("Selection and Scaling")
    width:      Screen.desktopAvailableWidth*50/100
    height:     Screen.desktopAvailableHeight*80/100
    color:      "whitesmoke"

    property alias my_scale: scaleRect.xScale

    //    Flickable {
    //        interactive: _move_setup.checked
    //        id:             _scrollSetup
    //        anchors.fill:   parent
    //        //        boundsBehavior: Flickable.OvershootBounds
    //        contentWidth:   column.width*my_scale > parent.width ? (column.width*my_scale):parent.width
    //        contentHeight:  column.height*my_scale > parent.height ? (column.height*my_scale):parent.height
    //        contentX: column.x
    //        contentY: column.y

ScaleDragArea{
    target: column
    anchors.fill: parent
    targetScale: scaleRect
    acceptedButtons: Qt.RightButton
}

    SelectableArea {
        acceptedButtons: Qt.LeftButton
        anchors.fill: parent
        id: area
        width: column.width
        height: column.height

        Column {
            id: column

            //                scale: my_scale
            transform: [Scale {id: scaleRect}]

            Row {
                MyElement{
                    selectableArea: area
                    number: 1
                }
                MyElement{
                    selectableArea: area
                    number: 2
                }
                MyElement{
                    selectableArea: area
                    number: 3
                }
                MyElement{
                    selectableArea: area
                    number: 4
                }
            }
            Rectangle {
                anchors.horizontalCenter:   parent.horizontalCenter
                height:                     4
                color:                      "lightsteelblue"
                width:                      parent.width
            }
            Row {
                MyElement{
                    selectableArea: area
                    number: 5
                }
                MyElement{
                    selectableArea: area
                    number: 6
                }
                MyElement{
                    selectableArea: area
                    number: 7
                }
                MyElement{
                    selectableArea: area
                    number: 8
                }
            }

        }
    }
}
//}
