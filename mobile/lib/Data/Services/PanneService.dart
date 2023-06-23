import 'dart:convert';
import 'dart:io';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http ;


class PanneService {
  static String? extractAccessTokenFromCookie(String cookie) {
    final cookieKeyValuePairs = cookie.split('; ');
    for (var cookiePair in cookieKeyValuePairs) {
      final keyValue = cookiePair.split('=');
      final key = keyValue[0];
      final value = keyValue[1];
      if (key == 'accessToken') {
        return value;
      }
    }
    return null;
  }
  static Future<Map<String, dynamic>> GetPanne() async {
    try {
      final storage = FlutterSecureStorage();
      // final cookie = await storage.read(key: 'cookie');
      final token = await storage.read(key: 'token');

      // Replace with the actual cookie string
      //String? accessToken = AnomalieService.extractAccessTokenFromCookie(cookie);
      var url = Uri.https("smartbevdb-sil-rhap.onrender.com","task/panne");

      final res = await http.get(
        url,
        headers: {'Authorization': 'Bearer $token',},
      );

      final data = json.decode(res.body) as Map<String, dynamic>;
      print("data $data");
      return data;
    }
    catch (e) {
      print("hhhh"+e.toString());
      return {};
    }
  }
}
