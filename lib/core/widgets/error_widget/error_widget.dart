import 'package:flutter/material.dart';
import '../../core.dart';


class OnErrorWidget extends StatelessWidget {
  const OnErrorWidget({super.key, required this.error, required this.onTap});
  final String error;
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AppText.medium(
            error,
            color: AppColors.black,
          ),

          OutlinedButton(
              onPressed: onTap, child: AppText.small('Try again.'))

        ],
      ),
    );
  }
}

