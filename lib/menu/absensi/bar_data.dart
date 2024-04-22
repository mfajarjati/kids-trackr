import 'package:study/menu/absensi/individual_bar.dart';

class Bardata {
  final double hadir;
  final double sakit;
  final double izin;
  final double taker;

  Bardata(
      {required this.hadir,
      required this.sakit,
      required this.izin,
      required this.taker});

  List<IndividualBar> barData = [];

  void intiatializeBarData() {
    barData = [
      IndividualBar(x: 0, y: hadir),
      IndividualBar(x: 1, y: sakit),
      IndividualBar(x: 2, y: izin),
      IndividualBar(x: 3, y: taker)
    ];
  }
}
