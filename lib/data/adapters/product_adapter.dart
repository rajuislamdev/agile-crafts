import 'package:agile_crafts/core/config/api_endpoints.dart';
import 'package:agile_crafts/core/config/environment.dart';
import 'package:agile_crafts/data/models/product.dart';
import 'package:flutter_data/flutter_data.dart';

mixin ProductFetchAdapter on RemoteAdapter<Product> {
  @override
  String get baseUrl => Environment.apiUrl;

  @override
  String get type => ApiEndpoints.getProducts;
}

mixin ProductCreateAdapter on RemoteAdapter<Product> {
  @override
  String get baseUrl => Environment.apiUrl;

  @override
  String get type => ApiEndpoints.addProducts;
}
