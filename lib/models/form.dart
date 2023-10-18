import 'dart:convert';

class FormModel {
  final String title;
  final Map data; // JSON data for a form

  FormModel({required this.title, required this.data});

  factory FormModel.fromJson(Map<String, dynamic> json) {
    return FormModel(
      title: json['title'],
      data: json['data']
    );
  }
}

