import 'package:objectbox/objectbox.dart';

@Entity()
class FormSubmissionModel {
  int id; // ObjectBox entity ID
  int formId; // Your form ID
  String jsonData; // JSON data as a string

  FormSubmissionModel(int formId, String jsonData, {this.id = 0})
      : formId = formId,
        jsonData = jsonData;
  }

  // @override
  // String toString() {
  //   return 'FormSubmissionModel{formId: $formId, jsonData: $jsonData}';
  // }

