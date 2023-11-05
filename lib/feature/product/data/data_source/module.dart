import 'package:clean_architecture_riverpod/core/core.dart';
import 'package:clean_architecture_riverpod/feature/product/data/data_source/remote.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final productApiServiceProvider = Provider<ProductApiService>((ref) {
  final baseApiService = ref.read(baseApiServiceProvider);
  return ProductApiServiceImpl(baseApiService);
});
