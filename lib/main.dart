import 'package:agile_crafts/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  runApp(
    const ProviderScope(child: MyApp()),
  );
}
