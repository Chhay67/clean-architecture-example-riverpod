import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../theme/app_color.dart';
import 'circular_progress_indicator.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children:  [
          LoadingIndicator(color: Colors.red)
        ],
      ),
    );
  }
}


