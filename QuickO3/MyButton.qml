import QtQuick 2.2

Rectangle {
    id: root
    property alias pressed: mymouse.pressed
    property bool hovered: false
    property alias font: text.font
    property alias text: text.text
    property alias textColor: text.color
    property alias image: pic
    property alias spacing: rowLayout.spacing

    property var gradientDisable:  ["#888", "#777"]
    property var gradientPressed:  ["#2DC3E8", "#27a2ff"]
    property var gradientHovered: ["#f8f8f8", "#e2dfdf"]
    property var gradientNormal:  ["#eee", "#ddd"]

    signal clicked

    implicitWidth: 120
    implicitHeight: 60
    radius: 6
    border.width: 1
    border.color: "#aaa"
    gradient: Gradient {
        GradientStop { position: 0; color: {
                if(!root.enabled)
                    return gradientDisable[0]
                if( root.pressed )
                    return gradientPressed[0]
                if( root.hovered )
                    return gradientHovered[0]
                return gradientNormal[0]
            }
        }
        GradientStop { position: 1 ; color: {
                if(!root.enabled)
                    return gradientDisable[1]
                if( root.pressed )
                    return gradientPressed[1]
                if( root.hovered )
                    return gradientHovered[1]
                return gradientNormal[1]
            }
        }
    }

    Row
    {
        id: rowLayout
        anchors.centerIn: parent
        spacing: 5

        Image
        {
            id: pic
            source: ""
            anchors.verticalCenter: parent.verticalCenter
        }

        Text{
            id: text
            text: parent.text
            font.pointSize: 10
            font.family: "微软雅黑"
            anchors.verticalCenter: parent.verticalCenter
            color: "white";
        }

    }

    MouseArea{
        id: mymouse
        anchors.fill: parent
        hoverEnabled: true
        onClicked: {
            root.clicked()
        }
        onEntered: {
            root.hovered = true
//            text.color = "black"
        }
        onExited: {
            root.hovered = false
//            text.color = "white"
        }
    }
}
