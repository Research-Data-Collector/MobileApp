import 'package:flutter/material.dart';
import 'package:surveyy/views/login.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Remove the original Scaffold body and use a Stack widget to overlay the image and white layer
      body: Stack(
        children: [
          // Background Image

          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/right-bg.png"),
                fit: BoxFit.cover,
                opacity: 0.88, // Adjust opacity as needed
              ),
            ),
          ),
          // Transparent White Layer
          Container(
              color: Colors.white.withOpacity(0.75), // Adjust opacity as needed
              width: double.infinity,
              height: double.infinity,
              margin: const EdgeInsets.fromLTRB(
                  35.0, 70.0, 35.0, 70.0), // Add margin to make it smaller
              child: Center(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                    //logo
                    Container(
                      width: 91,
                      height: 100,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/images/Icon.png"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text("survey Y",
                        style: TextStyle(
                          fontFamily: "zen kaku gothic antique",
                          fontSize: 30,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff000000),
                        )),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text("Empowering Insights Through Data Collection",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: "zen kaku gothic antique",
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff616161),
                        )),
                    const SizedBox(
                      height: 60,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LoginPage()),
                        );
                      },
                      child: const Text(
                        "LOG IN",
                        style: TextStyle(
                          fontFamily: "zen kaku gothic antique",
                          fontSize: 14,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: const Color(0xff4067EC),
                        onPrimary: Colors.white,
                        minimumSize: const Size(200, 50),
                      ),
                    ),
                  ]))),
        ],
      ),
    );
  }
}
