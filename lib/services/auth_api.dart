import 'dart:convert';
import 'package:apii/view/home/home_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class AuthApi extends GetxService {
  final box = GetStorage();

  // Login API
  String url = "http://buddy.ropstambpo.com/api/login";

  Future loginAPI(String email, String password) async {
    String deviceToken = "zasdcvgtghnkiuhgfde345tewasdfghjkm";
    // String email=  "hassan.zafar@ropstam.com";
    // String password = "12345678";
    try {
      var jsonData = {};
      var data = await http.post(
        Uri.parse(url),
        body: {
          'email': email,
          'password': password,
          "device_token": deviceToken
        },
      );
      jsonData = json.decode(data.body);
      if (data.statusCode == 200) {
        if (jsonData["data"]["access_token"] == null) {
          Get.snackbar(
            "Error",
            jsonData["meta"]["message"],
          );
        } else {
          // save user token
          String token = jsonData["data"]["access_token"];
          await box.write("token", token);
          Get.offAll(() => const HomeScreen());
        }
      } else {
        /// Show error message
      }
    } on Exception catch (_) {
      /// Show error message
    }
  }

  //
  Future autoLogin() async {
    String token = await box.read("token");
    try {
      var jsonData = {};
      var data = await http.get(Uri.parse(url), headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      });
      jsonData = json.decode(data.body);
      if (data.statusCode == 200) {
        /// assign user data to user model...
        /// Navigate to home page
        if (kDebugMode) {
          print(jsonData);
        }
        if (kDebugMode) {
          print("Show success msg");
        }
      } else {
        if (kDebugMode) {
          print("Show error msg");
        }
      }
    } on Exception catch (_) {
      if (kDebugMode) {
        print("Show error msg");
      }
    }
  }
}
