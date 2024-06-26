import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChartContainer extends StatelessWidget {
  final Color color;

  final Widget chart;

  const ChartContainer({
    super.key,
    required this.color,
    required this.chart,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.95,
        height: MediaQuery.of(context).size.width * 0.95 * 0.65,
        padding: EdgeInsets.fromLTRB(0, 10, 20, 10),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
                child: Container(
              padding: EdgeInsets.all(10),
              child: chart,
            ))
          ],
        ),
      ),
    );
  }
}
