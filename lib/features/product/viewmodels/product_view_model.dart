import 'package:agile_crafts/core/state/app_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../data/models/product.dart';
import '../provider/providers.dart';

class ProductsViewModel extends StateNotifier<AppState<List<Product>>> {
  final Ref ref;

  ProductsViewModel(this.ref) : super(const AppState.initial()) {
    getProducts();
  }

  Future<void> getProducts() async {
    state = const AppState.loading();
    final productRepository = ref.read(productRepoProvider);
    final result = await productRepository.getProducts();
    state = result.fold(
      (failure) => AppState.error(failure),
      (products) => AppState.success(products),
    );
  }
}

class AddProductViewModel extends StateNotifier<AppState<Product>> {
  final Ref ref;

  AddProductViewModel(this.ref) : super(const AppState.initial());

  Future<void> addProduct({required Product product}) async {
    state = const AppState.loading();
    final productRepository = ref.read(productRepoProvider);
    final result = await productRepository.createProduct(product);
    state = result.fold(
      (failure) => AppState.error(failure),
      (product) => AppState.success(product),
    );
  }
}
