import 'package:agile_crafts/data/models/product.dart';
import 'package:agile_crafts/data/repositories/product_repository.dart';
import 'package:agile_crafts/features/product/viewmodels/product_view_model.dart';
import 'package:flutter_data/flutter_data.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/state/app_state.dart';

final productRepoProvider = Provider<ProductRepository>((ref) {
  final productRepository = ref.watch(productsRepositoryProvider);
  return ProductRepository(productRepository);
});

final productsViewModelProvider =
    StateNotifierProvider<ProductsViewModel, AppState>(
  (ref) => ProductsViewModel(ref),
);

final addProductViewModelProvider =
    StateNotifierProvider<AddProductViewModel, AppState>(
  (ref) => AddProductViewModel(ref),
);
