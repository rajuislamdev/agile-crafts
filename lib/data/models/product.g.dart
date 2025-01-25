// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// RepositoryGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, duplicate_ignore

mixin $ProductLocalAdapter on LocalAdapter<Product> {
  static final Map<String, RelationshipMeta> _kProductRelationshipMetas = {};

  @override
  Map<String, RelationshipMeta> get relationshipMetas =>
      _kProductRelationshipMetas;

  @override
  Product deserialize(map) {
    map = transformDeserialize(map);
    return Product.fromJson(map);
  }

  @override
  Map<String, dynamic> serialize(model, {bool withRelationships = true}) {
    final map = model.toJson();
    return transformSerialize(map, withRelationships: withRelationships);
  }
}

final _productsFinders = <String, dynamic>{};

// ignore: must_be_immutable
class $ProductHiveLocalAdapter = HiveLocalAdapter<Product>
    with $ProductLocalAdapter;

class $ProductRemoteAdapter = RemoteAdapter<Product>
    with ProductFetchAdapter, ProductCreateAdapter;

final internalProductsRemoteAdapterProvider = Provider<RemoteAdapter<Product>>(
    (ref) => $ProductRemoteAdapter(
        $ProductHiveLocalAdapter(ref), InternalHolder(_productsFinders)));

final productsRepositoryProvider =
    Provider<Repository<Product>>((ref) => Repository<Product>(ref));

extension ProductDataRepositoryX on Repository<Product> {
  ProductFetchAdapter get productFetchAdapter =>
      remoteAdapter as ProductFetchAdapter;
  ProductCreateAdapter get productCreateAdapter =>
      remoteAdapter as ProductCreateAdapter;
}

extension ProductRelationshipGraphNodeX on RelationshipGraphNode<Product> {}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String,
      description: json['description'] as String,
      tenantId: (json['tenantId'] as num?)?.toInt(),
      isAvailable: json['isAvailable'] as bool,
    );

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'tenantId': instance.tenantId,
      'isAvailable': instance.isAvailable,
    };
