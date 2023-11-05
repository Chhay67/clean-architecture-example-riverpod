import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core.dart';

class ImageProfile extends StatelessWidget {
  const ImageProfile({super.key,required this.imgUrl,this.width,this.height,this.radius});
  final String imgUrl;
  final double? width;
  final double? height;
  final double? radius;
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      width: width ?? 32.h,
      height: height ?? 32.h,
      imageUrl: imgUrl,
      imageBuilder: (context, imageProvider) => CircleAvatar(
        backgroundColor: Colors.white.withOpacity(0),
        radius: radius ?? 16.h,
        backgroundImage: imageProvider,
      ),
      placeholder: (context, url) {
        return SizedBox(
            height: width ?? 32.h,
            width: height ?? 32.h,
            child: Center(
                child: SizedBox(
                    height: 12.h,
                    width: 12.h,
                    child: const CircularProgressIndicator.adaptive(
                      valueColor:
                      AlwaysStoppedAnimation<Color>(AppColors.primary),
                      strokeWidth: 1,
                    ))));
      },
      errorWidget: (context, url, error) {
        return Container(
          width: width ?? 32.h,
          height: height ?? 32.h,
          decoration: BoxDecoration(
              image: const DecorationImage(
                  image: AssetImage(AppImg.exampleImg)),
              borderRadius: BorderRadius.circular(radius ?? 16.h),
              color: Colors.white.withOpacity(0)),
        );
      },
    );
  }
}