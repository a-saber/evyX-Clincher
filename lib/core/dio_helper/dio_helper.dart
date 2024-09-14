import 'package:dio/dio.dart';

class DioHelper {
  static late Dio dio;
  static init() {
    dio = Dio(BaseOptions(
      baseUrl: "https://clincher.evyx.xyz/",
      receiveDataWhenStatusError: true,
    ));
  }

  static Future<Response> getDate({
    required String endPoint,
  }) async {
    dio.options.headers = {
      'Content-Type': 'application/json',
      'Access-Control-Allow-Headers': 'Content-Type'
    };
    return await dio.get(
      endPoint,
    );
  }

}