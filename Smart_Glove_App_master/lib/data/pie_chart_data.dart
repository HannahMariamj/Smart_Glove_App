import 'package:fitness_dashboard_ui/const/constant.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class ChartData {
  final paiChartSelectionDatas = [
    PieChartSectionData(
      color: primaryColor,
      value: 105,
      showTitle: false,
      radius: 25,
    ),
  
    PieChartSectionData(
      color: const Color(0xFFEE2727),
      value: 40,
      showTitle: false,
      radius: 20,
    ),
    PieChartSectionData(
      color: primaryColor.withOpacity(0.1),
      value: 25,
      showTitle: false,
      radius: 13,
    ),
  ];
}
