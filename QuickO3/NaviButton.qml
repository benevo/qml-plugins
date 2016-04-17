import QtQuick 2.3

Rectangle
{
    id:naviBtn
    height: parent.height
    width: 70
    gradient: on

    property alias picSrc: pic.source
    property alias btnText: label.text
    property alias btnTextColor: label.color

    property int index:0
    signal clicked(int btnIndex)
    property color bkColor: "#00FFFFFF"

    Gradient
    {
        id:on
        GradientStop { position: 0.0; color: "#00FFFFFF" }
        GradientStop { position: 1.0; color: bkColor }
    }

    Row
    {
        anchors.centerIn: parent
        spacing: 3

        Image
        {
            id: pic
            anchors.verticalCenter: parent.verticalCenter
            source: picCurrent;
        }

        Text
        {
            id: label
            color: "#ffffff"
            font.pointSize: 10
            font.family: "Microsoft YaHei"
            anchors.verticalCenter: pic.verticalCenter
         }
    }

    MouseArea
    {
        hoverEnabled: true
        anchors.fill: parent

        onEntered:
        {
            naviBtn.state === 'checked' ? naviBtn.state = 'checked' : naviBtn.state = 'hover'
        }
        onExited:
        {
            naviBtn.state == 'checked' ? naviBtn.state = 'checked' : naviBtn.state = 'leave'
        }
        onPressed:
        {
            naviBtn.state = 'checked'
            naviBtn.clicked(naviBtn.index)
        }
    }

    states:
    [
        State {
            name: "checked"
            PropertyChanges { target: naviBtn; bkColor:"#77FFFFFF" }
        },

        State {
            name: "hover"
            PropertyChanges { target: naviBtn; bkColor:"#77FFFFFF" }
        },

        State {
            name: "leave"
            PropertyChanges { target: naviBtn; bkColor:"#00FFFFFF" }
        }
    ]

    transitions:
    [
        Transition
        {
            PropertyAnimation
            {
                property:"bkColor"
                easing.type: Easing.Linear
                duration: 200
            }
        }
    ]
}
