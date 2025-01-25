import 'package:flutter_data/flutter_data.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_model.g.dart';

@JsonSerializable()
@DataRepository([])
class Product extends DataModel<Product> {
  final int tenantId;
  final String name;
  final String description;
  final bool isAvailable;
  @override
  final int id;

  Product({
    required this.tenantId,
    required this.name,
    required this.description,
    required this.isAvailable,
    required this.id,
  });
}
