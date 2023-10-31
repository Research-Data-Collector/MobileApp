import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:surveyy/utils/http_client.dart';
import 'package:surveyy/models/form.dart';

import 'auth_controller.dart'; // Import your FormModel class

class FormController {
  static RxList<FormModel> forms = <FormModel>[].obs;
  static RxBool loading = false.obs;

  static fetchFormsForAdmin() async {
      loading.value = true;
      var userEmail=AuthController.emailController.text;
      HttpResponse fetchedForms = await HttpClient.getForms(userEmail);
      forms.value = List.generate(fetchedForms.data.length, (index) => FormModel.fromJson(fetchedForms.data[index]));
      // print("value of forms");
      // print(forms.value);
      // print(fetchedForms);
      loading.value = false;
    }

  static Future<void> submitForm(int formId, String formData) async {
    loading.value = true;

    try {
      var userEmail = AuthController.emailController.text;
      HttpResponse response = await HttpClient.submitForms(userEmail, formId, formData);

      // Handle the response as needed
      if (response.statusCode == 201) {
        print('Form submitted successfully');
        // You can add further logic here, such as clearing the form or displaying a success message.
      } else {
        print('Error submitting form');
        // Handle the error, e.g., display an error message.
      }
    } catch (e) {
      print(e);
      // Handle the error, e.g., display an error message.
    }
  }

}
