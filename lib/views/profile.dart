import 'package:flutter/material.dart';
import 'package:surveyy/views/submission.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: ProfilePage(),
  ));
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            margin: const EdgeInsets.fromLTRB(35.0, 70.0, 35.0, 70.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    //profile pic and name side by side
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        alignment: Alignment.topLeft,
                        width: 80,
                        height: 80,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(40.0)),
                          border: Border.fromBorderSide(
                              BorderSide(color: Colors.white, width: 5.0)),
                          image: DecorationImage(
                            image: AssetImage("assets/images/profilepic.jfif"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(width: 16.0),
                      const Text(
                        "John de Gone",
                        style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'zen kaku gothic antique',
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 80.0),
                  Opacity(
                    opacity:
                        0.4, // Adjust the opacity value as needed (0.0 to 1.0)
                    child: Container(
                      height: 40,
                      margin: const EdgeInsets.symmetric(horizontal: 20.0),
                      decoration: BoxDecoration(
                        color: Color(0xff5E6167),
                        borderRadius: BorderRadius.circular(100.0),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Icon(
                            IconData(0xec5e, fontFamily: 'MaterialIcons'),
                            color: Color(0xff091B3D),
                          ), // Replace with your search icon
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: 'Search by name or ID',
                                hintStyle: TextStyle(
                                  color: Color(0xff091B3D),
                                  fontFamily: 'zen kaku gothic antique',
                                  fontWeight: FontWeight.w500,
                                ),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Text(
                    "Ongoing Research",
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontFamily: 'zen kaku gothic antique',
                    ),
                    textAlign: TextAlign.left,
                  ),
                  const SizedBox(height: 5.0),

                  Container(
                    height: 40,
                    margin: const EdgeInsets.symmetric(horizontal: 20.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(100.0),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Icon(IconData(0xe269, fontFamily: 'MaterialIcons'),
                            color: Color(0xff7E869E)),
                        Text(
                          'Research ABC',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontFamily: 'zen kaku gothic antique',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Icon(IconData(0xf7af, fontFamily: 'MaterialIcons'),
                            color: Color(0xff7E869E)),
                        Icon(IconData(0xf52d, fontFamily: 'MaterialIcons'),
                            color: Color(0xff7E869E)),
                      ],
                    ),
                  ),
                  //should be a forloop
                  SizedBox(height: 10.0),
                  Container(
                    height: 40,
                    margin: const EdgeInsets.symmetric(horizontal: 20.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(100.0),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Icon(IconData(0xe269, fontFamily: 'MaterialIcons'),
                            color: Color(0xff7E869E)),
                        Text(
                          'Research DEF',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontFamily: 'zen kaku gothic antique',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Icon(IconData(0xf7af, fontFamily: 'MaterialIcons'),
                            color: Color(0xff7E869E)),
                        Icon(IconData(0xf52d, fontFamily: 'MaterialIcons'),
                            color: Color(0xff7E869E)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              IconData(0xee98,
                  fontFamily: 'MaterialIcons', matchTextDirection: true),
            ),
            label: 'Research',
            backgroundColor: Colors.green,
          ),
          BottomNavigationBarItem(
            icon: Icon(IconData(0xf5a3, fontFamily: 'MaterialIcons')),
            label: 'Unsynced',
            backgroundColor: Colors.green,
          ),
        ],
        onTap: (index) {
          if (index == 1) {
            // Navigate to the SubmissionPage when "Unsynced" icon is tapped
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      SubmissionPage()), // Replace with your SubmissionPage widget
            );
          }
        },
        selectedItemColor: Color(0xff2772F0), // Change the label color here
        unselectedItemColor: Colors.grey,
      ),
    );
  }
}
