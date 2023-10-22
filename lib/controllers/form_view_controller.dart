import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FieldController {
  String id;
  String question;
  RxString? value;
  File? file;
  TextEditingController? controller;

  FieldController({required this.id, required this.question, this.value, this.file, this.controller});


}

class FormViewController {
  static RxBool ready = false.obs;
  String? name;

  static Map formData = {
    "title": "Loading...",
    "fields": [],

  };

  static List<Widget> fields = [];
  static List<FieldController> fieldControllers = [];



  static Future<void> buildFields() async {
    fields.clear();
    fieldControllers.clear();

    for (Map field in formData['fields']) {
      switch (field['type']) {
        case 'text':
          addTextField(field);
          break;
        case 'number':
          addNumberField(field);
          break;
        case 'dropdown':
          addDropdownField(field);
          break;
        case 'radio':
          addRadioFields(field);
          break;
        case 'file':
          addFileFields(field);
          break;
        default:
          const Text(
            'Unknown field type',
            style: TextStyle(color: Colors.red),
          );
      }
    }
    ready.value = true;
  }

  static getVorC(String id) {
    return fieldControllers.firstWhere((element) => element.id == id);
  }

  static void addTextField(Map field) {
    fieldControllers.add(
        FieldController(
            controller: TextEditingController(),
            id: field['id'],
        question: field['label']));

    fields.add(Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(field['label']),
          TextField(
            controller: getVorC(field['id']).controller,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
            ),
          )
        ],
      ),
    ));
    print('Answer to Text Field: ${getVorC(field['id']).controller.text}');

  }

  static void addNumberField(Map field) {
    fieldControllers.add(
        FieldController(controller: TextEditingController(), id: field['id'],
            question: field['label']));

    fields.add(Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(field['label']),
          TextField(
            controller: getVorC(field['id']).controller,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
            ),
          )
        ],
      ),
    ));
  }

  static void addDropdownField(Map field) {
    List<String> values = field['data'].cast<String>();

    fieldControllers.add(
        FieldController(value: RxString(field['data'][0]), id: field['id'],
            question: field['label']));

    fields.add(Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(field['label']),
          FormField<String>(
            builder: (FormFieldState<String> state) {
              return InputDecorator(
                decoration: const InputDecoration(
                    contentPadding: EdgeInsets.zero,
                    border: OutlineInputBorder()),
                isEmpty: getVorC(field['id']).value == '',
                child: DropdownButtonHideUnderline(
                  child: Obx(() => DropdownButton<String>(
                    padding: const EdgeInsets.all(8),
                    value: getVorC(field['id']).value.value,
                    onChanged: (String? newValue) {
                      getVorC(field['id']).value?.value = newValue!;
                    },
                    items: values.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  )),
                ),
              );
            },
          ),
        ],
      ),
    ));
  }

  static void addRadioFields(Map field) {
    fieldControllers.add(
        FieldController(value: RxString(field['data'][0]), id: field['id'],
            question: field['label']));

    fields.add(Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(field['label']),
          Obx(() => Column(
            children: [
              for (String value in field['data'])
                RadioListTile<String>(
                  title: Text(value),
                  value: value,
                  groupValue: getVorC(field['id']).value?.value,
                  onChanged: (String? newValue) {
                    getVorC(field['id']).value?.value = newValue!;
                  },
                ),
            ],
          ))
        ],
      ),
    ));
  }

  static void addFileFields(Map field) {

    fieldControllers.add(
        FieldController(id: field['id'], question: field['label']));
    TextEditingController fileNameController = TextEditingController();
    String fileName='';
    fields.add(Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(field['label']),
          Row(
            children: [
              Container(
                child:ElevatedButton(
                onPressed: () async {
                  FilePickerResult? result = await FilePicker.platform.pickFiles();
                  if(result != null) {

                    PlatformFile file = result.files.first;
                    fileName=file.name;
                    fileNameController.text=fileName;

                    print(file.name);
                    print(file.bytes);
                    print(file.size);
                    print(file.extension);
                    print(file.path);
                  } else {
                    // User canceled the picker
                  }
                },
                child: const Text('Choose File'),


              ),

              ),
              const SizedBox(width: 12),



              //Text('Selected FILE NAME HERE'),
              Expanded(
                child: TextField(
                  controller: fileNameController,
                  decoration: const InputDecoration(
                    border:InputBorder.none,
                  ),
                ),
              ),
            ],
          )

        ],

      ),

    ));

  }


}
