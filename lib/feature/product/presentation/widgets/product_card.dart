import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/core.dart';


class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    required this.title,
    required this.subTitle,
    required this.imgUrl,
    required this.count,
    required this.price,
    required this.rating
  });
  final String title;
  final String subTitle;
  final String imgUrl;
  final num rating;
  final num price;
  final int count;


  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16).r),
      child: InkWell(
        onTap: () {},
        borderRadius: BorderRadius.circular(16).r,
        child: Padding(
          padding: EdgeInsets.symmetric(
              vertical: 16.h, horizontal: 16.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CachedNetworkImg(
                      imgUrl: imgUrl,
                      radius: 6.r,
                      width: 50.h,
                      height: 50.h),
                  SizedBox(width: 10.w),
                  Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppText.large(title,
                              maxLine: 1, align: TextAlign.start),
                          AppText.medium(subTitle,
                              maxLine: 1, align: TextAlign.start),
                        ],
                      ))
                ],
              ),
              SizedBox(height: 10.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppText.small('Count : $count'),
                  AppText.small('Rating : $rating'),
                  AppText.small('$price\$')
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}