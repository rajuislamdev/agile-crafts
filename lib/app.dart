import 'package:agile_crafts/core/routes/app_router.dart';
import 'package:agile_crafts/features/product/views/products_page.dart';
import 'package:agile_crafts/main.data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'core/config/light_theme.dart';
import 'core/routes/app_routes.dart';

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Watch the repositoryInitializerProvider to trigger initialization
    final initializerState = ref.watch(repositoryInitializerProvider);

    return ScreenUtilInit(
      designSize: const Size(375, 812),
      useInheritedMediaQuery: false,
      splitScreenMode: true,
      minTextAdapt: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Agile Crafts',
          theme: lightTheme,
          home: initializerState.when(
            error: (error, _) => Center(child: Text('Error: $error')),
            loading: () => const Center(child: CircularProgressIndicator()),
            data: (_) =>
                const ProductsPage(), // Replace with your actual home screen
          ),
          onGenerateRoute: AppRouter.generateRoute,
          initialRoute: AppRoutes.products,
        );
      },
    );
  }
}
