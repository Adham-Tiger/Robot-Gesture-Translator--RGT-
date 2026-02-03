import 'package:flutter/material.dart';
import 'package:robot_arm/buisness.dart'; // تأكد أن المسار يطابق مشروعك
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class ReceivedText extends StatefulWidget {
  @override
  _ReceivedTextState createState() => _ReceivedTextState();
}

class _ReceivedTextState extends State<ReceivedText> {
  WebSocketChannel? _channel;
  Stream? _broadcastStream; // ضروري لاستخدامه في الـ StreamBuilder
  String _allMessages = '';
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _setupWebSocket();
  }

  Future<void> _setupWebSocket() async {
    try {
      final url = await BusinessLogic.getWebSocketURL();
      final wsUrl = url.startsWith('ws') ? url : 'ws://$url';
      
      _channel = IOWebSocketChannel.connect(Uri.parse(wsUrl));
      
      // تحويل الـ stream لـ broadcast يسمح بوجود مستمعين (StreamBuilder)
      _broadcastStream = _channel!.stream.asBroadcastStream();
      
      if (mounted) {
        setState(() => _isLoading = false);
      }
    } catch (e) {
      debugPrint('Connection error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) return const Center(child: CircularProgressIndicator());

    return Column(
      mainAxisSize: MainAxisSize.min, // يحافظ على ترتيب العناصر كما في صورتك
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          padding: const EdgeInsets.all(12),
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: Colors.grey.shade400),
          ),
          child: StreamBuilder(
            stream: _broadcastStream,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                // إضافة الرسالة الجديدة للنصوص القديمة
                _allMessages += "${snapshot.data}";
              }

              return Text(
                _allMessages.isEmpty ? 'Waiting for data...' : _allMessages,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 16, color: Colors.black87),
              );
            },
          ),
        ),
        const SizedBox(height: 15),
        ElevatedButton(
          onPressed: () => setState(() => _allMessages = ''),
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0XFF22333B),
            foregroundColor: Colors.white,
            minimumSize: const Size(150, 45),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          ),
          child: const Text('Clear Log', style: TextStyle(fontSize: 16)),
        ),
       
      ],
    );
  }

  @override
  void dispose() {
    _channel?.sink.close();
    super.dispose();
  }
}