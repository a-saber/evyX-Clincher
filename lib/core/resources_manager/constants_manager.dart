
import 'package:evyx_test/core/resources_manager/style_manager.dart';
import 'package:flutter/material.dart';
import 'color_manager.dart';

abstract class ConstantsManager
{
  static const String appTitle = 'evyX Clincher';
  static const String fontFamily = 'Tajawal';

}

class ThemeManager
{
  static ThemeData theme = ThemeData(
      fontFamily: ConstantsManager.fontFamily,
      useMaterial3: true,
      appBarTheme:
      AppBarTheme(
        backgroundColor: ColorsManager.white,
        centerTitle: true,
        titleTextStyle: StyleManager.bold.copyWith(
          fontFamily: ConstantsManager.fontFamily,
          fontSize: 16.0,
          color: ColorsManager.black1
        ),
      ),
      scaffoldBackgroundColor: ColorsManager.white
  );
}
