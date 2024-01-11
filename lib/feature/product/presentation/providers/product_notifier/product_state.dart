import 'package:clean_architecture_riverpod/feature/product/domain/entity/product.dart';

import '../../../../../core/enums/enums.dart';
import '../../../data/models/product_model.dart';
abstract class ProductState {
  const ProductState();
}


class FailureProductState extends ProductState{
  String errorMessage;
  FailureProductState({required this.errorMessage});
}

class LoadingProductState extends ProductState{}

class SuccessProductState extends ProductState{
  final List<ProductEntity> products;

  SuccessProductState({
    this.products = const [],
});

  SuccessProductState copyWith({
    List<ProductEntity>? products,
  }){
    return SuccessProductState(
        products: products ?? this.products,
    );
  }
}

