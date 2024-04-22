import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:study/menu/absensi/bar_data.dart';

class MyBarGraph extends StatelessWidget {
  final List<double> absensi;

  const MyBarGraph({super.key, required this.absensi});

  @override
  Widget build(BuildContext context) {
    Bardata myBarData = Bardata(
        hadir: absensi[0],
        sakit: absensi[1],
        izin: absensi[2],
        taker: absensi[3]);
    myBarData.intiatializeBarData();

    return RotatedBox(
      quarterTurns: 1,
      child: BarChart(
        swapAnimationCurve: Curves.linear,
        swapAnimationDuration: const Duration(seconds: 1),
        BarChartData(
          gridData: const FlGridData(show: false),
          maxY: 80,
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
              x: 0,
              barRods: [
                BarChartRodData(
                  fromY: 0,
                  toY: myBarData.hadir,
                  width: 25,
                  color: Colors.blue,
                  backDrawRodData: BackgroundBarChartRodData(
                      show: true, toY: 80, color: Colors.white),
                  borderRadius: BorderRadius.circular(4),
                ),
              ],
            ),
            BarChartGroupData(
              x: 1,
              barRods: [
                BarChartRodData(
                  fromY: 0,
                  toY: myBarData.sakit,
                  width: 25,
                  color: Colors.yellow,
                  backDrawRodData: BackgroundBarChartRodData(
                      show: true, toY: 80, color: Colors.white),
                  borderRadius: BorderRadius.circular(4),
                ),
              ],
            ),
            BarChartGroupData(
              x: 2,
              barRods: [
                BarChartRodData(
                  fromY: 0,
                  toY: myBarData.izin,
                  width: 25,
                  color: Colors.green,
                  backDrawRodData: BackgroundBarChartRodData(
                      show: true, toY: 80, color: Colors.white),
                  borderRadius: BorderRadius.circular(4),
                ),
              ],
            ),
            BarChartGroupData(
              x: 3,
              barRods: [
                BarChartRodData(
                  fromY: 0,
                  toY: myBarData.taker,
                  width: 25,
                  color: Colors.red,
                  backDrawRodData: BackgroundBarChartRodData(
                      show: true, toY: 80, color: Colors.white),
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
