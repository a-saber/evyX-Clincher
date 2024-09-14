import 'package:evyx_test/core/resources_manager/color_manager.dart';
import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return const Divider(color: ColorsManager.greyWhite, thickness: 1.0, height: 1,);
  }
}