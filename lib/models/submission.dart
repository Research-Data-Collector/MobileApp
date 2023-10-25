// import 'dart:convert';
//
// class FormModel {
//   final String title;
//   final String description;
//   final Map data; // JSON data for a form
//
//   FormModel({required this.title,required this.description, required this.data});
//
//   factory FormModel.fromJson(Map<String, dynamic> json) {
//     return FormModel(
//       title: json['title'],
//       data: json['data'],
//       description: json['description'],
//     );
//   }
// }
//


import 'dart:convert';

class SubmissionModel{
  final String data;
  final int id;
  final int formId;

  SubmissionModel({required this.data,required this.id, required this.formId});

  factory SubmissionModel.fromJson(Map<String, dynamic> json) {
    return SubmissionModel(
      data: json['data'],
      id: json['id'],
      formId: json['formId'],
    );
  }
}
