import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:surveyy/layout.dart';
import 'package:surveyy/views/login.dart';
import 'package:surveyy/views/profile.dart';
import 'package:surveyy/utils/http_client.dart';

import '../auth/auth.dart';
import '../models/auth_user.dart';

class AuthController {
  static TextEditingController emailController = TextEditingController();
  static TextEditingController passwordController = TextEditingController();

  static RxBool isPasswordVisible = true.obs;
  static RxBool loading = false.obs;

  static String token = '';

  static late AuthUser user;


  static signIn() async {
    loading.value = true;
    HttpResponse res = await HttpClient.testRoute({
      'email': emailController.text,
      'password': passwordController.text,
    });

    if(res.statusCode ==201){
      HttpClient.setAuthToken(res.data['accessToken']);
      token = res.data['accessToken'];

      user = AuthUser.fromJSON(res.data['user']);

      Get.offAll(()=>const Layout());
    }
    else{
      Get.snackbar('Error', 'Invalid Credentials');
    }
    loading.value = false;
  }

  static logout() async {
    // Perform any necessary cleanup or API calls for logout. backend

    emailController.clear();
    passwordController.clear();
    Get.off(() => LoginPage());
  }

  static saveLastActivityTimeStamp() async{
    final prefs = await SharedPreferences.getInstance();
    final now = DateTime.now();
    await prefs.setInt('last_activity_timestamp', now.millisecondsSinceEpoch);
  }

  static Future<bool> shouldLogout() async{
    final prefs =await SharedPreferences.getInstance();
    final lastActivityTimeStamp = prefs.getInt('last_activity_timestamp');
    if(lastActivityTimeStamp != null){
      final now =DateTime.now();
      final lastActivity = DateTime.fromMillisecondsSinceEpoch(lastActivityTimeStamp);
      final difference = now.difference(lastActivity);
      return difference.inMinutes >= 2;

    }
    return false;
  }
  static Future<void> checkAndLogoutIfNecessary() async{
    if (await shouldLogout()){
      logout();
    }
  }
}
