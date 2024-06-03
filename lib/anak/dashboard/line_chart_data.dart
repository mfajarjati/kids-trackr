import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

// line_chart_data.dart
// line_chart_data.dart
List<LineChartBarData> createLineChartBarData(
    List<double> input, List<double> inputSecond) {
  return [
    LineChartBarData(
      color: const Color.fromRGBO(60, 229, 117, 1),
      isCurved: true,
      spots: List.generate(input.length,
          (index) => FlSpot((index + 1).toDouble(), input[index])),
      barWidth: 4,
      belowBarData: BarAreaData(show: false),
      dotData: FlDotData(show: false),
    ),
    LineChartBarData(
      color: const Color.fromRGBO(255, 59, 51, 1),
      isCurved: true,
      spots: List.generate(inputSecond.length,
          (index) => FlSpot((index + 1).toDouble(), inputSecond[index])),
      barWidth: 4,
      belowBarData: BarAreaData(show: false),
      dotData: FlDotData(show: false),
    ),
  ];
}
