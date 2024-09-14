import 'package:evyx_test/core/resources_manager/assets_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class RateStarsBuilder extends StatelessWidget {
  const RateStarsBuilder({super.key, required this.rate});

  final double rate ;
  @override
  Widget build(BuildContext context) {

    int fullStars = rate.floor();
    bool hasHalfStar = (rate - fullStars) >= 0.5;
    int emptyStars = 5 - fullStars - (hasHalfStar ? 1 : 0);

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [

        // Empty stars
        for (int i = 0; i < emptyStars; i++)
          Image.asset(AssetsManager.starEmpty),

        // Half star
        if (hasHalfStar)
          Image.asset(AssetsManager.halfStar),

        // Full stars
        for (int i = 0; i < fullStars; i++)
          SvgPicture.asset(AssetsManager.star),

      ],
    );
  }
}