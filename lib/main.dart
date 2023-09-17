import 'package:flutter/material.dart';
import 'package:surveyy/auth/auth.dart';
import 'package:surveyy/utils/http_client.dart';
import 'package:get/get.dart';

void main() {
  HttpClient.initialize();
  runApp(const SurveyY());
}

class SurveyY extends StatelessWidget {
  const SurveyY({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Survey Y',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
          useMaterial3: true,
          fontFamily: 'zen kaku gothic antique',
          inputDecorationTheme: const InputDecorationTheme(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          )),
      home: const Auth(),
    );
  }
}
