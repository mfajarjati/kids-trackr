import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:study/anak/latihan/bar_data.dart';

class MyBarGraph extends StatelessWidget {
  final List<int> absensi;

  const MyBarGraph({super.key, required this.absensi});

  @override
  Widget build(BuildContext context) {
    Bardata myBarData = Bardata(
      benar: absensi[0],
      salah: absensi[1],
      dilewat: absensi[2],
    );
    myBarData.intiatializeBarData();

    return RotatedBox(
      quarterTurns: 1,
      child: BarChart(
        swapAnimationCurve: Curves.linear,
        swapAnimationDuration: const Duration(milliseconds: 300),
        BarChartData(
          gridData: const FlGridData(show: false),
          maxY: 50,
          minY: 0,
          alignment: BarChartAlignment.spaceEvenly,
          barTouchData: BarTouchData(
              enabled: true,
              touchTooltipData: BarTouchTooltipData(
                  getTooltipColor: (groupData) => Colors.white.withOpacity(0.8),
                  rotateAngle: -90)),
          titlesData: const FlTitlesData(
            leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            bottomTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          ),
          borderData: FlBorderData(show: false),
          barGroups: [
            BarChartGroupData(
              showingTooltipIndicators: [0],
              x: 0,
              barRods: [
                BarChartRodData(
                  fromY: 0,
                  toY: myBarData.benar.toDouble(),
                  width: 25,
                  color: const Color.fromRGBO(60, 229, 117, 1),
                  backDrawRodData: BackgroundBarChartRodData(
                      show: true, toY: 50, color: Colors.white),
                  borderRadius: BorderRadius.circular(4),
                ),
              ],
            ),
            BarChartGroupData(
              showingTooltipIndicators: [0],
              x: 1,
              barRods: [
                BarChartRodData(
                  fromY: 0,
                  toY: myBarData.salah.toDouble(),
                  width: 25,
                  color: const Color.fromRGBO(73, 50, 255, 1),
                  backDrawRodData: BackgroundBarChartRodData(
                      show: true, toY: 50, color: Colors.white),
                  borderRadius: BorderRadius.circular(4),
                ),
              ],
            ),
            BarChartGroupData(
              showingTooltipIndicators: [0],
              x: 2,
              barRods: [
                BarChartRodData(
                  fromY: 0,
                  toY: myBarData.dilewat.toDouble(),
                  width: 25,
                  color: const Color.fromRGBO(255, 59, 51, 1),
                  backDrawRodData: BackgroundBarChartRodData(
                      show: true, toY: 50, color: Colors.white),
                  borderRadius: BorderRadius.circular(4),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
