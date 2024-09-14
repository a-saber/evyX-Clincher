import 'package:evyx_test/core/resources_manager/color_manager.dart';
import 'package:flutter/material.dart';


class CustomProgressBar extends StatelessWidget {
  const CustomProgressBar({super.key, required this.progress});

  final double progress;
  @override
  Widget build(BuildContext context) {
    return LinearProgressIndicator(
      value: progress,
      color: ColorsManager.brown,
      backgroundColor: ColorsManager.grey5,
      borderRadius: BorderRadius.circular(30),
    );
  }
}
