import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:shimmer/shimmer.dart';
import 'package:study/guru/penilaian/catatan_siswa.dart';
import 'package:study/guru/penilaian/masukkan_nilai_siswa.dart';

class TambahNilai extends StatefulWidget {
  const TambahNilai({super.key});
  static String routeName = 'TambahNilai';

  @override
  // ignore: library_private_types_in_public_api
  _TambahNilaiState createState() => _TambahNilaiState();
}

class _TambahNilaiState extends State<TambahNilai> {
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
      body: Column(
        children: [
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
                      InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, TugasSiswa.routeName);
                          },
                          child: _buildRow('Tugas, Ulangan dan Quiz')),
                      const Divider(
                        color: Colors.grey,
                        thickness: 1,
                        height: 20,
                      ),
                      SizedBox(
                        height: 4.h,
                      ),
                      InkWell(
                          onTap: () {
                            Navigator.pushNamed(
                                context, CatatanSiswa.routeName);
                          },
                          child: _buildRow('Catatan Refleksi Akhir Semester')),
                      const Divider(
                        color: Colors.grey,
                        thickness: 1,
                        height: 20,
                      ),
                      SizedBox(
                        height: 4.h,
                      ),
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

  Widget _buildRow(String title) {
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
                ],
              ),
              const Icon(Icons.arrow_forward_ios, size: 24),
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
}
