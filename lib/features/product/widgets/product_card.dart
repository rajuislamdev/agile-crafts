import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final Map product;

  const ProductCard({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey, // Border color
          width: 1.0, // Border width
        ),
        borderRadius: BorderRadius.circular(8), // Rounded corners
      ),
      child: ListTile(
        leading: CircleAvatar(
          child: Center(
            child: Text(product['tenantId'].toString()),
          ),
        ),
        title: Text(product['name']),
        subtitle: Text(product['description']),
      ),
    );
  }
}
