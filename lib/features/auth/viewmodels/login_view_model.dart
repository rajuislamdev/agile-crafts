import 'package:agile_crafts/core/state/app_state.dart';
import 'package:agile_crafts/data/models/login_response.dart';
import 'package:flutter_data/flutter_data.dart';

import '../../../data/models/login_request.dart';
import '../provider/providers.dart';

class LoginViewModel extends StateNotifier<AppState<LoginResponse>> {
  final Ref ref;

  LoginViewModel(this.ref) : super(const AppState.initial());

  Future<void> login({required LoginRequest loginRequest}) async {
    state = const AppState.loading();
    final loginRepository = ref.read(loginRepoProvider);
    final result = await loginRepository.login(loginRequest: loginRequest);
    state = result.fold(
      (failure) => AppState.error(failure),
      (loginResponse) => AppState.success(loginResponse),
    );
  }
}
