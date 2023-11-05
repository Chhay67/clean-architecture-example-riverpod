import 'package:clean_architecture_riverpod/core/core.dart';
import 'package:clean_architecture_riverpod/feature/product/data/models/product_model.dart';

abstract class ProductApiService{
  Future<List<ProductModel>> getAllProducts();
}

class ProductApiServiceImpl extends ProductApiService{
  final BaseApiService baseApiService;
  ProductApiServiceImpl(this.baseApiService);

  static const String products = "/products";

  @override
  Future<List<ProductModel>> getAllProducts() async{
    return baseApiService.onRequest(
        path: products,
        method: HttpMethod.GET,
        onSuccess: (response){
          return List.from(response.data.map((e) => ProductModel.fromJson(e)).toList());
        });
  }
}