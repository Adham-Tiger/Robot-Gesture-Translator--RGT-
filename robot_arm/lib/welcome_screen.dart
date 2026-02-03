import 'package:flutter/material.dart';
import 'package:robot_arm/Widgets/hand_button_widget.dart';
import 'package:robot_arm/robot_arm_screen.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Center(
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 2,
              child: Container(
                
                decoration: BoxDecoration(
                  color: Color(0XFF22333B)
                ),
                child: 
                   
                   
                     Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Expanded(
                            flex:5,
                            child: Center(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  SizedBox(height:30),
                                  Text(
                                    'ROBOT',
                                    style: TextStyle(
                                      letterSpacing: 3,
                                      fontSize: 56,
                                      fontFamily: 'Rubik',
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      shadows: [
                                        Shadow(
                                          blurRadius: 10.0,
                                          color: Colors.black,
                                          offset: Offset(2.0, 2.0),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height:30),
                                  Text(
                                'ARM CONTROL',
                                style: TextStyle(
                                  fontSize: 36,
                                  fontFamily: 'Rubik',
                                  letterSpacing: 3,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0XFFC6AC8F),
                                  shadows: [
                                    Shadow(
                                      blurRadius: 10.0,
                                      color: Colors.black,
                                      offset: Offset(2.0, 2.0),
                                    ),
                                  ],
                                ),
                              ),
                                ],
                              ),
                            ),
                          ),

                          Expanded(
                            flex: 2,
                            child:Align(
                              alignment: Alignment.centerLeft,
                              child: Positioned(
                                child: Image.asset('lib/assets/images/hand_logo.png'),
                                left:-1,
                                ),
                            )
                              )
                          
                        ],
                      ),
                    ),
                  
                
              ),
            
            
            Expanded(
              flex:1,
              child: Container(
                decoration:
                 BoxDecoration(
                  color: Color(0XFFEAE0D5)
                  ),
                
                child: Stack(
                  children:[ 
                    
                    Center(
                      child:
                        Container(
                          width: 70,
                          height: 70,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border(
                              top: BorderSide(color: Color(0xFFD4A373), width: 7),
                              left: BorderSide(color: Color(0xFFD4A373), width: 7),
                              bottom: BorderSide(color: Color(0xFFD4A373), width: 7),
                              //bottom: BorderSide(color: Colors.transparent, width: 4), // الجزء المقطوع
                            ),
                          ),
                          child: Center(
                            child: null
                          ),
                        )
                    ),

                     Center(
                      child:
                        Container(
                          width: 70,
                          height: 70,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border(
                               right: BorderSide(color: Colors.brown, width: 7),
                              //bottom: BorderSide(color: Colors.transparent, width: 4), // الجزء المقطوع
                            ),
                          ),
                          child: Center(
                            child: null
                          ),
                        )
                    ),
                    Center(
                    child:HandButtonWidget(onPressed: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => RobotArmScreen(),
                ),
              );
            },),
                  ),
                
                  ]
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}