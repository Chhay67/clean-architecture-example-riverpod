import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({
    super.key,
    this.height,
    this.width,
    this.strokeWidth,
    this.color,
    this.backgroundColor,
  });
  final double? width;
  final double? height;
  final Color? color;
  final Color? backgroundColor;
  final double? strokeWidth;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: height ?? 20.h,
        width: width ?? 20.h,
        child: CircularProgressIndicator(strokeWidth:strokeWidth ?? 2.h,color:  color,backgroundColor: backgroundColor));
  }
}
