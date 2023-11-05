import 'package:clean_architecture_riverpod/feature/product/data/repository/module.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/usecases/usecase.dart';
import 'get_product_usecase.dart';

final getProductUseCaseProvider = Provider<UseCase>((ref) {
  final productRepo = ref.read(productRepoProvider);
  return GetAllProductUseCase(productRepo);
});
