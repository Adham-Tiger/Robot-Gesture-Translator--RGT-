// ignore_for_file: non_constant_identifier_names

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BusinessLogic {
  static final Dio _dio = Dio();
  
  static SharedPreferences? _prefs;

  static Future<void> _initPrefs() async {
    _prefs ??= await SharedPreferences.getInstance();
  }

  static Future<void> sendText(String text, BuildContext context) async {
    await _initPrefs(); 
    try {
      String url = _prefs!.getString('ESP_IP') ?? 'http://192.168.11.234';
      
      final response = await _dio.get(url, queryParameters: {'text': text});

      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Response: ${response.data}'),
            backgroundColor: response.statusCode == 200 ? Colors.green : Colors.red,
            behavior: SnackBarBehavior.floating,
          ),
        );
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(e.toString()),
            backgroundColor: Colors.red,
            behavior: SnackBarBehavior.floating,
          ),
        );
      }
    }
  }

  static Future<void> seturls(String ESP_ip, String webSocketURL) async {
    await _initPrefs();
    await _prefs!.setString('ESP_IP', ESP_ip);
    await _prefs!.setString('WebSocket_URL', webSocketURL);
  }

  static Future<String> getESPIP() async {
    await _initPrefs();
    return _prefs!.getString('ESP_IP') ?? '';
  }

  static Future<String> getWebSocketURL() async {
    await _initPrefs();
    return _prefs!.getString('WebSocket_URL') ?? "echo.websocket.org/.ws";
  }
}