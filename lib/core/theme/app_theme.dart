import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'app_color.dart';

class AppTheme {
  AppTheme._();
  static final ThemeData themeData = ThemeData(
    // fontFamily: GoogleFonts.quicksand().fontFamily,
    scaffoldBackgroundColor: AppColors.scaffoldBG,
    cardTheme: CardTheme(
      elevation: 0,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12).r),
    ),
    chipTheme: const ChipThemeData(
      selectedColor: AppColors.primary,
      disabledColor: Colors.white,
      secondaryLabelStyle: TextStyle(color: AppColors.primary),
      padding: EdgeInsets.zero,
      secondarySelectedColor: AppColors.primary,
      shape: StadiumBorder(),
      brightness: Brightness.dark,
      labelStyle: TextStyle(color: Colors.black),
      backgroundColor: Colors.white,
    ),
    appBarTheme: AppBarTheme(
        actionsIconTheme: IconThemeData(
          color: Colors.black,
          size: 20.h,
        ),
        elevation: 0,
        iconTheme: IconThemeData(
          color: Colors.black,
          size: 20.h,
        )),
    timePickerTheme: TimePickerThemeData(
      dayPeriodTextStyle: TextStyle(fontSize: 12.sp,),
    ),
    // datePickerTheme:  DatePickerThemeData(
    //   yearForegroundColor:MaterialStateProperty.resolveWith((states) => AppColors.black),
    // ),
    iconTheme: IconThemeData(color: AppColors.primary, size: 20.h),

    colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.solidPrimary,
        onSurface: Colors.black,
        primary: AppColors.solidPrimary),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      unselectedItemColor: AppColors.inactiveText,
      unselectedLabelStyle: TextStyle(color: AppColors.inactiveText,fontSize: 12.sp),
      selectedLabelStyle: TextStyle(fontSize: 12.sp,fontWeight: FontWeight.bold),
      selectedIconTheme: IconThemeData(color: AppColors.solidPrimary, size: 20.h),
      unselectedIconTheme: IconThemeData(color: AppColors.inactiveText, size: 18.h),
      backgroundColor: Colors.white,


    )
  );
}
