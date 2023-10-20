import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:surveyy/controllers/auth_controller.dart';
import 'package:surveyy/controllers/form_view_controller.dart';
import 'package:surveyy/views/form_view.dart';
import 'package:surveyy/views/submission.dart';

import '../controllers/form_controller.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {


    FormController.fetchFormsForAdmin();

    return Scaffold(
      backgroundColor: const Color(0xFFFFFFF0),
          appBar: AppBar(
            title: const Text('Profile'),
            actions: [
              IconButton(
                onPressed: () {
                  AuthController.logout();

                },
                icon: const Icon(Icons.logout),
              )
            ],
          ),
          body: SizedBox(

            child: Obx(()=> !FormController.loading.value ? ListView.builder(
              itemCount: FormController.forms.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    title: Text(FormController.forms[index].title),
                    subtitle: Text(FormController.forms[index].description),
                    trailing: const Icon(Icons.arrow_forward_ios),
                    onTap: () {
                      FormViewController.formData = FormController.forms[index].data;
                      //FormViewController.formDescription= FormController.forms[index].description;
                      Get.to(()=> const FormView());
                    },
                  ),
                );
              },
            ): const Center(
              child: CircularProgressIndicator(),
            ))
          ),
//       body: Stack(
//         children: [
//           // Background Image
//           // Container(
//           //   decoration: const BoxDecoration(
//           //     image: DecorationImage(
//           //       image: AssetImage("assets/images/right-bg.png"),
//           //       fit: BoxFit.cover,
//           //       opacity: 0.88, // Adjust opacity as needed
//           //     ),
//           //   ),
//           // ),
//           // Transparent White Layer
//           Container(
//             // color: Colors.grey.withOpacity(0.3), // Adjust opacity as needed
//             // width: double.infinity,
//             // height: double.infinity,
//             // margin: const EdgeInsets.fromLTRB(25.0, 50.0, 35.0, 25.0),
//             child: Center(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Column(
//                     //profile pic and name side by side
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Container(
//                         alignment: Alignment.topLeft,
//                         width: 80,
//                         height: 80,
//                         decoration:BoxDecoration(
//
//                           borderRadius: BorderRadius.all(Radius.circular(40.0)),
//                           image: DecorationImage(
//
//                             image: AssetImage("assets/images/profilepic.jfif"),
//                             fit: BoxFit.cover,
//                           ),
//                         ),
//                       ),
//                       const SizedBox(width: 16.0),
//                       const Text(
//                         "John de Gone",
//
//                         style: TextStyle(
//                           fontSize: 24.0,
//                           fontWeight: FontWeight.bold,
//                           fontFamily: 'zen kaku gothic antique',
//                           color: Colors.black,
//                         ),
//                       ),
//                       ElevatedButton(
//                           onPressed:(){
//                             AuthController.logout();
//                           },
//                           child: Text("Logout"))
//                     ],
//                   ),
//                   const SizedBox(height: 40.0),
//                   Opacity(
//                     opacity:
//                         0.4, // Adjust the opacity value as needed (0.0 to 1.0)
//                     child: Container(
//                       height: 40,
//                       margin: const EdgeInsets.symmetric(horizontal: 20.0),
//                       decoration: BoxDecoration(
//                         color: Colors.white,
//                         boxShadow:[
//                           BoxShadow(
//                             color: Colors.grey.shade600,
//                             spreadRadius: 1,
//                             blurRadius: 5,
//                             offset: const Offset(0, 5),
//                           ),
//                           BoxShadow(
//                             color: Colors.grey.shade300,
//                             offset: const Offset(-5,0),
//                           )
//                         ],
//                         borderRadius: BorderRadius.circular(100.0),
//                       ),
//                       child: const Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceAround,
//                         children: [
//                           Icon(
//                             IconData(0xec5e, fontFamily: 'MaterialIcons'),
//                             color: Color(0xff091B3D),
//                           ), // Replace with your search icon
//                           Expanded(
//                             child: TextField(
//                               decoration: InputDecoration(
//                                 hintText: 'Search by name or ID',
//                                 hintStyle: TextStyle(
//                                   color: Color(0xff091B3D),
//                                   fontFamily: 'zen kaku gothic antique',
//                                   fontWeight: FontWeight.w500,
//                                 ),
//                                 border: InputBorder.none,
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                   SizedBox(height: 20.0),
//                   Text(
//                     "Ongoing Research",
//                     style: TextStyle(
//                       fontSize: 16.0,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.black,
//                       fontFamily: 'zen kaku gothic antique',
//                     ),
//                     textAlign: TextAlign.left,
//                   ),
//                   const SizedBox(height: 5.0),
// //should change in to tiles
//                   Container(
//                     height: 40,
//                     margin: const EdgeInsets.symmetric(horizontal: 20.0),
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(100.0),
//                     ),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceAround,
//                       children: [
//                         Icon(IconData(0xe269, fontFamily: 'MaterialIcons'),
//                             color: Color(0xff7E869E)),
//                         Text(
//                           'Research ABC',
//                           style: TextStyle(
//                             color: Colors.black,
//                             fontSize: 14,
//                             fontFamily: 'zen kaku gothic antique',
//                             fontWeight: FontWeight.w500,
//                           ),
//                         ),
//                         Icon(IconData(0xf7af, fontFamily: 'MaterialIcons'),
//                             color: Color(0xff7E869E)),
//                         Icon(IconData(0xf52d, fontFamily: 'MaterialIcons'),
//                             color: Color(0xff7E869E)),
//                       ],
//                     ),
//                   ),
//                   //should be a forloop
//                   SizedBox(height: 10.0),
//                   Container(
//                     height: 40,
//                     margin: const EdgeInsets.symmetric(horizontal: 20.0),
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(100.0),
//                     ),
//                     child: const Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceAround,
//                       children: [
//                         Icon(IconData(0xe269, fontFamily: 'MaterialIcons'),
//                             color: Color(0xff7E869E)),
//                         Text(
//                           'Research DEF',
//                           style: TextStyle(
//                             color: Colors.black,
//                             fontSize: 14,
//                             fontFamily: 'zen kaku gothic antique',
//                             fontWeight: FontWeight.w500,
//                           ),
//                         ),
//                         Icon(IconData(0xf7af, fontFamily: 'MaterialIcons'),
//                             color: Color(0xff7E869E)),
//                         Icon(IconData(0xf52d, fontFamily: 'MaterialIcons'),
//                             color: Color(0xff7E869E)),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white60,
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
