import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';

class Berita1 extends StatefulWidget {
  static String routeName = 'Berita1';

  const Berita1({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _Berita1State createState() => _Berita1State();
}

class _Berita1State extends State<Berita1> {
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    Timer(const Duration(milliseconds: 300), () {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(186, 252, 182, 1),
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: const Color.fromRGBO(186, 252, 182, 1),
        title: const Text(
          'Berita',
          style: TextStyle(
            fontSize: 20.0,
            fontFamily: 'WorkSans',
            fontWeight: FontWeight.normal,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Container(
                padding:
                    EdgeInsetsDirectional.only(top: 4.h, start: 8.w, end: 8.w),
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
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      _isLoading
                          ? _buildShimmerBox(width: 90.w, height: 20.h)
                          : SizedBox(
                              width: 90.w, // Lebar gambar
                              height: 20.h, // Tinggi gambar
                              child: Container(
                                decoration: BoxDecoration(
                                  image: const DecorationImage(
                                    image: AssetImage(
                                        'assets/images/berita_0.png'),
                                    fit: BoxFit.fill,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                      SizedBox(height: 2.h),
                      _isLoading
                          ? _buildShimmerBox(width: 90.w, height: 2.h)
                          : const Text(
                              'Undangan Pentas Seni Anak',
                              style: TextStyle(
                                fontSize: 20.0,
                                fontFamily: 'WorkSans',
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                      const Divider(),
                      SizedBox(height: 1.h),
                      _isLoading
                          ? Column(
                              children: [
                                _buildShimmerBox(width: 90.w, height: 30.h),
                                SizedBox(height: 2.h),
                                _buildShimmerBox(width: 90.w, height: 30.h),
                              ],
                            )
                          : const Text(
                              'Kami dengan gembira ingin mengundang Anda untuk hadir dalam acara pentas seni anak yang akan diselenggarakan oleh kami. Acara ini akan menjadi momentum istimewa di mana putra-putri tercinta kita akan menampilkan bakat dan kreativitas mereka dalam berbagai pertunjukan seni yang menakjubkan.\n\nPentas seni ini tidak hanya menjadi kesempatan bagi anak-anak untuk mengekspresikan diri mereka, tetapi juga momen yang berharga bagi kita sebagai orang tua untuk mendukung dan menghargai setiap langkah perkembangan mereka. Melalui seni, kita dapat melihat bagaimana mereka tumbuh dan berkembang dalam mengeksplorasi dunia di sekitar mereka.\n\nOleh karena itu, dengan senang hati kami mengundang Anda untuk hadir dalam acara pentas seni anak kami. Jadikanlah momen ini sebagai waktu yang berharga untuk bersama-sama menikmati karya-karya indah dan membanggakan yang telah diciptakan oleh anak-anak kita.\n\nTerakhir, surat undangan ini kami sampaikan sebagai bentuk apresiasi atas dukungan dan perhatian Anda sebagai orang tua. Terima kasih atas kehadiran dan partisipasi Anda dalam acara pentas seni anak kami.',
                              style: TextStyle(
                                fontSize: 14.0,
                                fontFamily: 'WorkSans',
                                fontWeight: FontWeight.normal,
                              ),
                              textAlign: TextAlign.justify,
                            ),
                      SizedBox(height: 2.h),
                      ElevatedButton(
                        onPressed: () {
                          Fluttertoast.showToast(
                              msg: "Undangan telah diunduh",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.CENTER,
                              timeInSecForIosWeb: 1,
                              textColor: Colors.white,
                              fontSize: 16.0);
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          backgroundColor: const Color.fromRGBO(76, 66, 83, 1),
                          foregroundColor: Colors.white,
                          elevation: 5.0,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 95.0,
                            vertical: 15.0,
                          ),
                        ),
                        child: const Text('Unduh Undangan'),
                      ),
                      SizedBox(height: 3.h), // Spasi bawah
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildShimmerBox({required double width, required double height}) {
    return SizedBox(
      width: width,
      height: height,
      child: Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: Container(
          color: Colors.white,
        ),
      ),
    );
  }
}
