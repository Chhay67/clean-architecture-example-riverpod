import 'package:clean_architecture_riverpod/core/enums/enums.dart';
import 'package:clean_architecture_riverpod/feature/product/presentation/providers/product_notifier/product_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/core.dart';

class ProductPage extends ConsumerWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final products = ref.watch(productProvider);
    return Scaffold(
      appBar: AppBar(
        title:  AppText.title('Products'),
        centerTitle: true,
      ),
      body: Builder(
        builder: (context) {
          if(products.refreshError){
            return AppText.medium(products.errorMsg);
          }else if(products.loadingState == LoadingState.progress){
            return const CircularProgressIndicator();
          }
          return ListView.builder(
            itemCount: products.products.length,

              itemBuilder: (context,index){
              return Container(
                child: AppText.medium('$index'),
              );
              }
          );
        }
      ),
    );
  }
}
