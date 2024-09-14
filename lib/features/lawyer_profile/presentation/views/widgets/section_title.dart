
import 'package:evyx_test/core/resources_manager/color_manager.dart';
import 'package:evyx_test/core/resources_manager/style_manager.dart';
import 'package:flutter/material.dart';

class SectionTitle extends StatelessWidget {
  const SectionTitle({super.key, required this.text, required this.fontSize, this.widget});

  final String text;
  final double fontSize;
  final Widget? widget;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 88,
      width: double.infinity,
      color: ColorsManager.whiteGrey,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment:  MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  text,
                  style: StyleManager.bold.copyWith(
                    fontSize: fontSize,
                  ),
                ),
              ),
              if(widget != null)
                widget!,
            ],
          ),
        ],
      ),
    );
  }
}