import 'package:evyx_test/core/resources_manager/style_manager.dart';
import 'package:flutter/material.dart';

class ChartKeyBuilder extends StatelessWidget {
  const ChartKeyBuilder({super.key, required this.text, required this.color});

  final String text;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Row(
      children:
      [
        Text(
          text,
          style: StyleManager.regular.copyWith(
            fontSize: 12.0,
          ),
        ),
        const SizedBox(width: 5,),
        Container(
          margin: const EdgeInsets.only(top: 5.0),
          height: 14.13,
          width: 8.59,
          color: color,
        )
      ],
    );
  }
}