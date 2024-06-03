import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:study/anak/dashboard/line_chart_data.dart';

// line_chart.dart
// line_chart.dart
class LineChartContent extends StatelessWidget {
  final List<double> input;
  final List<double> inputSecond;

  const LineChartContent(
      {super.key, required this.input, required this.inputSecond});

  @override
  Widget build(BuildContext context) {
    return LineChart(
      LineChartData(
        lineTouchData: LineTouchData(
          getTouchedSpotIndicator: (barData, spotIndexes) {
            return spotIndexes.map((index) {
              return TouchedSpotIndicatorData(
                FlLine(color: barData.color, strokeWidth: 2),
                FlDotData(show: true),
              );
            }).toList();
          },
          touchTooltipData: LineTouchTooltipData(
            getTooltipItems: (touchedSpots) {
              return touchedSpots.map((touchedSpot) {
                final textStyle = TextStyle(
                  color: touchedSpot.bar.color ==
                          const Color.fromRGBO(109, 93, 110, 1)
                      ? Colors.white
                      : Colors.yellow,
                  fontWeight: FontWeight.bold,
                );
                return LineTooltipItem('${touchedSpot.y}', textStyle);
              }).toList();
            },
          ),
        ),
        borderData: FlBorderData(
          border: Border.all(
            color: const Color.fromARGB(255, 97, 94, 94),
            width: 0.5,
          ),
        ),
        gridData: const FlGridData(
          drawHorizontalLine: false,
        ),
        titlesData: FlTitlesData(
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              getTitlesWidget: (value, meta) {
                String text;
                switch (value.toInt()) {
                  case 1:
                    text = 'Level 1';
                    break;
                  case 2:
                    text = 'Level 2';
                    break;
                  case 3:
                    text = 'Level 3';
                    break;
                  case 4:
                    text = 'Level 4';
                    break;
                  case 5:
                    text = 'Level 5';
                    break;
                  case 6:
                    text = 'Level 6';
                    break;

                  default:
                    text = '';
                    break;
                }
                return SideTitleWidget(
                  angle: -0.5,
                  child: Text(
                    text,
                    style: const TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontSize: 9,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  axisSide: meta.axisSide,
                );
              },
            ),
          ),
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              interval: 2,
              getTitlesWidget: (value, meta) {
                return Text(
                  value.toInt().toString(),
                  style: const TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                );
              },
            ),
          ),
          topTitles: const AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          rightTitles: const AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
        ),
        minX: 1,
        maxX: 6,
        minY: 0,
        maxY: 10,
        lineBarsData: createLineChartBarData(input, inputSecond),
      ),
    );
  }
}
