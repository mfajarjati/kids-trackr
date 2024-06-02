import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:study/menu/penilaian/line_chart_data.dart';

class LineChartContent extends StatelessWidget {
  final List<double> input;

  const LineChartContent({super.key, required this.input});

  @override
  Widget build(BuildContext context) {
    return LineChart(
      LineChartData(
        lineTouchData: LineTouchData(
          getTouchedSpotIndicator: (barData, spotIndexes) {
            return spotIndexes.map((index) {
              return TouchedSpotIndicatorData(
                FlLine(color: Color.fromRGBO(109, 93, 110, 1), strokeWidth: 2),
                FlDotData(show: true),
              );
            }).toList();
          },
          touchTooltipData: LineTouchTooltipData(
            getTooltipColor: (LineBarSpot touchedBarSpot) {
              if (touchedBarSpot.y > 80) {
                return Colors.greenAccent;
              } else if (touchedBarSpot.y > 50) {
                return Colors.orangeAccent;
              } else {
                return Colors.redAccent;
              }
            },
            getTooltipItems: (touchedSpots) {
              return touchedSpots.map((touchedSpot) {
                return LineTooltipItem(
                  '${touchedSpot.y}',
                  const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                );
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
        gridData: FlGridData(
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
                    text = 'Tugas 1';
                    break;
                  case 2:
                    text = 'Tugas 2';
                    break;
                  case 3:
                    text = 'Tugas 3';
                    break;
                  case 4:
                    text = 'UTS';
                    break;
                  case 5:
                    text = 'Tugas 4';
                    break;
                  case 6:
                    text = 'Tugas 5';
                    break;
                  case 7:
                    text = 'Quiz';
                    break;
                  case 8:
                    text = 'UAS';
                    break;
                  default:
                    text = '';
                    break;
                }
                return SideTitleWidget(
                  angle: -0.5,
                  child: Text(
                    text,
                    style: TextStyle(
                      color: const Color.fromARGB(255, 0, 0, 0),
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
              interval: 20,
              getTitlesWidget: (value, meta) {
                return Text(
                  value.toInt().toString(),
                  style: TextStyle(
                    color: const Color.fromARGB(255, 0, 0, 0),
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                );
              },
            ),
          ),
          topTitles: AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          rightTitles: AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
        ),
        minX: 1,
        maxX: 8,
        minY: 0,
        maxY: 100,
        lineBarsData: createLineChartBarData(input),
      ),
    );
  }
}
