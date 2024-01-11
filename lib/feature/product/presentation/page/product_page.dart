import 'package:clean_architecture_riverpod/core/widgets/custom_app_bar/custom_appbar.dart';
import 'package:clean_architecture_riverpod/feature/product/presentation/providers/product_notifier/product_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/core.dart';
import '../providers/product_notifier/product_state.dart';
import '../widgets/product_card.dart';

class ProductPage extends ConsumerWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final products = ref.watch(productProvider);
    return Scaffold(
      appBar:const MyAppBar(title: 'Products',backgroundColor: AppColors.solidPrimary),
      body: Builder(builder: (context) {
        printMe('first $products');
        if (products is LoadingProductState) {
          printMe('LoadingProductState');
          return const LoadingWidget();
        }
        if (products is FailureProductState) {
          printMe('FailureProductState');
          return OnErrorWidget(error: products.errorMessage, onTap: (){
            ref.invalidate(productProvider);
          });
        }
        if(products is SuccessProductState ) {
            printMe('SuccessProductState');
            return RefreshIndicator(
              onRefresh: () async {
                ref.invalidate(productProvider);
              },
              child: ListView.separated(
                  itemCount: products.products.length,
                  separatorBuilder: (context, index) => SizedBox(height: 10.h),
                  padding: EdgeInsets.symmetric(horizontal: 12.w),
                  itemBuilder: (context, index) {
                    final product = products.products[index];
                    return ProductCard(
                      title:product.title,
                      subTitle: product.description,
                      imgUrl: product.image,
                      price: product.price,
                      rating: product.rating.rate,
                      count: product.rating.count,
                    );
                  }),
            );
          }
        return Container();

      }),
    );
  }
}


