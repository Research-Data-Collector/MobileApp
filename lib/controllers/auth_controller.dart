import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:surveyy/utils/http_client.dart';

class AuthController {
  static TextEditingController emailController = TextEditingController();
  static TextEditingController passwordController = TextEditingController();

  static RxBool isPasswordVisible = true.obs;
  static RxBool loading = false.obs;

  static signIn() async {
    loading.value = true;
    HttpResponse res = await HttpClient.testRoute();
    print(res.data);
    loading.value = false;
  }
}
