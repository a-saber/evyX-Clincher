import 'package:evyx_test/core/resources_manager/color_manager.dart';
import 'package:evyx_test/core/resources_manager/style_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class NoIconAboveProgressBuilder extends StatelessWidget {
  const NoIconAboveProgressBuilder({super.key, required this.count, required this.assetName, required this.isPNG});

  final int count;
  final String assetName;
  final bool isPNG;
  @override
  Widget build(BuildContext context) {
    return Row(
      children:
      [
        Text(
          '$count',
          style: StyleManager.regular.copyWith(
              fontSize: 14.0,
              color: ColorsManager.black2
          ),
        ),
        const SizedBox(width: 5,),
        isPNG?
        Image.asset(assetName)
            :
        SvgPicture.asset(assetName),
      ],
    );
  }
}