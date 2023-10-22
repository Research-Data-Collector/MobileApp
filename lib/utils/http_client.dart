import 'package:dio/dio.dart';
import 'package:surveyy/models/form.dart';

class HttpResponse {
  final dynamic data;
  final int statusCode;

  HttpResponse({this.data, required this.statusCode});
}

class HttpClient {
  static Dio dio = Dio();

  static initialize() {
    dio.options.baseUrl = 'http://10.0.2.2:3000';
    dio.options.connectTimeout = const Duration(seconds: 5);
    dio.options.receiveTimeout = const Duration(seconds: 5);

    print('HttpClient initialized');
  }

  static setAuthToken(String token) {
    dio.options.headers = {'Authorization': 'Bearer $token'};
  }

  static Future<Response> get(String path) async {
    return await dio.get(path);
  }

  static Future<Response> post(String path, dynamic data) async {
    return await dio.post(path, data: data);
  }

  // Routes List

  static testRoute(Map data) async {
    try {
      final response = await post('/auth/login', data);
      return HttpResponse(
          data: response.data, statusCode: response.statusCode ?? 500);
    } on DioException catch (e) {
      return HttpResponse(
          data: e.response?.data, statusCode: e.response?.statusCode ?? 500);
    }
  }

  // SignIn


  static Future<HttpResponse> getForms(userEmail) async {

    try {
      Response response = await post('/admin/getforms', {
        'email': userEmail, });
      // print(userEmail);
      //
      // print(response.data);
      print('----------------------------');
      return HttpResponse(
          data: response.data,
          statusCode: response.statusCode ?? 500
      );

    } on DioException catch (e) {
      print(e);
      return HttpResponse(
          data: e.response?.data, statusCode: e.response?.statusCode ?? 500);
    }
  }


}
