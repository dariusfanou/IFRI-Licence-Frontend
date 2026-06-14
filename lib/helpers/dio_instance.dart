import 'package:dio/dio.dart';

Dio configureDio() {

  final options = BaseOptions(
    baseUrl: 'http://192.168.100.6:8000/api/',
    connectTimeout: Duration(seconds: 30),
    receiveTimeout: Duration(seconds: 30),
    headers: {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
    }
  );
  final dio = Dio(options);

  dio.interceptors.add(LogInterceptor(
    requestBody: true,
    responseBody: true,
    requestHeader: true,
    responseHeader: true,
  ));

  return dio;
}