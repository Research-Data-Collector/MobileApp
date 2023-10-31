import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:objectbox/objectbox.dart';
import 'package:path_provider/path_provider.dart';
import 'package:surveyy/controllers/form_view_controller.dart';
import '../controllers/form_controller.dart';
import '../entities.dart';
import '../objectbox.g.dart';
import 'package:surveyy/utils/http_client.dart';

Store? _store;

void initObjectBox() {
  getApplicationDocumentsDirectory().then((dir) {
    _store = Store(
      getObjectBoxModel(),
      directory: '${dir.path}/objectbox',

    );

  });
}

Store getObjectBoxStore() {
  if (_store == null) {
    initObjectBox();
  }
  return _store!;
}

class FormView extends StatelessWidget {
  final int formIdData;
  const FormView({super.key, required this.formIdData});

  @override
  Widget build(BuildContext context) {
    FormViewController.buildFields();

    return Scaffold(
      appBar: AppBar(
        title: Text(FormViewController.formData['title']),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              ...FormViewController.fields,
              SizedBox(height: 25),
              ElevatedButton(
                onPressed: () async {
                  bool result = await InternetConnectionChecker().hasConnection;
                  if(result==true){
                    print("Connected to internet....");
                    final formId = formIdData; // Your form ID

                    var data = <Map<String, dynamic>>[];

                    for (var field in FormViewController.fieldControllers) {

                      final file = field.file;

                      if(file != null) {

                        HttpResponse response = await HttpClient.uploadtoS3(file);
                        // Store file information in the FieldController

                        //print('file: $file');

                        //print('fieldController.file: ${fieldController.file}');

                        field.value = RxString(response.data);

                      }
                      final value = field.value?.value ?? '';

                      final fieldData = <String, dynamic>{
                        'id': field.id,
                        'question': field.question,
                        'answer': value,
                      };
                      data.add(fieldData);



                    }

                    final jsonData = jsonEncode(data);
                    try {

                      await FormController.submitForm(formId, jsonData);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Submission Uploaded.')),);
                      //navigate to make a new form


                    } catch (e) {
                      print('Error submitting form: $e');
                    }


                  } else {
                    print('No internet :( Reason:');

                    final formId = formIdData; // Your form ID

                    var data = <Map<String, dynamic>>[];

                    for (var field in FormViewController.fieldControllers) {
                      final value = field.value?.value ?? '';
                      final fieldData = <String, dynamic>{
                        'id': field.id,
                        'question': field.question,
                        'answer': value,
                        'file': field.file?.path ?? '',
                      };
                      data.add(fieldData);
                      //print(fieldData);
                    }

                    final jsonData = jsonEncode(data);
                    //print(jsonData);


                    final formSubmission = FormSubmissionModel(formId,jsonData);

                    final store = getObjectBoxStore();
                    final box = store.box<FormSubmissionModel>();
                    box.put(formSubmission);
                    //final submissions = box.getAll();

                    try {

                      await FormController.submitForm(formId, jsonData);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('No connection...Uploading to local storage...')),);


                    } catch (e) {
                      print('Error submitting form: $e');
                    }

                  }

                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => FormView(formIdData: formIdData),
                    ),
                  );
                },
                child: Text('Submit'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue,
                  onPrimary: Colors.white,
                ),

              ),
            ],
          ),
        ),
      ),
    );
  }
}
