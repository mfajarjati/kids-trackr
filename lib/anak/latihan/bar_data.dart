import 'package:study/anak/latihan/individual_bar.dart';

class Bardata {
  final int benar;
  final int salah;
  final int dilewat;

  Bardata({
    required this.benar,
    required this.salah,
    required this.dilewat,
  });

  List<IndividualBar> barData = [];

  void intiatializeBarData() {
    barData = [
      IndividualBar(x: 0, y: benar),
      IndividualBar(x: 1, y: salah),
      IndividualBar(x: 2, y: dilewat),
    ];
  }
}
