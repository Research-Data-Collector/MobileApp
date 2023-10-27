import 'package:flutter/material.dart';
import 'package:surveyy/views/profile.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: SubmissionPage(),
  ));
}

class SubmissionPage extends StatelessWidget {
  const SubmissionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Submission')),
      body: SingleChildScrollView(
        child:Column(
          children: [],
        )
      ),
    );
  }
}
