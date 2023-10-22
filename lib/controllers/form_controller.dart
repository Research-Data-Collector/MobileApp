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
      //print(userEmail);
      HttpResponse fetchedForms = await HttpClient.getForms(userEmail);
      forms.value = List.generate(fetchedForms.data.length, (index) => FormModel.fromJson(fetchedForms.data[index]));
      loading.value = false;
    }

}
