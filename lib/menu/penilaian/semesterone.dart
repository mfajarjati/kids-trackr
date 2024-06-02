import 'dart:async';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:shimmer/shimmer.dart';
import 'package:study/menu/penilaian/chart_container.dart';
import 'package:study/menu/penilaian/line_chart.dart';
import 'package:super_tooltip/super_tooltip.dart';
import 'package:tflite_flutter/tflite_flutter.dart';

class SemesterOne extends StatefulWidget {
  const SemesterOne({super.key});
  static String routeName = 'SemesterOne';

  @override
  // ignore: library_private_types_in_public_api
  _SemesterOneState createState() => _SemesterOneState();
}

class _SemesterOneState extends State<SemesterOne> {
  bool _isLoading = true;
  late Interpreter _interpreter;
  String _kesimpulan = 'Sedang memuat refleksi...';
  List<double> _input = [100, 100, 100, 100, 100, 100, 100, 100];

  @override
  void initState() {
    super.initState();
    _loadModel();
    Timer(const Duration(milliseconds: 300), () {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    });
  }

  Future<void> _loadModel() async {
    try {
      _interpreter = await Interpreter.fromAsset('assets/model.tflite');
      _predict();
    } catch (e) {
      print('Failed to load model.');
    }
  }

  void _predict() async {
    var output = List.filled(8, 0.0).reshape([1, 8]);
    _interpreter.run(_input.reshape([1, _input.length]), output);
    setState(() {
      _kesimpulan = _getKesimpulan(output[0]);
    });
  }

  String _getKesimpulan(List<double> output) {
    int maxIndex = output
        .indexWhere((val) => val == output.reduce((a, b) => a > b ? a : b));
    switch (maxIndex) {
      case 0:
        return 'Ananda sangat baik dalam semester ini, tolong dipertahankan.';
      case 1:
        return 'Ananda perlu meningkatkan beberapa aspek belajar.';
      case 2:
        return 'Ananda cukup baik, tetapi bisa lebih baik lagi.';
      case 3:
        return 'Ananda sangat baik dan terus mengalami peningkatan.';
      case 4:
        return 'Ananda perlu banyak peningkatan dan lebih giat belajar.';
      case 5:
        return 'Ananda baik, namun harus mempertahankan konsistensinya.';
      case 6:
        return 'Ananda memerlukan bantuan tambahan untuk pelajaran.';
      case 7:
        return 'Ananda mengalami peningkatan yang baik.';
      default:
        return 'Refleksi tidak diketahui.';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(186, 252, 182, 1),
      body: Column(
        children: [
          ChartContainer(
            color: Colors.transparent,
            chart: LineChartContent(input: _input),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: Container(
              padding: EdgeInsets.only(left: 7.w, right: 7.w, top: 3.w),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(
                    SizerUtil.deviceType == DeviceType.tablet ? 60 : 40,
                  ),
                  topRight: Radius.circular(
                    SizerUtil.deviceType == DeviceType.tablet ? 60 : 40,
                  ),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 7,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 3.h),
                padding: EdgeInsets.symmetric(horizontal: 1.w),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      _buildRow('Tugas 1', 'Nilai Tugas 1 sudah cukup bagus ',
                          _input[0].toString()),
                      const Divider(
                        color: Colors.grey,
                        thickness: 1,
                        height: 20,
                      ),
                      SizedBox(height: 2.h),
                      _buildRow('Tugas 2', 'Nilai Tugas 2 sudah dipertahankan',
                          _input[1].toString()),
                      const Divider(
                        color: Colors.grey,
                        thickness: 1,
                        height: 20,
                      ),
                      SizedBox(height: 2.h),
                      _buildRow(
                          'Tugas 3',
                          'Nilai Tugas 3 dan tolong dipertahankan',
                          _input[2].toString()),
                      const Divider(
                        color: Colors.grey,
                        thickness: 1,
                        height: 20,
                      ),
                      SizedBox(height: 2.h),
                      _buildRow('UTS', 'Nilai UTS bagus dan dipertahankan',
                          _input[3].toString()),
                      const Divider(
                        color: Colors.grey,
                        thickness: 1,
                        height: 20,
                      ),
                      SizedBox(height: 2.h),
                      _buildRow('Tugas 4', 'Nilai Tugas 4 sudah sangat',
                          _input[4].toString()),
                      const Divider(
                        color: Colors.grey,
                        thickness: 1,
                        height: 20,
                      ),
                      SizedBox(height: 2.h),
                      _buildRow('Tugas 5', 'Nilai Tugas 5 tolong dipertahankan',
                          _input[5].toString()),
                      const Divider(
                        color: Colors.grey,
                        thickness: 1,
                        height: 20,
                      ),
                      SizedBox(height: 2.h),
                      _buildRow(
                          'Quiz',
                          'Nilai quiz cukup bagus dan perlu ditingkatkan',
                          _input[6].toString()),
                      const Divider(
                        color: Colors.grey,
                        thickness: 1,
                        height: 20,
                      ),
                      SizedBox(height: 2.h),
                      _buildRow(
                          'UAS', 'Nilai UAS cukup bagus', _input[7].toString()),
                      const Divider(
                        color: Colors.grey,
                        thickness: 1,
                        height: 20,
                      ),
                      _isLoading
                          ? _buildShimmerContainer()
                          : Container(
                              margin: EdgeInsets.symmetric(vertical: 1.h),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 5.w, vertical: 3.h),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5.w),
                                border: Border.all(
                                  color: Colors.grey.withOpacity(0.5),
                                ),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Refleksi perkembangan anak akhir semester',
                                    style: TextStyle(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                  const Divider(
                                    color: Colors.grey,
                                    thickness: 1,
                                    height: 20,
                                  ),
                                  SizedBox(height: 2.h),
                                  Text(
                                    _kesimpulan,
                                    style: TextStyle(fontSize: 14.sp),
                                  ),
                                  SizedBox(height: 2.h),
                                ],
                              ),
                            ),
                      SizedBox(height: 10.h),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRow(String title, String tooltip, String score) {
    return _isLoading
        ? _buildShimmerRow()
        : Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      height: 1.0,
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  SuperTooltip(
                    content: Text(
                      tooltip,
                      softWrap: true,
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    backgroundColor: Colors.black12,
                    popupDirection: TooltipDirection.right,
                    child: const SizedBox(
                      width: 30,
                      child: Icon(
                        Icons.contact_support,
                        color: Colors.black,
                        size: 17,
                      ),
                    ),
                  ),
                ],
              ),
              Text(
                score,
                style: const TextStyle(
                  height: 1.1,
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ],
          );
  }

  Widget _buildShimmerRow() {
    return SizedBox(
      height: 20,
      child: Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 80,
              height: 20,
              color: Colors.white,
            ),
            Container(
              width: 30,
              height: 20,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildShimmerContainer() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 1.h),
      padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 3.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5.w),
        border: Border.all(
          color: Colors.grey.withOpacity(0.5),
        ),
      ),
      child: Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 12.sp,
              color: Colors.white,
            ),
            const Divider(
              color: Colors.grey, // Adjust color as needed
              thickness: 1, // Adjust thickness as needed
              height: 20,
            ),
            SizedBox(height: 2.h),
            Container(
              width: double.infinity,
              height: 14.sp,
              color: Colors.white,
            ),
            SizedBox(height: 2.h),
          ],
        ),
      ),
    );
  }
}
