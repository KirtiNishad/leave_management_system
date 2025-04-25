import 'package:dio/dio.dart';

class ApiBaseClient {
  static final Map<String, dynamic> _headers = {};
  static final BaseOptions _opts = BaseOptions(
    headers: _headers,
    responseType: ResponseType.json,
  );

  static Dio _createDio() {
    return Dio(_opts);
  }

  static Dio _addInterCeptors(Dio dio) {
    dio.interceptors.add(InterceptorsWrapper(

    ));
    return dio;
  }

  static final _dio = _createDio();
  static Dio client = _addInterCeptors(_dio);
}
