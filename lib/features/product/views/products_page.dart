import 'package:agile_crafts/core/utils/app_colors.dart';
import 'package:agile_crafts/features/product/provider/providers.dart';
import 'package:agile_crafts/features/product/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../widgets/add_product_bottom_sheet.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Products'),
        centerTitle: false,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showBottomSheet(context);
        },
        child: const Icon(Icons.add),
      ),
      body: const _ProductListWidget(),
    );
  }

  _showBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      backgroundColor: AppColors.white,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      builder: (context) => DraggableScrollableSheet(
        expand: false,
        builder: (_, controller) => SingleChildScrollView(
          controller: controller,
          child: AddProductBottomSheet(),
        ),
      ),
    );
  }
}

class _ProductListWidget extends ConsumerWidget {
  const _ProductListWidget();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productsState = ref.watch(productsViewModelProvider);
    return productsState.when(
      initial: () => const Center(child: CircularProgressIndicator()),
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (failure) => Center(child: Text(failure.message)),
      success: (products) => ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          return ProductCard(
            product: products[index],
          );
        },
      ),
    );
  }
}

final List<Map> products = [
  {
    "tenantId": 10,
    "name": "Product 01",
    "description": "Product 01 description",
    "isAvailable": false,
    "id": 22
  },
  {
    "tenantId": 10,
    "name": "Product 02",
    "description": "Product 02 description",
    "isAvailable": true,
    "id": 23
  },
  {
    "tenantId": 10,
    "name": "Product 03",
    "description": "Product 03 description",
    "isAvailable": true,
    "id": 24
  },
  {
    "tenantId": 10,
    "name": "Product 04",
    "description": "Product 04 description",
    "isAvailable": true,
    "id": 25
  }
];
