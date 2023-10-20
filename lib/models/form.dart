import 'dart:convert';

class FormModel {
  final String title;
  final String description;
  final Map data; // JSON data for a form

  FormModel({required this.title,required this.description, required this.data});

  factory FormModel.fromJson(Map<String, dynamic> json) {
    return FormModel(
      title: json['title'],
      data: json['data'],
      description: json['description'],
    );
  }
}

