import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';
import 'package:study/menu/absensi/bar_graph.dart';
import 'package:flutter_animate/flutter_animate.dart';

class Absensi extends StatefulWidget {
  const Absensi({super.key});

  static String routeName = 'Absensi';

  @override
  // ignore: library_private_types_in_public_api
  _AbsensiState createState() => _AbsensiState();
}

class _AbsensiState extends State<Absensi> {
  List<double> absensi = [
    50,
    7,
    5,
    1,
  ];

  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    // Timer untuk menandai akhir dari loading dan menghentikan shimmer
    Future.delayed(const Duration(milliseconds: 300), () {
      setState(() {
        _isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(186, 252, 182, 1),
      appBar: AppBar(
        scrolledUnderElevation: 0,
        title: const Text('Absensi',
            style: TextStyle(
              fontSize: 20.0,
              fontFamily: 'WorkSans',
              fontWeight: FontWeight.normal,
            )),
        backgroundColor: const Color.fromRGBO(186, 252, 182, 1),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            height: 150,
            decoration: const BoxDecoration(
              color: Color.fromRGBO(186, 252, 182, 1),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/anak.png',
                  height: 80,
                  width: 80,
                ),
                const SizedBox(height: 7),
                const Text(
                  'Aisha zahra',
                  style: TextStyle(
                    height: 0.8,
                    color: Color.fromRGBO(75, 63, 99, 1),
                    fontSize: 20.0,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'WorkSans',
                  ),
                ),
                const Text(
                  '3A',
                  style: TextStyle(
                    color: Color.fromRGBO(75, 63, 99, 1),
                    fontSize: 14.0,
                    fontFamily: 'WorkSans',
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ],
            ),
          ).animate(delay: 200.ms).fadeIn(duration: 300.ms),
          const SizedBox(height: 20),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              LegendItem(color: Colors.blue, label: 'Hadir'),
              SizedBox(width: 15),
              LegendItem(color: Colors.yellow, label: 'Sakit'),
              SizedBox(width: 15),
              LegendItem(color: Colors.green, label: 'Izin'),
              SizedBox(width: 15),
              LegendItem(color: Colors.red, label: 'Tidak Hadir'),
            ],
          ).animate(delay: 200.ms).fadeIn(duration: 300.ms),
          SizedBox(height: 2.h),
          SizedBox(
            height: 20.h,
            width: 80.w,
            child: SizedBox(
              height: 20,
              child: MyBarGraph(
                absensi: absensi,
              ),
            ),
          ).animate(delay: 200.ms).fadeIn(duration: 300.ms),
          const SizedBox(height: 20),
          Expanded(
            child: Container(
              padding: EdgeInsets.only(left: 6.w, right: 6.w, top: 5.w),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _isLoading
                        // Widget Shimmer untuk menampilkan efek shimmer saat loading
                        ? _buildShimmer()
                        // Teks yang ditampilkan setelah loading selesai
                        : Container(
                            margin: EdgeInsets.symmetric(vertical: 1.h),
                            padding: EdgeInsets.symmetric(horizontal: 1.w),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                _buildAttendanceItem('Hadir', '50'),
                                const Divider(
                                  color: Colors.grey,
                                  thickness: 1,
                                ),
                                SizedBox(
                                  height: 2.h,
                                ),
                                _buildAttendanceItem('Sakit', '7'),
                                const Divider(
                                  color: Colors.grey,
                                  thickness: 1,
                                ),
                                SizedBox(
                                  height: 2.h,
                                ),
                                _buildAttendanceItem('Izin', '5'),
                                const Divider(
                                  color: Colors.grey,
                                  thickness: 1,
                                ),
                                SizedBox(
                                  height: 2.h,
                                ),
                                _buildAttendanceItem('Tanpa Keterangan', '1'),
                                const Divider(
                                  color: Colors.grey,
                                  thickness: 1,
                                ),
                                SizedBox(
                                  height: 2.h,
                                ),
                              ],
                            ),
                          ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Widget untuk menampilkan item kehadiran dengan teks dan jumlahnya
  Widget _buildAttendanceItem(String label, String value) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Text(
        label,
        style: const TextStyle(
          height: 1.0,
          fontSize: 16,
          fontWeight: FontWeight.normal,
        ),
      ),
      Text(
        value,
        style: const TextStyle(
          height: 1.1,
          fontSize: 16,
          fontWeight: FontWeight.normal,
        ),
      ),
    ]);
  }

  // Widget untuk menampilkan shimmer effect
  Widget _buildShimmer() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                color: Colors.white,
                height: 20,
                width: 120,
                margin: const EdgeInsets.only(bottom: 8),
              ),
              Container(
                color: Colors.white,
                height: 20,
                width: 80,
                margin: const EdgeInsets.only(bottom: 8),
              ),
            ],
          ),
        ),
        const Divider(color: Colors.grey, thickness: 1, height: 20),
        const SizedBox(height: 20),
      ],
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
