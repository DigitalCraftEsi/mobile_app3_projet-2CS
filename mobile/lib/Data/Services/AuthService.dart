import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http ;
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {

  static Future<Map<String, dynamic>> Signin(String email,
      String password) async {
    try {
      var url = Uri.https("smartbevdb-sil-rhap.onrender.com","login");
      final res = await http.post(
        url, body: {
        "email": "$email",
        "password": "$password"
      },
      );
      final storage = FlutterSecureStorage();
      if (res.statusCode == 200) {
        // Get the cookie from the response headers
        final cookie = res.headers['set-cookie'];
        if (cookie != null) {

          await storage.write(key: 'cookie', value: cookie);

          // storage.write(key: 'cookie', value: cookie);
          print(cookie);
        }

      }
      final data = json.decode(res.body) as Map<String, dynamic>;
      await storage.write(key: 'token', value: data["data"]["token"]);
      return data;
    }
    catch (e) {
      print(e.toString());
      return {};
    }
  }
}