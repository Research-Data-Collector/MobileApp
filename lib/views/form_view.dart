import 'package:flutter/material.dart';
import 'package:surveyy/controllers/form_view_controller.dart';

class FormView extends StatelessWidget {
  const FormView({super.key});

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
            children: FormViewController.fields,
          ),
        ),
      ),
    );
  }
}