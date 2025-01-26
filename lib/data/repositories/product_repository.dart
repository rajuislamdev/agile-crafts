import 'package:agile_crafts/data/models/product.dart';
import 'package:agile_crafts/services/local_storage.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_data/flutter_data.dart';

import '../../core/errors/api_error_handler.dart';
import '../../core/errors/failure.dart';

class ProductRepository {
  final Repository<Product> productRepository;

  ProductRepository(this.productRepository);

  // Fetch products with correct endpoint (getProducts)
  Future<Either<Failure, List<Product>>> getProducts() async {
    try {
      // final localProducts = await productRepository.findAll();
      // if (localProducts.isNotEmpty) {
      //   return right(localProducts);
      // }

      final remoteProducts = await productRepository.findAll(
        headers: {
          'Content-Type': 'application/json',
          'Abp.TenantId': '10',
          'Authorization': 'Bearer ${LocalStorageService().getToken()}',
        },
        remote: true,
        syncLocal: true,
        onError: (e, label, adapter) {
          print(e);
          print(label);
          print(adapter);
          return [];
        },
      );
      return right(remoteProducts);
    } on DioException catch (dioError) {
      return left(ApiErrorHandler.handleDioError(error: dioError));
    } catch (error) {
      return left(Failure(message: 'An unexpected error occurred'));
    }
  }

  Future<Either<Failure, Product>> createProduct(Product product) async {
    try {
      final remoteProduct = await productRepository.save(product);
      return right(remoteProduct);
    } on DioException catch (dioError) {
      return left(ApiErrorHandler.handleDioError(error: dioError));
    } catch (error) {
      return left(Failure(message: 'An unexpected error occurred'));
    }
  }
}
