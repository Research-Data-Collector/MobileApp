import 'package:flutter/material.dart';
import 'package:objectbox/objectbox.dart';

import '../entities.dart';
import 'form_view.dart';
// Import your ObjectBox generated file

class FormListPage extends StatefulWidget {
  @override
  _FormListPageState createState() => _FormListPageState();
}

class _FormListPageState extends State<FormListPage> {
  late Store _store;
  List<FormSubmissionModel> _formSubmissions = [];

  @override
  void initState() {
    super.initState();
    _store = getObjectBoxStore(); // Get the ObjectBox store
    _loadFormSubmissions(); // Load form submissions from ObjectBox
  }

  void _loadFormSubmissions() {
    final box = _store.box<FormSubmissionModel>();
    final submissions = box.getAll();
    setState(() {
      _formSubmissions = submissions;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Form Submissions'),
      ),
      body: ListView.builder(
        itemCount: _formSubmissions.length,
        itemBuilder: (context, index) {
          final formSubmission = _formSubmissions[index];
          return ListTile(
            title: Text('Form ID: ${formSubmission.formId}'),
            subtitle: Text('Submitted at: ${formSubmission.id}'),
            trailing: IconButton(
              icon: Icon(Icons.delete), // Add a delete button to remove the submission if needed
              onPressed: () {
                // Delete the submission from ObjectBox here
                // You can use formSubmission.id to identify and delete the specific submission
                // Then call _loadFormSubmissions() to refresh the list.
              },
            ),
          );
        },
      ),
    );
  }
}
