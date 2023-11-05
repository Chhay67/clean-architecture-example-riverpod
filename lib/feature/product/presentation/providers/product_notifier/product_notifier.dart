import 'package:clean_architecture_riverpod/feature/product/presentation/providers/product_notifier/product_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../core/core.dart';
import '../../../domain/usecase/module.dart';


final productProvider = AutoDisposeNotifierProvider<ProductNotifier,ProductState>(() => ProductNotifier());


class ProductNotifier extends AutoDisposeNotifier<ProductState>{
  @override
  ProductState build() {
    getAllProducts();
    return ProductState();
  }

  Future<void> getAllProducts() async{
    try{
      final response = await ref.read(getProductUseCaseProvider).execute();
      state = state.copyWith(
        products: [...state.products,...response],
        loadingState: LoadingState.success
      );
    }catch(error){
      state = state.copyWith(loadingState: LoadingState.error,errorMsg: error.toString());
      printMe('get product error => $error');
    }finally{
      printMe('Products length :${state.products.length}');
    }
  }

}