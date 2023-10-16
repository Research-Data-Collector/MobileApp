import 'package:get/get.dart';
import 'package:surveyy/utils/http_client.dart';
import 'package:surveyy/models/form.dart'; // Import your FormModel class

class FormController {
  static RxList<FormModel> forms = <FormModel>[].obs;
  static RxBool loading = false.obs;

  static fetchFormsForAdmin() async {
      loading.value = true;
      HttpResponse fetchedForms = await HttpClient.getForms();
      forms.value = List.generate(fetchedForms.data.length, (index) => FormModel.fromJson(fetchedForms.data[index]));
      loading.value = false;
    }

}
