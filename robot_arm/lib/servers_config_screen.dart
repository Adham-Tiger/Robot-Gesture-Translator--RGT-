import 'package:flutter/material.dart';
import 'package:robot_arm/buisness.dart';

class ServersConfigScreen extends StatelessWidget {
  final TextEditingController _ESPcontroller = TextEditingController();
  final TextEditingController _webSocketController = TextEditingController();

@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(title: Text('Servers Configuration')),
    body: FutureBuilder(
      future:   _loadInitialData(),
      builder: (context, snapshot) {
       
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }

     if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }

        if (snapshot.connectionState == ConnectionState.done) {
          return Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Text('Configure your servers here'),
                  TextField(
                    controller: _ESPcontroller,
                    decoration: InputDecoration(labelText: 'ESP IP Address'),
                  ),
                  TextField(
                    controller: _webSocketController,
                    decoration: InputDecoration(labelText: 'WebSocket URL'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      BusinessLogic.seturls(_ESPcontroller.text, _webSocketController.text);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Configurations Saved')),
                      );
                    },
                    child: Text('Save Configurations'),
                  ),
                ],
              ),
            ),
          );
        }

        return Container(
          child: Center(child: Text('No data available')),
        );
      },
    ),
  );
}

Future<void> _loadInitialData() async {
  String espIP = await BusinessLogic.getESPIP();
  String webSocketURL = await BusinessLogic.getWebSocketURL();
  _ESPcontroller.text = espIP;
  _webSocketController.text = webSocketURL;
}
}