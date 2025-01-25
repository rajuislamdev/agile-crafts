import 'package:dio/dio.dart';

import '../../../core/utils/logger.dart';

class DioInterceptors extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    super.onRequest(options, handler);
    Logger.log('REQUEST[${options.method}] => PATH: ${options.path}');
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    super.onResponse(response, handler);
    Logger.log(
        'RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}');
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    super.onError(err, handler);
    Logger.log(
        'ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}');
  }
}
