import 'package:clean_architecture_riverpod/feature/product/data/data_source/remote.dart';
import 'package:clean_architecture_riverpod/feature/product/data/models/product_model.dart';
import 'package:clean_architecture_riverpod/feature/product/domain/repository/product_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../../core/exceptions/http_exception.dart';

class ProductRepositoryImpl implements ProductRepository {
  ProductRepositoryImpl(this.productApiService);
  final ProductApiService productApiService;

  @override
  Future<List<ProductModel>> getAllProducts() {
    return productApiService.getAllProducts();
  }
}
