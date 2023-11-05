import 'package:clean_architecture_riverpod/feature/product/data/models/product_model.dart';

abstract class ProductRepository{

  Future<List<ProductModel>> getAllProducts();
 }