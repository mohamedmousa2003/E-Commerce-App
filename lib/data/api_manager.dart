import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:shoppe/core/resources/constants.dart';

@singleton
class ApiManager {
  late Dio dio;

  ApiManager() {
    dio = Dio();
  }

  // get
  Future<Response> getData(String endPoint,
      {Map<String, dynamic>? queryParameters}) {
    return dio.get(baseUrl + endPoint,
        options: Options(validateStatus: ((status) => true)),
        queryParameters: queryParameters);
  }

  // post
  Future<Response> postData(String endPoint,
      {Map<String, dynamic>? queryParameters, Map<String, dynamic>? body}) {
    return dio.post(baseUrl + endPoint,
        options: Options(validateStatus: ((status) => true)),
        data: body,
        queryParameters: queryParameters);
  }
}
