import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.Layouts 1.11
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
import QtGraphicalEffects 1.0

Item {
    visible: true
    width: 929
    height: 650

    property  int  inputHeight: 30
    property  int  inputWidth: 170
    property string textColor: "white"

    Image {
        source: "qrc:/loginScreenDefaultBackgroudn.png"
        anchors.fill: parent
    }

    Rectangle
    {
        id: loginColId
        anchors.top: parent.top
        anchors.left: parent.left
        color: "#000000"
        width: 250
        height: parent.height
        opacity: 0.7


        Column
        {
            id: inputGroup;
            anchors.top: loginColId.top;
            anchors.horizontalCenter: loginColId.horizontalCenter;
            anchors.topMargin: 30
            spacing: 20

            Image {
                id: logoId
                source: "qrc:/RC_Logo_WM_Neg.png"
                anchors.horizontalCenter: parent.horizontalCenter

            }

            Item
            {
                height: inputHeight
                width: inputWidth
                anchors.horizontalCenter: parent.horizontalCenter;
                Rectangle
                {
                    anchors.fill: parent;
                    color: "transparent";
                    border.color: "#979797";
                    border.width: 1;
                }
                Text
                {
                    id: userName;
                    anchors.horizontalCenter: parent.horizontalCenter;
                    anchors.verticalCenter: parent.verticalCenter;
                    font.family: normalFont.name;
                    font.pixelSize: 15;
                    color: textColor;
                    text: qsTr("Email/User name");
                    states :
                        [
                        State
                        {
                            name: "hasTextActive";
                            when: userNameInput.text != "";
                            PropertyChanges
                            {
                                target: userName;
                                opacity: 0;
                            }
                        }
                    ]
                }

                TextInput
                {
                    id: userNameInput;
                    anchors.fill: parent;
                    focus: true;
                    verticalAlignment: TextInput.AlignVCenter;
                    horizontalAlignment: TextInput.AlignHCenter;
                    maximumLength: 30;
                    font.pixelSize: 15;
                    font.letterSpacing : 0;
                    font.family: normalFont.name;
                    color: textColor;
                    selectionColor: "#787878";
                    KeyNavigation.tab: passwordInput;
                    selectByMouse: true;
                    text: loginController.userName;
                }
            }

            Item
            {
                height: inputHeight
                width: inputWidth
                anchors.horizontalCenter: parent.horizontalCenter;
                Rectangle
                {
                    anchors.fill: parent;
                    height: inputHeight
                    width: inputWidth
                    color: "transparent";
                    border.color: "#979797";
                    border.width: 1;
                }
                Text
                {
                    id: password
                    anchors.horizontalCenter: parent.horizontalCenter;
                    anchors.verticalCenter: parent.verticalCenter;
                    font.family: normalFont.name;
                    color: textColor;
                    font.pixelSize: 15;
                    text: qsTr("Password");
                    states :
                        [
                        State
                        {
                            name : "hasTextActive";
                            when : passwordInput.text != "";
                            PropertyChanges
                            {
                                target : password;
                                opacity : 0;
                            }
                        }
                    ]
                }
                TextInput
                {
                    id: passwordInput;
                    anchors.fill: parent;
                    focus: true;
                    verticalAlignment: TextInput.AlignVCenter;
                    horizontalAlignment: TextInput.AlignHCenter;
                    echoMode: TextInput.Password;
                    maximumLength: 30;
                    font.pixelSize: 15;
                    font.letterSpacing: 0;
                    font.family: normalFont.name;
                    color: textColor;
                    selectionColor: "#787878";
                    selectByMouse: true;
                    Keys.onReturnPressed:
                    {
                        loginBtn.pressArea.doLogin();
                    }
                    Keys.onEnterPressed:
                    {
                        loginBtn.pressArea.doLogin();
                    }
                }
            }

            CheckBox
            {
                id: rememberPasswordCheck;
                //                LayoutMirroring.enabled: true;
                LayoutMirroring.childrenInherit: true;
                //                anchors.top: inputGroup.bottom;
                //                anchors.topMargin: 10;
                anchors.horizontalCenter: background.horizontalCenter;

                style: CheckBoxStyle
                {
                    label: Text
                    {
                        color: textColor;
                        font.family: normalFont.name;
                        font.pixelSize: 13;
                        text: qsTr("Keep me logged in");

                    }

                    indicator: Rectangle {
                        implicitWidth: 16
                        implicitHeight: 16
                        color: "#000000"
                        radius: 1
                        border.color: textColor
                        border.width: 1
                        Rectangle {
                            visible: control.checked
                            color: "#FDC038"
                            border.color: "#FDC038"
                            anchors.margins: 4
                            anchors.fill: parent
                            radius: 5
                        }
                    }
                    spacing: 5;
                }


                Component.onCompleted:
                {
                    checked = loginController.rememberPassword;
                }

                onClicked:
                {
                    loginController.rememberPassword = checked;
                }
            }


//            Text {
//                id: noteId
//                anchors.horizontalCenter: parent.horizontalCenter
//                text: qsTr("Please note Login is only for accounts which have recieved an invitation to Early Access. if you have not yet signed up for Early Access, please sign-up below.")
//                width: 220
//                height: 100
//                color: "white"
//            }
            //            Glow
            //            {
            //                anchors.fill: loginBtn;
            //                radius: 23;
            //                samples: radius * 2;
            //                spread: 0;
            //                fast: true;
            //                source: loginBtn;
            //                color: "#5C7ED321";
            //            }

            Rectangle
            {
                id: loginBtn;
                property alias pressArea: mousePressArea;
                anchors.horizontalCenter: background.horizontalCenter;
                width: 170;
                height: 30;
                color: "#FDBF38"

                states :
                    [
                    State
                    {
                        name : "normal";
                        PropertyChanges
                        {
                            target: loginBtn;
                            color: "#FDC038";
                        }
                    },
                    State
                    {
                        name : "hovered";
                        PropertyChanges
                        {
                            target: loginBtn;
                            color: "#D69816";
                        }
                    },
                    State
                    {
                        name : "pressed";
                        PropertyChanges
                        {
                            target: loginBtn;
                            color: "#FDC038";
                        }
                    }
                ]

                Text
                {
                    anchors.horizontalCenter: parent.horizontalCenter;
                    anchors.verticalCenter: parent.verticalCenter;
                    font.family: normalFont.name;
                    font.pixelSize: 14;
                    color: "#fff";
                    text: qsTr("Login");
                }

                MouseArea
                {
                    id: mousePressArea;
                    anchors.fill: parent;
                    hoverEnabled: true;
                    onEntered: parent.state = "hovered";
                    onExited: parent.state = "normal";
                    onPressed:
                    {
                        parent.state = "pressed";

                        doLogin();
                    }
                    onReleased: parent.state = "normal";

                    function doLogin()
                    {
                        loginController.Login(userNameInput.text, passwordInput.text);
                    }
                }
            }

            Rectangle
            {
                id: signup;
                anchors.horizontalCenter: parent.horizontalCenter;
                //                anchors.verticalCenter:  parent.verticalCenter;
                width: 170;
                height: 30;

                property string linkUrl: loginController.registrationUrl;
                color: "#B3B3B3";
                states :
                    [
                    State
                    {
                        name : "normal";
                        PropertyChanges
                        {
                            target: signup;
                            color: "#B3B3B3";
                        }
                    },
                    State
                    {
                        name : "hovered";
                        PropertyChanges
                        {
                            target: signup;
                            color: "#fff";
                        }
                    },
                    State
                    {
                        name : "pressed";
                        PropertyChanges
                        {
                            target: signup;
                            color: "#838383";
                        }
                    }
                ]


                Text
                {
                    anchors.horizontalCenter: parent.horizontalCenter;
                    anchors.verticalCenter: parent.verticalCenter;
                    font.family: normalFont.name;
                    font.pixelSize: 14;
                    color: "#fff";
                    text: qsTr("Register");
                }


                MouseArea
                {
                    anchors.fill: parent;
                    hoverEnabled: true;
                    onEntered: parent.state = "hovered";
                    onExited: parent.state = "normal";
                    onPressed: parent.state = "pressed";
                    onReleased: parent.state = "normal";
                    onClicked: Qt.openUrlExternally(parent.linkUrl);
                }
            }



            Text
            {
                id: forgetPassword;
                //                anchors.horizontalCenter: parent.horizontalCenter;
                text: qsTr("Need Help to log in?");
                property string linkUrl: loginController.forgetPasswordUrl;
                color: "#FDBF38"
                states :
                    [
                    State
                    {
                        name : "normal";
                        PropertyChanges
                        {
                            target: forgetPassword;
                            color: "#FDBF38"
                        }
                    },
                    State
                    {
                        name : "hovered";
                        PropertyChanges
                        {
                            target: forgetPassword;
                            color: "#fff";
                        }
                    },
                    State
                    {
                        name : "pressed";
                        PropertyChanges
                        {
                            target: forgetPassword;
                            color: "#838383";
                        }
                    }
                ]

                MouseArea
                {
                    anchors.fill: parent;
                    hoverEnabled: true;
                    onEntered: parent.state = "hovered";
                    onExited: parent.state = "normal";
                    onPressed: parent.state = "pressed";
                    onReleased: parent.state = "normal";
                    onClicked: Qt.openUrlExternally(parent.linkUrl);
                }
            }

        }
        Image {
            id: bottmLogo
            anchors.bottom: parent.bottom
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottomMargin: 20
            source: "qrc:/ROBOT_CAHCE_LOGO_Horiz.png"
        }

    }

}
