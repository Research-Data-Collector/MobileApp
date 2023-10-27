import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:surveyy/views/profile.dart';
import 'package:surveyy/views/submission.dart';

class Layout extends StatelessWidget {
  const Layout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    PageController pageController = PageController();
    RxInt page = 0.obs;

    return Scaffold(
      bottomNavigationBar: Obx(() => BottomNavigationBar(
        backgroundColor: Colors.white60,
        currentIndex: page.value,
        onTap: (index) {
          pageController.animateToPage(index,
              duration: const Duration(milliseconds: 500),
              curve: Curves.ease);
          page.value = index;
        },
        elevation: 1,

        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              IconData(0xee98,
                  fontFamily: 'MaterialIcons', matchTextDirection: true),
            ),
            label: 'Research',

          ),
          BottomNavigationBarItem(
            icon: Icon(IconData(0xf5a3, fontFamily: 'MaterialIcons')),
            label: 'Unsynced',

          ),
        ],
        selectedItemColor: const Color(0xff2772F0), // Change the label color here
        unselectedItemColor: Colors.grey,
      )),
      body: PageView(
        controller: pageController,
        onPageChanged: (index) {
          page.value = index;
        },
        children: [
          const ProfilePage(),
          const SubmissionPage(),
        ],
      ),
    );
  }
}
