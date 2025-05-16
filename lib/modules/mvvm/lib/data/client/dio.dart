import 'package:dio/dio.dart';
import 'package:mvvm/app/strings.dart' show AppStrings;

Dio getDio() {
  final dio = Dio(BaseOptions(
    baseUrl: AppStrings.baseUrl,
    connectTimeout: const Duration(seconds: 6),
    receiveTimeout: const Duration(seconds: 4),
  ));
  dio.interceptors.add(LogInterceptor(responseBody: true));
  return dio;
}