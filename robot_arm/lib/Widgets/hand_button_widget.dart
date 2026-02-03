import 'package:flutter/material.dart';
import 'package:robot_arm/robot_arm_screen.dart';

class HandButtonWidget extends StatelessWidget{
  VoidCallback onPressed;
  HandButtonWidget({super.key,required this.onPressed});
  @override
  Widget build(BuildContext context) {
    
    return  
    Container(
        width: 48,
        height: 48,
        decoration: BoxDecoration(
          color: Color(0XFF22333B),
          shape: BoxShape.circle,
        ),
        child: Padding(

          padding: const EdgeInsets.all(10.0),
          child: IconButton(
            color:Color(0XFF22333B),
            padding: EdgeInsets.zero,
            constraints: BoxConstraints(),
            iconSize: 5,
            onPressed: onPressed,
            icon: Image.asset('lib/assets/images/hand_logo_white.png'),
          ),
        ),
      );
    
    }

  
}