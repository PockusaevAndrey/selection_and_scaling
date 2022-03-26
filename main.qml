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



    SelectableArea {
        acceptedButtons: Qt.LeftButton
        anchors.fill: parent
        id: area
        width: column.width
        height: column.height
        MouseArea{
            acceptedButtons: Qt.RightButton
            anchors.fill: parent
            hoverEnabled: true
            drag.target: column
            drag.axis: "XAndYAxis"
            onWheel:{
                //                my_scale *= wheel.angleDelta.y>0 ? 1.05 : 0.95
                var origin = mapToItem(column, wheel.x, wheel.y)
                var scale = (wheel.angleDelta.y < 0)? 0.9 : 1/0.9; //-- приближаем или отдаляем

                //-- Рассчитываем на сколько сдвигать при маштабировании относительно текущей точки
                var newX = origin.x * scaleRect.xScale;
                var newY = origin.y * scaleRect.yScale;
                column.x += (1-scale)*newX;
                column.y += (1-scale)*newY;


                scaleRect.xScale *=scale;
                scaleRect.yScale *=scale;

                console.log(scale)
            }
            onPositionChanged: {
                if (drag.active){
                    console.log("hovered", drag.minimumX)
                }
            }
        }
        Column {
            id: column

            //                scale: my_scale
            transform: [Scale {
                    id: scaleRect

                    //                        Behavior on xScale {
                    //                            NumberAnimation {duration: 300}
                    //                        }

                    //                        Behavior on yScale {
                    //                            NumberAnimation {duration: 300}
                    //                        }


                }
            ]

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
