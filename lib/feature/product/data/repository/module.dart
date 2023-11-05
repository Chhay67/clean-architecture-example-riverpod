import 'package:clean_architecture_riverpod/feature/product/data/repository/product_repository_impl.dart';
import 'package:clean_architecture_riverpod/feature/product/domain/repository/product_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data_source/module.dart';

final productRepoProvider = Provider<ProductRepository>((ref) {
  final productApiService = ref.read(productApiServiceProvider);
  return ProductRepositoryImpl(productApiService);
});
