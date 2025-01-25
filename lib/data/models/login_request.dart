import 'package:json_annotation/json_annotation.dart';

part 'login_request.g.dart';

@JsonSerializable()
class LoginRequest {
  final String userNameOrEmailAddress;
  final String password;

  LoginRequest({required this.userNameOrEmailAddress, required this.password});
}
