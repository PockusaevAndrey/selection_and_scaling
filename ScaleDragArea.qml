import QtQuick 2.0

MouseArea{
    property Item target: Item{}
    property Scale targetScale

    hoverEnabled: true
    drag.target: target
    drag.axis: "XAndYAxis"
    onWheel:{
        //                my_scale *= wheel.angleDelta.y>0 ? 1.05 : 0.95
        var origin = mapToItem(target, wheel.x, wheel.y)
        var scale = (wheel.angleDelta.y < 0)? 0.9 : 1/0.9; //-- приближаем или отдаляем

        //-- Рассчитываем на сколько сдвигать при маштабировании относительно текущей точки
        var newX = origin.x * targetScale.xScale;
        var newY = origin.y * targetScale.yScale;
        target.x += (1-scale)*newX;
        target.y += (1-scale)*newY;


        targetScale.xScale *=scale;
        targetScale.yScale *=scale;

        console.log(scale)
    }

}
