import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

List<Color> lineColor = [
  const Color(0xfff3f169),
];

List<LineChartBarData> createLineChartBarData(List<double> input) {
  return [
    LineChartBarData(
      color: Color.fromRGBO(109, 93, 110, 1),
      isCurved: true,
      spots: List.generate(input.length,
          (index) => FlSpot((index + 1).toDouble(), input[index])),
    ),
  ];
}
