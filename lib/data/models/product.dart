import 'package:agile_crafts/data/adapters/product_adapter.dart';
import 'package:flutter_data/flutter_data.dart';
import 'package:json_annotation/json_annotation.dart';

part 'product.g.dart';

@JsonSerializable()
@DataRepository(
    [FetchProductAdapter, AddProductAdapter]) // Use custom adapter for product
class Product extends DataModel<Product> {
  @override
  final int? id;
  final String name;
  final String description;
  final int? tenantId;
  final bool isAvailable;

  Product({
    this.id,
    required this.name,
    required this.description,
    required this.tenantId,
    required this.isAvailable,
  });

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);

  Map<String, dynamic> toJson() => _$ProductToJson(this);
}
