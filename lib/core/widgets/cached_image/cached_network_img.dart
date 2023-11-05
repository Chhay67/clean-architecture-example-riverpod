import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core.dart';


class CachedNetworkImg extends StatelessWidget {
  const CachedNetworkImg({super.key,required this.imgUrl,this.width,this.height,this.radius,this.defaultImg,this.padding,this.defaultImgColor});
  final String imgUrl;
  final double? width;
  final double? height;
  final double? radius;
  final EdgeInsets? padding;
  final String? defaultImg;
  final Color? defaultImgColor;
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      width: width ?? 32.h,
      height: height ?? 32.h,
      imageUrl: imgUrl,
      imageBuilder: (context, imageProvider) => Container(
        height: width ?? 32.h,
        width: height ?? 32.h,
        padding: padding,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius ?? 5.h),
          image: DecorationImage(image: imageProvider,fit: BoxFit.cover),
        ),
      ),
      placeholder: (context, url) {
        return SizedBox(
            height: width ?? 32.h,
            width: height ?? 32.h,
            child: Center(
                child: SizedBox(
                    height: 12.h,
                    width: 12.h,
                    child: CircularProgressIndicator.adaptive(
                      valueColor: const AlwaysStoppedAnimation<Color>(AppColors.primary),
                      strokeWidth: 1.h,
                    ))));
      },

      errorWidget: (context, url, error) {
        return  Container(
              width: width ?? 32.h,
              height: height ?? 32.h,
              padding: padding ?? EdgeInsets.zero,
              decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage(defaultImg ?? AppImg.exampleImg),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(radius ?? 5.h),
                  color:defaultImgColor ?? Colors.white),
        );
      },
    );
  }
}