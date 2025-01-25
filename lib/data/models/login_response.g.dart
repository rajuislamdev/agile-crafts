// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_response.dart';

// **************************************************************************
// RepositoryGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, duplicate_ignore

mixin $LoginResponseLocalAdapter on LocalAdapter<LoginResponse> {
  static final Map<String, RelationshipMeta> _kLoginResponseRelationshipMetas =
      {};

  @override
  Map<String, RelationshipMeta> get relationshipMetas =>
      _kLoginResponseRelationshipMetas;

  @override
  LoginResponse deserialize(map) {
    map = transformDeserialize(map);
    return _$LoginResponseFromJson(map);
  }

  @override
  Map<String, dynamic> serialize(model, {bool withRelationships = true}) {
    final map = _$LoginResponseToJson(model);
    return transformSerialize(map, withRelationships: withRelationships);
  }
}

final _loginResponsesFinders = <String, dynamic>{};

// ignore: must_be_immutable
class $LoginResponseHiveLocalAdapter = HiveLocalAdapter<LoginResponse>
    with $LoginResponseLocalAdapter;

class $LoginResponseRemoteAdapter = RemoteAdapter<LoginResponse>
    with LoginAdapter;

final internalLoginResponsesRemoteAdapterProvider =
    Provider<RemoteAdapter<LoginResponse>>((ref) => $LoginResponseRemoteAdapter(
        $LoginResponseHiveLocalAdapter(ref),
        InternalHolder(_loginResponsesFinders)));

final loginResponsesRepositoryProvider = Provider<Repository<LoginResponse>>(
    (ref) => Repository<LoginResponse>(ref));

extension LoginResponseDataRepositoryX on Repository<LoginResponse> {
  LoginAdapter get loginAdapter => remoteAdapter as LoginAdapter;
}

extension LoginResponseRelationshipGraphNodeX
    on RelationshipGraphNode<LoginResponse> {}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginResponse _$LoginResponseFromJson(Map<String, dynamic> json) =>
    LoginResponse(
      id: json['id'] as String?,
      accessToken: json['result']['accessToken'] as String,
    );

Map<String, dynamic> _$LoginResponseToJson(LoginResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'accessToken': instance.accessToken,
    };
