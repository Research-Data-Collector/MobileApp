import 'dart:convert';
import 'dart:io';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:surveyy/utils/http_client.dart';
import 'package:flutter/material.dart';
import 'package:surveyy/controllers/form_controller.dart';
import 'package:surveyy/views/profile.dart';
import '../controllers/form_view_controller.dart';
import '../entities.dart';
import 'form_list_page.dart';
import 'form_view.dart';

class SubmissionPage extends StatelessWidget {

  const SubmissionPage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final store = getObjectBoxStore();
    final box = store?.box<FormSubmissionModel>();
    final submissions = box?.getAll();

    return Scaffold(
      appBar: AppBar(title: const Text('Unsynced Submissions')),
      body: submissions!.isEmpty
          ? Center(child: Text('No unsynced submissions.'))
          : ListView.builder(

        itemCount: submissions.length,
        itemBuilder: (context, index) {
          final submission = submissions[index];
          return Material(
            //color: Colors.blue,
            child: Container(
              margin: EdgeInsets.all(10),
              decoration:BoxDecoration(
                color: Colors.black.withOpacity(0.4),
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
              child: ListTile(
                enabled: true,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),

                title: Text('${FormViewController.formData?['title'] ?? 'No Title'}'),

                subtitle: Text('Submission ID: ${submission.id}'),
                trailing: IconButton(



                  //icon: Icon(IconData(0xe175, fontFamily: 'MaterialIcons'), color: Colors.white, size: 30,),
                  icon: Icon(Icons.upload, color: Colors.white, size: 30,),

                  onPressed: () async {

                    bool result =await InternetConnectionChecker().hasConnection;
                    if ( result==true) {
                      List data = jsonDecode(submission.jsonData);
                      var dataUpload = <Map<String, dynamic>>[];

                      for (var item in data) {
                        if (item["file"].isNotEmpty) {
                          print("not null");
                          print('File: ${item["file"]}');
                          final file = File(item["file"]);
                          HttpResponse response = await HttpClient.uploadtoS3(
                              file);
                          item["answer"] = response.data;
                          // print(item["answer"]);
                        }

                        final fieldData = <String, dynamic>{
                          'id': item["id"],
                          'question': item["question"],
                          'answer': item["answer"],
                        };

                        dataUpload.add(fieldData);
                      }

                      final jsonData = jsonEncode(dataUpload);



                      FormController.submitForm(submission.formId, jsonData);
                      box?.remove(submission.id);
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Submission Uploaded.')),);
                    }
                    else{

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('No internet connection available.')),
                    );}
                  },
                ),
                // You can display more details here as needed
              ),
            ),
          );
        },
      ),
    );
  }
}

