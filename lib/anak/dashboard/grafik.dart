import 'dart:async';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:study/anak/dashboard/chart_container.dart';
import 'package:study/anak/dashboard/line_chart.dart';
import 'package:sizer/sizer.dart';
import 'package:tflite_flutter/tflite_flutter.dart';

class Grafik extends StatefulWidget {
  static String routeName = 'Grafik';

  const Grafik({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _GrafikState createState() => _GrafikState();
}

class _GrafikState extends State<Grafik> {
  late Interpreter _interpreter;
  String _kesimpulan = 'Sedang memuat refleksi...';
  final List<double> _input = [
    5.0,
    6.0,
    7.0,
    8.0,
    9.0,
    10.0,
  ];
  final List<double> _inputSecond = [5.0, 4.0, 3.0, 2.0, 1.0, 0.0];

  static const int _expectedInputLength =
      6; // Panjang input yang diharapkan oleh model

  @override
  void initState() {
    super.initState();
    _loadModel();
    Timer(const Duration(milliseconds: 300), () {
      if (mounted) {
        setState(() {});
      }
    });
  }

  Future<void> _loadModel() async {
    try {
      _interpreter = await Interpreter.fromAsset('assets/model2.tflite');
      _predict();
    } catch (e) {
      // ignore: avoid_print
      print('Failed to load model.');
    }
  }

  void _predict() async {
    List<double> input = List.from(_input);
    List<double> inputSecond = List.from(_inputSecond);

    // Normalisasi input
    input = input.map((e) => e / 10.0).toList();
    inputSecond = inputSecond.map((e) => e / 10.0).toList();

    if (input.length < _expectedInputLength) {
      input.addAll(List.filled(_expectedInputLength - input.length, 0.0));
    } else if (input.length > _expectedInputLength) {
      input = input.sublist(0, _expectedInputLength);
    }
    if (inputSecond.length < _expectedInputLength) {
      inputSecond
          .addAll(List.filled(_expectedInputLength - inputSecond.length, 0.0));
    } else if (inputSecond.length > _expectedInputLength) {
      inputSecond = inputSecond.sublist(0, _expectedInputLength);
    }

    var inputShape = [1, _expectedInputLength];
    var inputList = Float32List.fromList(input).reshape(inputShape);
    var inputSecondList = Float32List.fromList(inputSecond).reshape(inputShape);

    var outputShapes = _interpreter.getOutputTensor(0).shape;
    var output = List.generate(
        outputShapes[0], (i) => List.filled(outputShapes[1], 0.0));
    var outputSecond = List.generate(
        outputShapes[0], (i) => List.filled(outputShapes[1], 0.0));

    _interpreter.run(inputList, output);
    _interpreter.run(inputSecondList, outputSecond);

    // Logging lebih lanjut
    print('Input prediksi benar: $input');
    print('Input prediksi salah: $inputSecond');
    print('Output prediksi benar: ${output[0][0]}');
    print('Output prediksi salah: ${outputSecond[0][0]}');

    setState(() {
      _kesimpulan = _getKesimpulan(output, outputSecond);
    });
  }

  String _getKesimpulan(
      List<List<double>> output, List<List<double>> outputSecond) {
    final double prediksiBenar = output[0][0];
    final double prediksiSalah = outputSecond[0][0];
    String kesimpulanBenar;
    String kesimpulanSalah;

    if (prediksiBenar > 0.75) {
      kesimpulanBenar =
          'Anak Anda memiliki performa yang sangat baik. Teruskan kerja kerasnya!';
    } else if (prediksiBenar > 0.5) {
      kesimpulanBenar =
          'Performa anak Anda cukup baik, namun perlu ditingkatkan.';
    } else if (prediksiBenar > 0.25) {
      kesimpulanBenar = 'Performa anak Anda perlu ditingkatkan lebih lanjut.';
    } else {
      kesimpulanBenar =
          'Performa anak Anda masih rendah, butuh perhatian khusus.';
    }

    if (prediksiSalah > 0.75) {
      kesimpulanSalah =
          ' Anak Anda sering membuat kesalahan. Perlu evaluasi dan perbaikan.';
    } else if (prediksiSalah > 0.5) {
      kesimpulanSalah =
          ' Anak Anda kadang-kadang membuat kesalahan. Perlu lebih fokus.';
    } else if (prediksiSalah > 0.25) {
      kesimpulanSalah =
          ' Anak Anda jarang membuat kesalahan. Tetap pertahankan!';
    } else {
      kesimpulanSalah =
          ' Anak Anda hampir tidak pernah membuat kesalahan. Luar biasa!';
    }

    return '$kesimpulanBenar $kesimpulanSalah';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        title: const Text('Grafik',
            style: TextStyle(
              fontSize: 20.0,
              fontFamily: 'WorkSans',
              fontWeight: FontWeight.normal,
            )),
        backgroundColor: const Color.fromRGBO(186, 252, 182, 1),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Go back to the previous screen
          },
        ),
        centerTitle: true,
      ),
      backgroundColor: const Color.fromRGBO(186, 252, 182, 1),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 1,
              child: Container(
                padding:
                    EdgeInsetsDirectional.only(top: 2.h, start: 5.w, end: 1.w),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(
                        SizerUtil.deviceType == DeviceType.tablet ? 60 : 40),
                    topRight: Radius.circular(
                        SizerUtil.deviceType == DeviceType.tablet ? 60 : 40),
                  ),
                ),
                child: Column(
                  children: [
                    SizedBox(height: 3.h),
                    const Text(
                      "Grafik Tingkatan",
                      style: TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    ChartContainer(
                      color: Colors.transparent,
                      chart: LineChartContent(
                          input: _input, inputSecond: _inputSecond),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const LegendItem(
                            color: Color.fromRGBO(60, 229, 117, 1),
                            label: 'Benar'),
                        SizedBox(
                          width: 12.w,
                        ),
                        const LegendItem(
                            color: Color.fromRGBO(255, 59, 51, 1),
                            label: 'Salah'),
                      ],
                    ),
                    SizedBox(height: 3.h),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 1.h),
                      padding:
                          EdgeInsets.symmetric(horizontal: 5.w, vertical: 3.h),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5.w),
                        border: Border.all(color: Colors.grey.withOpacity(0.5)),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Refleksi perkembangan latihan anak',
                            style: TextStyle(
                                fontSize: 12.sp, fontWeight: FontWeight.normal),
                          ),
                          const Divider(
                              color: Colors.grey, thickness: 1, height: 20),
                          SizedBox(height: 2.h),
                          Text(
                            _kesimpulan,
                            style: TextStyle(fontSize: 14.sp),
                          ),
                          SizedBox(height: 2.h),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LegendItem extends StatelessWidget {
  final Color color;
  final String label;

  const LegendItem({super.key, required this.color, required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 10,
          height: 10,
          color: color,
        ),
        const SizedBox(width: 5),
        Text(label),
      ],
    );
  }
}
