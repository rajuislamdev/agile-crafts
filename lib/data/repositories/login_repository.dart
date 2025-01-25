import 'package:agile_crafts/data/models/login_response.dart';
import 'package:agile_crafts/services/local_storage.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_data/flutter_data.dart';

import '../../core/errors/api_error_handler.dart';
import '../../core/errors/failure.dart';
import '../models/login_request.dart';

class LoginRepository {
  final Repository<LoginResponse> loginRepository;

  LoginRepository(this.loginRepository);

  Future<Either<Failure, LoginResponse>> login(
      {required LoginRequest loginRequest}) async {
    try {
      final response =
          await loginRepository.loginAdapter.login(loginRequest: loginRequest);
      LocalStorageService().saveToken(response.accessToken);
      return right(response);
    } on DioException catch (dioError) {
      return left(ApiErrorHandler.handleDioError(error: dioError));
    } catch (error) {
      return left(Failure(message: 'An unexpected error occurred'));
    }
  }
}
