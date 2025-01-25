import 'package:flutter_data/flutter_data.dart';
import 'package:json_annotation/json_annotation.dart';

import '../adapters/login_adapter.dart';

part 'login_response.g.dart';

@JsonSerializable()
@DataRepository([LoginAdapter])
class LoginResponse extends DataModel<LoginResponse> {
  @override
  final String? id;
  final String accessToken;

  LoginResponse({this.id, required this.accessToken});
}
