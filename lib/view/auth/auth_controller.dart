import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../services/auth_api.dart';

class AuthController extends GetxController {
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  bool hidePassword = true;

  // final box = GetStorage();

  togglePassword() {
    hidePassword = !hidePassword;
    update();
  }

  // login function
  Future login(String email, String passwordIn) async {
    if (loginFormKey.currentState!.validate()) {
      await AuthApi().loginAPI(email.trim(), passwordIn);
    }
  }

  String? validatePassword(String value) {
    if (value.isEmpty) {
      return 'Password is required';
    } else if (value.length < 6) {
      return 'Password must be of 6 characters';
    }
    return null;
  }

  String? validateUserName(String value) {
    if (value.isEmpty) {
      return 'email is required';
    } else if (!GetUtils.isEmail(value.trim())) {
      return 'email is invalid';
    }
    return null;
  }
}
