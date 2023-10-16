import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:surveyy/utils/backgrounds.dart';
import 'package:surveyy/utils/text_styles.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: Backgrounds.themeBackground(),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: Get.width * 0.8,
                  height: Get.height * 0.7,
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 32),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 128,
                            height: 128,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage("assets/images/Icon.png"),
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Text(
                            'Sign In',
                            style: TextStyles.h1(),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          TextField(),
                          const SizedBox(
                            height: 8,
                          ),
                          TextField(),
                          const SizedBox(
                            height: 8,
                          ),
                          Container(
                              width: double.infinity,
                              height: 56,
                              child: ElevatedButton(
                                onPressed: () {},
                                child: const Text('Sign In'),
                              ))
                        ],
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
