import 'package:evyx_test/core/resources_manager/assets_manager.dart';
import 'package:evyx_test/core/resources_manager/color_manager.dart';
import 'package:evyx_test/core/resources_manager/style_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ActivityChartNo extends StatelessWidget {
  const ActivityChartNo({super.key, required this.count});

  final int count ;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        SvgPicture.asset(AssetsManager.chart),
        const SizedBox(width: 5,),
        Text(
          '$count',
          style: StyleManager.extraBold.copyWith(
              fontSize: 14.0,
              color: ColorsManager.blackOpacity42,
              height: 0.8
          ),
        ),
      ],
    );
  }
}