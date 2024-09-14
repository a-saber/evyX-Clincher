import 'package:evyx_test/core/resources_manager/color_manager.dart';
import 'package:evyx_test/core/resources_manager/style_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ActionBuilder extends StatelessWidget {
  const ActionBuilder({super.key, required this.assetName, required this.text});

  final String? assetName;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24.0),
      child: Row(
        children:
        [
          Builder(
              builder: (context) {
                if(assetName != null) {
                  return SvgPicture.asset(
                    assetName!,
                    width: 40,
                    height: 40,
                    color: ColorsManager.brown,
                  );
                } else {
                  return const SizedBox(
                    width: 40,
                    height: 40,
                  );
                }
              }
          ),
          const SizedBox(width: 32.0,),
          Text(
            text,
            style: StyleManager.bold.copyWith(
                fontSize: 20.0,
                color: ColorsManager.blackOpacity42
            ),
          ),
        ],
      ),
    );
  }
}