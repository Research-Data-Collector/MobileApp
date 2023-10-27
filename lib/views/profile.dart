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
          appBar: AppBar(title: const Text('Profile'),),
      body: Column(
        children: [
          Container(

            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    //profile pic and name side by side
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        alignment: Alignment.topLeft,
                        width: 80,
                        height: 80,
                        decoration:BoxDecoration(

                          borderRadius: BorderRadius.all(Radius.circular(40.0)),
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
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.grey,),
                          onPressed:(){
                            AuthController.logout();
                          },
                          child: Text("Logout"))
                    ],
                  ),
                  const SizedBox(height: 10.0),
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
                  SizedBox(height: 10.0),

                ],
              ),
            ),

          ),

          Expanded(

              child: Obx(()=> !FormController.loading.value ? ListView.builder(
                itemCount: FormController.forms.length,
                itemBuilder: (context, index) {
                  return Card(

                    color: Colors.grey,
                    margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),

                    child: ListTile(
                      title: Text(FormController.forms[index].title),
                      subtitle: Text(FormController.forms[index].description),
                      trailing: const Icon(Icons.arrow_forward_ios),
                      onTap: () {
                        FormViewController.formData = FormController.forms[index].data;
                        //FormViewController.formDescription= FormController.forms[index].description;
                        Get.to(()=>FormView(formIdData:FormController.forms[index].id));
                        //formId:int.parse(FormController.forms[index].id)
                      },
                    ),
                  );
                },
              ): const Center(
                child: CircularProgressIndicator(),
              ))
          ),

        ],

      ),


    );
  }
}
