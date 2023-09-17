import 'package:flutter/material.dart';
import 'package:surveyy/views/profile.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: SubmissionPage(),
  ));
}

class SubmissionPage extends StatelessWidget {
  const SubmissionPage({Key? key}) : super(key: key);

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
                          image: DecorationImage(
                            image: AssetImage("assets/images/Upload.png"),
                          ),
                        ),
                      ),
                      const SizedBox(width: 16.0),
                      const Text(
                        "Unsynced \n"
                        "Submissions",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 22.0,
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
                                hintText: 'Search by name',
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
                    "Research ABC",
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
                      children: [
                        Padding(
                          padding:
                              const EdgeInsets.fromLTRB(50.0, 0.0, 0.0, 0.0),
                          child: Text(
                            'SID1234_0023',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontFamily: 'zen kaku gothic antique',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
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
                    child: Row(
                      children: [
                        Padding(
                          padding:
                              const EdgeInsets.fromLTRB(50.0, 0.0, 0.0, 0.0),
                          child: Text(
                            'SID1234_0024',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontFamily: 'zen kaku gothic antique',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 15.0),
                  Text(
                    "Research DEF",
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
                      children: [
                        Padding(
                          padding:
                              const EdgeInsets.fromLTRB(50.0, 0.0, 0.0, 0.0),
                          child: Text(
                            'SID1441_0024',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontFamily: 'zen kaku gothic antique',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Container(
                    height: 40,
                    margin: const EdgeInsets.symmetric(horizontal: 20.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(100.0),
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding:
                              const EdgeInsets.fromLTRB(50.0, 0.0, 0.0, 0.0),
                          child: Text(
                            'SID1441_0024',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontFamily: 'zen kaku gothic antique',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
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
            icon: Icon(IconData(0xee98,
                fontFamily: 'MaterialIcons', matchTextDirection: true)),
            label: 'Research',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              IconData(0xf5a3, fontFamily: 'MaterialIcons'),
            ),
            label: 'Unsynced',
          ),
        ],
        onTap: (index) {
          if (index == 0) {
            // Navigate to the ProfilePage when "Unsynced" icon is tapped
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      const ProfilePage()), // Replace with your SubmissionPage widget
            );
          }
        },
        selectedItemColor: Colors.grey, // Change the label color here
        unselectedItemColor: Color(0xff2772F0),
      ),
    );
  }
}
