
import 'package:evyx_test/core/resources_manager/color_manager.dart';
import 'package:evyx_test/core/resources_manager/style_manager.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class PiChartBuilder extends StatelessWidget {
  const PiChartBuilder({super.key, required this.title, required this.unanswered, required this.answered, required this.upperTitle});

  final String upperTitle;
  final String title;
  final double unanswered;
  final double answered;
  @override
  Widget build(BuildContext context) {
    return Column(
      children:
      [
        Text(
          upperTitle,
          style: StyleManager.medium.copyWith(
              fontSize: 16.0,
              color: ColorsManager.grey4
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 35,),
        SizedBox(
          height: 200,
          child: PieChart(
            PieChartData(
              sectionsSpace: 0,
              sections: [
                PieChartSectionData(
                    color: ColorsManager.brown,
                    value: answered,
                    title: '${answered.round()}% $title \nمجاب عليها',
                    radius: 100,
                    titleStyle: StyleManager.regular.copyWith(
                        fontSize: 12.0,
                        color: ColorsManager.white,
                        height: 1.2
                    )
                ),
                PieChartSectionData(
                    color: ColorsManager.blackBlue,
                    value: unanswered,
                    title: ' ${unanswered.round()}% $title\n غير مجاب عليها',
                    radius: 100,
                    titleStyle: StyleManager.regular.copyWith(
                        fontSize: 12.0,
                        color: ColorsManager.white,
                        height: 1.2
                    )
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}