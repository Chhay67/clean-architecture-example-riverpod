import '../../../../../core/enums/enums.dart';
import '../../../data/models/product_model.dart';
// abstract class ProductState {}


class ProductState {

  final List<ProductModel> products;
  final LoadingState loadingState;
  final String errorMsg;
  bool get refreshError => errorMsg != '';

  ProductState({
    this.products = const [],
    this.loadingState = LoadingState.progress,
    this.errorMsg = '',
});

  ProductState copyWith({
    List<ProductModel>? products,
    LoadingState? loadingState,
    String? errorMsg,
}){
    return ProductState(
      products: products ?? this.products,
      loadingState: loadingState ?? this.loadingState,
      errorMsg: errorMsg ?? this.errorMsg
    );
  }
}