import 'package:agile_crafts/app.dart';
import 'package:agile_crafts/main.data.dart';
import 'package:agile_crafts/services/local_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_data/flutter_data.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  LocalStorageService().init();
  runApp(
    ProviderScope(
      overrides: [
        configureRepositoryLocalStorage(
          baseDirFn: () => getApplicationDocumentsDirectory().then(
            (value) => value.path,
          ),
          encryptionKey: null,
          clear: LocalStorageClearStrategy.never,
        ),
        graphNotifierThrottleDurationProvider.overrideWithValue(Duration.zero),
      ],
      child: const MyApp(),
    ),
  );
}
