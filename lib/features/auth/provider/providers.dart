import 'package:agile_crafts/data/models/login_response.dart';
import 'package:flutter_data/flutter_data.dart';

import '../../../core/state/app_state.dart';
import '../../../data/repositories/login_repository.dart';
import '../viewmodels/login_view_model.dart';

final loginRepoProvider = Provider<LoginRepository>((ref) {
  final loginRepository = ref.watch(loginResponsesRepositoryProvider);
  return LoginRepository(loginRepository);
});

final loginViewModelProvider = StateNotifierProvider<LoginViewModel, AppState>(
  (ref) => LoginViewModel(ref),
);
