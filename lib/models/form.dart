import 'dart:convert';

class FormModel {
  final String title;
  final String description;
  final int id;
  final Map data; // JSON data for a form

  FormModel({required this.title,required this.description,required this.id, required this.data});

  factory FormModel.fromJson(Map<String, dynamic> json) {
    return FormModel(
      title: json['title'],
      data: json['data'],
      id: json['id'],
      description: json['description'],
    );
  }
}

