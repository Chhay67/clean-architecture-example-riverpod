import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    this.hintText,
    this.controller,
    this.initialValue,
    this.maxLine = 1,
    this.minLine = 1,
    this.isPassword = false,
    this.suffixIcon,
    this.validator,
    this.textInputType,
    this.paddingTop,
    this.paddingHorizontal,
    this.textInputAction,
    this.onTap,
    this.fillColor,
    this.readOnly = false,
    this.borderSide,
    this.focusNode,
    this.label,
    this.labelTrailing,
    this.customLabelTrailing,
    this.customLabel,
    this.prefixIcon,
    this.enableBorderSide,
    this.onChanged,
    this.paddingBottom,
    this.autoFocus = false,
    this.borderRadius,
    this.hintColor, this.contentPadding,
  });
  final String? hintText;
  final bool autoFocus;
  final Color? hintColor;
  final String? initialValue;
  final int maxLine;
  final int minLine;
  final bool isPassword;
  final Widget? suffixIcon;
  final String? label;
  final String? labelTrailing;
  final TextEditingController? controller;
  final TextInputType? textInputType;
  final String? Function(String? value)? validator;
  final double? paddingTop;
  final double? paddingBottom;
  final double? paddingHorizontal;
  final Function()? onTap;
  final TextInputAction? textInputAction;
  final Color? fillColor;
  final bool readOnly;
  final BorderSide? borderSide;
  final BorderSide? enableBorderSide;
  final FocusNode? focusNode;
  final Widget? customLabelTrailing;
  final Widget? customLabel;
  final Widget? prefixIcon;
  final double? borderRadius;
  final Function(String? value)? onChanged;
  final EdgeInsetsGeometry? contentPadding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: paddingTop ?? 16.h,
        right: paddingHorizontal ?? 12.w,
        left: paddingHorizontal ?? 12.w,
        bottom: paddingBottom ?? 0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (label != null) ...[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                    child: AppText.small(
                  label!,
                  color: AppColors.menuText,
                )),
                if (customLabelTrailing != null) customLabelTrailing!,
                if (labelTrailing != null && customLabelTrailing == null)
                  AppText.small(labelTrailing!,
                      color: AppColors.solidPrimary,
                      fontWeight: FontWeight.bold)
              ],
            ),
          ],
          if (customLabel != null) customLabel!,
          SizedBox(height: 4.h),
          TextFormField(
              autofocus: autoFocus,
              onChanged: onChanged,
              controller: controller,
              style: TextStyle(fontSize: 14.sp),
              obscureText: isPassword,
              decoration: InputDecoration(
                isDense: true,
                hintText: hintText,
                filled: true,
                errorStyle: TextStyle(fontSize: 12.sp, color: Colors.red),
                fillColor: fillColor ?? Colors.white,
                suffixIcon: suffixIcon,
                prefixIcon: prefixIcon,
                prefixIconConstraints: BoxConstraints(minWidth: 45.h),
                suffixIconConstraints: BoxConstraints(minWidth: 32.h),
                suffixIconColor: isPassword
                    ? AppColors.inactiveText
                    : AppColors.solidPrimary,
                hintStyle: TextStyle(
                    color: hintColor ?? AppColors.inactiveText,
                    fontSize: 14.sp),
                contentPadding: contentPadding ?? EdgeInsets.all(14.h),
                border: OutlineInputBorder(
                    borderSide: borderSide ?? BorderSide.none,
                    borderRadius: BorderRadius.all(
                        Radius.circular(borderRadius?.r ?? 8.r))),
                focusedBorder: OutlineInputBorder(
                  borderSide: enableBorderSide ??
                      BorderSide(width: 2.h, color: AppColors.solidPrimary),
                  borderRadius:
                      BorderRadius.all(Radius.circular(borderRadius?.r ?? 8.r)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius:
                      BorderRadius.all(Radius.circular(borderRadius?.r ?? 8.r)),
                ),
              ),
              cursorColor: AppColors.black,
              textInputAction: textInputAction ?? TextInputAction.next,
              maxLines: maxLine,
              minLines: minLine,
              validator: validator,
              keyboardType: textInputType,
              initialValue: initialValue,
              readOnly: readOnly,
              focusNode: focusNode,
              onTap: onTap),
        ],
      ),
    );
  }
}
