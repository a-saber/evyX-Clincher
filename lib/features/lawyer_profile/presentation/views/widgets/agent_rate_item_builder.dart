import 'package:evyx_test/core/resources_manager/assets_manager.dart';
import 'package:evyx_test/core/resources_manager/color_manager.dart';
import 'package:evyx_test/core/resources_manager/style_manager.dart';
import 'package:evyx_test/features/lawyer_profile/data/model/get_lawyer_response_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'custom_divider.dart';
import 'rate_stars_builder.dart';

class AgentRateItemBuilder extends StatelessWidget {
  const AgentRateItemBuilder({super.key, required this.review,});

  final Reviews review;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: Column(
        children:
        [
          Row(
              children:
              [
                SvgPicture.asset(AssetsManager.buildings),
                const SizedBox(width: 5,),
                Text(
                  review.name ?? '',
                  style: StyleManager.bold.copyWith(
                      fontSize: 20.0,
                      color: ColorsManager.black2,
                      height: 1.2
                  ),
                ),
                const Spacer(),

                RateStarsBuilder(rate: review.rate??0.0),
              ]
          ),
          const SizedBox(height: 15.0,),
          Text(
            review.comment ?? '',
            style: StyleManager.bold.copyWith(
                fontSize: 16.0,
                color: ColorsManager.grey4
            ),),

          const SizedBox(height: 10.0,),
          const CustomDivider(),

        ],
      ),
    );
  }
}