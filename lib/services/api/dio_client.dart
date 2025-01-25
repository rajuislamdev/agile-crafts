import 'package:dio/dio.dart';

import '../../../core/errors/api_error_handler.dart';
import '../../core/config/environment.dart';
import 'dio_interceptors.dart';

class DioClient {
  static final DioClient _instance = DioClient._internal();

  final Dio dio;
  factory DioClient() => _instance;

  DioClient._internal()
      : dio = Dio(
          BaseOptions(baseUrl: Environment.apiUrl),
        )
          ..interceptors.add(DioInterceptors())
          ..interceptors.add(InterceptorsWrapper(
            onError: (error, handler) {
              // Use ApiErrorHandler to handle the error
              final failure = ApiErrorHandler.handleDioError(error: error);
              // You can log the failure or handle it further if needed
              return handler.reject(DioException(
                requestOptions: error.requestOptions,
                error: failure,
                type: DioExceptionType.unknown,
              ));
            },
          ))
          ..interceptors.add(
            LogInterceptor(
              requestBody: true,
              responseBody: true,
            ),
          );

  Future<Response> get(String path, {Map<String, dynamic>? queryParams}) async {
    return await dio.get(path, queryParameters: queryParams);
  }

  Future<Response> post(String path, {dynamic data}) async {
    return await dio.post(path, data: data);
  }
}
