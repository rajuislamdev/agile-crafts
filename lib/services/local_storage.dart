import 'package:hive_flutter/hive_flutter.dart';

class LocalStorageService {
  // singleton
  static final LocalStorageService _instance = LocalStorageService._internal();

  factory LocalStorageService() => _instance;

  LocalStorageService._internal();
  static const String _boxName = 'appStorage';
  late Box _box;

  Future<void> init() async {
    await Hive.initFlutter();
    _box = await Hive.openBox(_boxName);
  }

  Future<void> saveToken(String token) async {
    await _box.put('token', token);
  }

  String? getToken() {
    return _box.get('token');
  }

  Future<void> clearToken() async {
    await _box.delete('token');
  }
}
