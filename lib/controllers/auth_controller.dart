import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController {
  static TextEditingController emailController = TextEditingController();
  static TextEditingController passwordController = TextEditingController();

  static RxBool isPasswordVisible = true.obs;
  static RxBool loading = false.obs;

  static signIn() {
    loading.value = !loading.value;
  }
}
