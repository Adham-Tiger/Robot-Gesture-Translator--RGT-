import 'package:flutter/material.dart';
import 'package:robot_arm/Widgets/hand_button_widget.dart';
import 'package:robot_arm/Widgets/recieved_text_widget.dart';
import 'package:robot_arm/buisness.dart';
import 'package:robot_arm/servers_config_screen.dart';

class RobotArmScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = TextEditingController();
    
    return Scaffold(
      backgroundColor: Color(0XFFEAE0D5),
      // 1. الشاشة كلها بقت Stack عشان الـ Positioned يشتغل على مساحة الموبايل كلها
      body: Stack( 
        alignment: Alignment.center,
        fit: StackFit.expand,
        children: [
          
          // 2. اللوجو اللي عاوزه في الركن تحت على اليمين
          Positioned(
            bottom: -0, // نزله لتحت شوية عشان يدي شكل جمالي
            right: -10,  // خرجه لليمين شوية
            child: Opacity(
              opacity: 0.7, // خليه شفاف عشان مياكلش العين عن الكلام
              child: Image.asset(
                "lib/assets/images/hand_logo_gold.png",
                width: 250,
              ),
            ),
          ),

          // 3. المحتوى بتاعك العادي (Column) محطوط فوق اللوجو
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 50, 10, 10),
            child: SingleChildScrollView( // سكرول عشان لو الكيبورد فتحت ميعملش Overflow
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: IconButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => ServersConfigScreen())
                        );
                      }, 
                      icon: Icon(Icons.settings)
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'ARM CONTROL',
                    style: TextStyle(
                      fontFamily: 'Rubik',
                      fontWeight: FontWeight.bold,
                      fontSize: 36,
                      color: Color(0XFF22333B),
                    ),
                  ),
                  Text(
                    'INTERFACE',
                    style: TextStyle(
                      fontFamily: 'Rubik',
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Color(0XFF4C5C63),
                    ),
                  ),
                  const SizedBox(height: 40),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 6,
                          child: TextField(
                            controller: controller,
                            decoration: InputDecoration(
                              labelText: 'Enter Word',
                              labelStyle: TextStyle(color: Color(0XFF5E503F), fontFamily: "Rubik"),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        HandButtonWidget(
                          onPressed: () async {
                            await BusinessLogic.sendText(controller.text, context);
                          }
                        ),
                      ],
                    ),
                  ),
                  ReceivedText(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}