import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:objectbox/objectbox.dart';
import 'package:path_provider/path_provider.dart';
import 'package:surveyy/controllers/form_view_controller.dart';
import '../controllers/form_controller.dart';
import '../entities.dart';
import '../objectbox.g.dart';

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
                  final formId = formIdData; // Your form ID

                  var data = <Map<String, dynamic>>[];

                  for (var field in FormViewController.fieldControllers) {
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

                    //await FormController.submitForm(formId, jsonData);
                    //print('Submitting form data:  $formId');



                    final formSubmission = FormSubmissionModel(formId,jsonData);

                     final store = getObjectBoxStore();
                     final box = store.box<FormSubmissionModel>();
                    box.put(formSubmission);
                    final submissions = box.getAll();
                     //print(FormViewController.formData['title']);
                    print("printint the object box");
                    submissions.forEach((submission) {
                      print( ' ID: ${submission.id}, Form ID: ${submission.formId}, JSON Data: ${submission.jsonData}');
                    });
                   //box.removeAll();
                  } catch (e) {
                    print('Error submitting form: $e');
                  }
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
