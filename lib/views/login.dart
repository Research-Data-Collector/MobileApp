import 'package:flutter/material.dart';
import 'package:surveyy/views/profile.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<LoginPage> {
  bool _obscurePassword = true; // Initially, password is obscured

  void _togglePasswordVisibility() {
    setState(() {
      _obscurePassword = !_obscurePassword; // Toggle password visibility
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
            margin: const EdgeInsets.fromLTRB(35.0, 70.0, 35.0, 70.0), // Add margin to make it smaller
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    //logo and name side by side
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 61,
                        height: 69,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/images/Icon.png"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(width: 16.0),
                      const Text(
                        "survey Y",
                        style: TextStyle(
                          fontFamily: "zen kaku gothic antique",
                          fontSize: 25,
                          fontWeight: FontWeight.w300,
                          color: Color(0xff000000),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Account Log In",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: "zen kaku gothic antique",
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff000000),
                    ),
                  ),
                  const SizedBox(height: 15),

                  Container(
                    margin: const EdgeInsets.symmetric(horizontal:50) ,
                    child: const Text(
                        "PLEASE LOGIN TO CONTINUE TO YOUR ACCOUNT",
                        textAlign: TextAlign.center,

                        style:TextStyle(
                          fontFamily: "zen kaku gothic antique",
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff616161),

                        )
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 50),
                    child: const TextField(
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF616161),
                        fontSize: 15,
                        fontFamily: 'zen kaku gothic antique',
                        fontWeight: FontWeight.w400,
                      ),
                      decoration: InputDecoration(
                        labelText: 'Email',
                        labelStyle: TextStyle(
                          color: Color(0xff616161),
                          fontSize: 15,
                          fontFamily: 'zen kaku gothic antique',
                          fontWeight: FontWeight.w400,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xff9E9E9E),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 1,
                            color: Color(0xFF9F7BFF),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 50),
                    child: TextField(
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Color(0xFF616161),
                        fontSize: 15,
                        fontFamily: 'zen kaku gothic antique',
                        fontWeight: FontWeight.w400,
                      ),
                      decoration: InputDecoration(
                        labelText: 'Password',
                        labelStyle: const TextStyle(
                          color: Color(0xff616161),
                          fontSize: 15,
                          fontFamily: 'zen kaku gothic antique',
                          fontWeight: FontWeight.w400,
                        ),
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xff9E9E9E),
                          ),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 1,
                            color: Color(0xFF9F7BFF),
                          ),
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _obscurePassword ? Icons.visibility : Icons.visibility_off,
                            color: Color(0xff616161), // Adjust icon color
                          ),
                          onPressed: _togglePasswordVisibility,
                        ),
                      ),
                      obscureText: _obscurePassword, // Toggle password visibility
                    ),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ProfilePage()),
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
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

//_obscurePassword to track the password visibility
//suffix icon to toggle password visibility
//function to toggle _obscurePassword
