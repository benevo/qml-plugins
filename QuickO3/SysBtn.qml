import QtQuick 2.3

Rectangle
{
    id:sysbtn

    property string picCurrent: ""
    property string picNormal: ""
    property string picHover: ""
    property string picPressed: ""
    property color clrNormal:"transparent"
    property color clrHover:"#000000"
    property color clrPressed:"#000000"

    signal clicked

    width: 27
    height: 22
    color:"#00000000"
    state:"normal"

    Image
    {
        anchors.centerIn: parent
        source: picCurrent;
    }

    MouseArea
    {
        hoverEnabled: true
        anchors.fill: parent
        onEntered: sysbtn.state == "pressed" ? sysbtn.state = "pressed" : sysbtn.state = "hover"
        onExited: sysbtn.state == "pressed" ? sysbtn.state = "pressed" : sysbtn.state = "normal"
        onPressed: sysbtn.state = "pressed"
        onReleased:
        {
//            console.log("SysBtn clicked!")
            sysbtn.state = "normal"
            sysbtn.clicked()
        }
    }

    states:
    [
        State{
            name:"hover"
            PropertyChanges {
                target: sysbtn
                picCurrent:picHover
                color: clrHover
            }
        },
        State {
            name: "normal"
            PropertyChanges {
                target: sysbtn
                picCurrent:picNormal
                color: clrNormal
            }
        },
        State {
            name: "pressed"
            PropertyChanges {
                target: sysbtn
                picCurrent:picPressed
                color: clrPressed
            }
        }

    ]
}
