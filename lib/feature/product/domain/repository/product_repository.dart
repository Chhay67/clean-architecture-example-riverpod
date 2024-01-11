import '../entity/product.dart';

abstract class ProductRepository{
  Future<List<ProductEntity>> getAllProducts();
 }