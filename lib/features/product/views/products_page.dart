import 'package:agile_crafts/core/utils/app_colors.dart';
import 'package:agile_crafts/features/product/widgets/product_card.dart';
import 'package:flutter/material.dart';

import '../widgets/add_product_bottom_sheet.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
        centerTitle: false,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showBottomSheet(context),
        child: const Icon(Icons.add),
      ),
      body: const _ProductListWidget(),
    );
  }

  Future<dynamic> _showBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: AppColors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      builder: (context) => AddProductBottomSheet(),
    );
  }
}

class _ProductListWidget extends StatelessWidget {
  const _ProductListWidget();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: products.length,
      itemBuilder: (context, index) {
        return ProductCard(
          product: products[index],
        );
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
