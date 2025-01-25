import 'package:agile_crafts/features/auth/views/login_page.dart';
import 'package:flutter/material.dart';

import '../../features/product/views/products_page.dart';
import '../widgets/error_view.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/login':
        return MaterialPageRoute(builder: (_) => LoginPage());
      case '/products':
        return MaterialPageRoute(builder: (_) => const ProductsPage());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: ErrorView(
              message: 'No route defined for ${settings.name}',
            ),
          ),
        );
    }
  }
}
