import 'package:dio/dio.dart';

class DioClient {
  static final _dio = Dio()
      ..options.baseUrl = 'https://slash-store-34b69-default-rtdb.firebaseio.com/';

  static Future<Response> get(String uri) => _dio.get(uri);

}
