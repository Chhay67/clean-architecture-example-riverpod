import 'package:clean_architecture_riverpod/feature/product/presentation/providers/product_notifier/product_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../core/core.dart';
import '../../../domain/usecase/module.dart';

final productProvider =
    AutoDisposeNotifierProvider<ProductNotifier, ProductState>(
        () => ProductNotifier());

class ProductNotifier extends AutoDisposeNotifier<ProductState> {
  @override
  ProductState build() {
    getAllProducts();
    return LoadingProductState();
  }

  Future<void> getAllProducts() async {
    try {
      final response = await ref.read(getProductUseCaseProvider).execute();
      state = SuccessProductState(products: response);
    } catch (error) {
      state = FailureProductState(errorMessage: error.toString());
    }
  }
}
