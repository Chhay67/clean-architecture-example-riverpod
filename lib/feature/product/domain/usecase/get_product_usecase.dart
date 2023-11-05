
import 'package:clean_architecture_riverpod/core/core.dart';
import 'package:clean_architecture_riverpod/feature/product/data/models/product_model.dart';
import 'package:clean_architecture_riverpod/feature/product/domain/repository/product_repository.dart';

class GetAllProductUseCase extends UseCase{

  final ProductRepository _productRepository;
  GetAllProductUseCase(this._productRepository);

  @override
  Future<List<ProductModel>> execute({void params}) {
   return _productRepository.getAllProducts();
  }

}