
import 'package:clean_architecture_riverpod/core/core.dart';
import 'package:clean_architecture_riverpod/feature/product/domain/repository/product_repository.dart';
import 'package:dartz/dartz.dart';

import '../entity/product.dart';

class GetAllProductUseCase extends UseCase{

  final ProductRepository _productRepository;
  GetAllProductUseCase(this._productRepository);

  @override
  Future<List<ProductEntity>> execute({void params}) {
   return _productRepository.getAllProducts();
  }

}