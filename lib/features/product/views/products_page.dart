import 'package:agile_crafts/features/product/widgets/product_card.dart';
import 'package:agile_crafts/main.data.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/routes/app_routes.dart';

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
          Navigator.of(context).pushNamed(AppRoutes.addProduct);
        },
        child: const Icon(Icons.add),
      ),
      body: const _ProductListWidget(),
    );
  }
}

class _ProductListWidget extends HookConsumerWidget {
  const _ProductListWidget();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.products.watchAll();

    if (state.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }
    if (state.hasException) {
      return Center(child: Text(state.exception.toString()));
    }
    return ListView.builder(
      itemCount: state.model.length,
      itemBuilder: (context, index) {
        return ProductCard(product: products[index]);
      },
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
