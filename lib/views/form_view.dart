import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:surveyy/controllers/form_view_controller.dart';

import '../controllers/form_controller.dart';

class FormView extends StatelessWidget {
  final int formIdData;
  const FormView({super.key, required this.formIdData});
  //const FormView({super.key});

  @override
  Widget build(BuildContext context) {

    FormViewController.buildFields();

    return Scaffold(
      appBar: AppBar(
        //title: Text(FormViewController.formData['title']),
        title:Text(FormViewController.formData['title']),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(

            children: [
              ...FormViewController.fields,
              SizedBox(height: 25,),
              // ElevatedButton(
              //     onPressed: (){
              //       for (var field in FormViewController.fieldControllers) {
              //         print(field.id);
              //         print(field.question);
              //         print(field.value);
              //
              //        print(field.file);
              //        print(field.controller);
              //
              //       }
              //
              //     },
              //     child: Text('Submit'),
              //     style: ElevatedButton.styleFrom(
              //       primary: Colors.blue,
              //       onPrimary: Colors.white,
              //     ),
              // ),
              ElevatedButton(
                onPressed: () async {
                  final formId = formIdData; // Your form ID
                  // var data = <String, dynamic>{};
                  //
                  // for (var field in FormViewController.fieldControllers) {
                  //   // Convert RxString to a regular string
                  //   final value = field.value?.value ?? ''; // If value is null, set an empty string
                  //
                  //   // data[field.question] = value;
                  //   // print(data);
                  //
                  //   data['id'] = field.id; // Adding a string value
                  //   data['question'] = field.question; // Adding an integer value
                  //   data['answer'] = field.value; // Adding a nested map
                  //
                  // }


                  var data = <Map<String, dynamic>>[]; // Initialize a list of maps

                  for (var field in FormViewController.fieldControllers) {
                    final value = field.value?.value ?? ''; // If value is null, set an empty string

                    final fieldData = <String, dynamic>{
                      'id': field.id,
                      'question': field.question,
                      'answer': value,
                    };

                    data.add(fieldData); // Add the field data to the list
                  }

                  // Convert data to a JSON string
                  final jsonData = jsonEncode(data);

                  try {
                    await FormController.submitForm(formId, jsonData);
                  } catch (e) {
                    // Handle the error, e.g., display an error message
                    print('Error submitting form: $e');
                  }
                }, child: Text('Submit'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue,
                  onPrimary: Colors.white,
                ),
              )



            ]


          ),


        ),

      ),
    );
  }
}