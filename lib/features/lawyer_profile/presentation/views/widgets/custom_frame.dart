import 'package:evyx_test/core/resources_manager/color_manager.dart';
import 'package:flutter/material.dart';

class CustomFrame extends StatelessWidget {
  const CustomFrame({super.key, required this.child});

  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 15.0),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white, // Set the background color of the container
          boxShadow: [
            BoxShadow(
              color: ColorsManager.blackOpacity10, // Shadow color and opacity
              spreadRadius: 0,
              blurRadius: 4,
              offset: const Offset(0, 0),
            ),
          ],
        ),
        child: child
    );
  }
}