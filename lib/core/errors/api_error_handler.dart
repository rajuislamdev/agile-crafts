import 'dart:io';

import 'package:agile_crafts/core/errors/failure.dart';
import 'package:dio/dio.dart';

class ApiErrorHandler {
  static Failure handleDioError({required DioException error}) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        return Failure(message: 'Connection timeout with API server');
      case DioExceptionType.receiveTimeout:
        return Failure(message: 'Receive timeout with API server');
      case DioExceptionType.sendTimeout:
        return Failure(message: 'Send timeout with API server');
      case DioExceptionType.badCertificate:
        return Failure(message: 'Bad certificate with API server');
      case DioExceptionType.badResponse:
        if (error.response != null) {
          return _handleBadResponse(response: error.response!);
        }
        return Failure(
            message: 'Received an invalid response from the server.');
      case DioExceptionType.cancel:
        return Failure(message: 'Request to API server was cancelled');
      case DioExceptionType.connectionError:
        return Failure(message: 'Connection error with API server');
      case DioExceptionType.unknown:
        if (error.error is SocketException) {
          return Failure(
              message:
                  'No internet connection. Please check your internet connection.');
        }
        return Failure(message: 'An unexpected error occurred');
    }
  }

  static Failure _handleBadResponse({required Response response}) {
    final statusCode = response.statusCode;
    final data = response.data;

    if (statusCode == 400) {
      return Failure(
          message: data['message'] ?? 'Bad request', code: statusCode);
    } else if (statusCode == 401) {
      return Failure(
        message: data['message'] ?? 'Unauthorized access. Please logn again.',
        code: statusCode,
      );
    } else if (statusCode == 403) {
      return Failure(
        message: data['message'] ?? 'Forbidden access. Please logn again.',
        code: statusCode,
      );
    } else if (statusCode == 404) {
      return Failure(
          message: data['message'] ?? 'Resource not found.', code: statusCode);
    } else if (statusCode == 422) {
      if (data['errors'] != null) {
        return Failure(
          message: _extractValidationError(error: data['errors']),
          code: statusCode,
        );
      }
      return Failure(
          message: data['message'] ?? 'Validation error', code: statusCode);
    } else if (statusCode == 500) {
      return Failure(
          message: data['message'] ?? 'Internal server error',
          code: statusCode);
    }
    return Failure(message: 'Something went wrong', code: statusCode);
  }

  static String _extractValidationError({required Map<String, dynamic> error}) {
    return error.entries
        .map((e) => "${e.key}: ${e.value.join(', ')}")
        .join("\n");
  }
}
