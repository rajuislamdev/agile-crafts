import 'package:agile_crafts/data/models/product.dart';
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
      final localProducts = await productRepository.findAll();
      if (localProducts.isNotEmpty) {
        return right(localProducts);
      }

      final remoteProducts = await productRepository.findAll(
        remote: true,
        syncLocal: true,
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
