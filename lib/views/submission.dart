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
    final box = store.box<FormSubmissionModel>();
    final submissions = box.getAll();

    return Scaffold(
      appBar: AppBar(title: const Text('Unsynced Submissions')),
      body: submissions.isEmpty
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
                title: Text('${FormViewController.formData['title']}'),
                subtitle: Text('Submission ID: ${submission.id}'),
                trailing: IconButton(
                  icon: Icon(IconData(0xe175, fontFamily: 'MaterialIcons'), color: Colors.white, size: 30,),
                  onPressed: () {
                    FormController.submitForm(submission.formId,submission.jsonData);
                    box.remove(submission.id);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Submission Uploaded.')),
                    );
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

