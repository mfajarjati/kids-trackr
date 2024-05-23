import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:animation_list/animation_list.dart';
import 'package:study/guru/penilaian/penilaian_siswa.dart';

class MatpelGuru extends StatelessWidget {
  const MatpelGuru({super.key});
  static String routeName = 'MatpelGuru';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(186, 252, 182, 1),
      appBar: AppBar(
        scrolledUnderElevation: 0,
        elevation: 0,
        title: const Text(
          'Mata Pelajaran',
          style: TextStyle(
            fontSize: 20.0,
            fontFamily: 'WorkSans',
            fontWeight: FontWeight.normal,
          ),
        ),
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
          Expanded(
            child: Container(
              padding:
                  EdgeInsetsDirectional.only(top: 4.h, start: 8.w, end: 8.w),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(
                      SizerUtil.deviceType == DeviceType.tablet ? 60 : 40),
                  topRight: Radius.circular(
                      SizerUtil.deviceType == DeviceType.tablet ? 60 : 40),
                ),
              ),
              child: AnimationList(
                duration: 1000,
                reBounceDepth: 10.0,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, PenilaianSiswa.routeName);
                    },
                    child: _buildTeacherContainer(
                      'Pak Janeudi',
                      'Matematika',
                      context,
                    ),
                  ),
                  _buildTeacherContainer(
                    'Bu Zulaifa Fauziah',
                    'Bahasa Indonesia',
                    context,
                  ),
                  _buildTeacherContainer(
                    'Pak Ahman Sanusi',
                    'Bahasa Sunda',
                    context,
                  ),
                  _buildTeacherContainer(
                    'Bu Siti Nurhayati',
                    'Bahasa Inggris',
                    context,
                  ),
                  _buildTeacherContainer(
                    'Pak Mamud Ismail',
                    'Ilmu Pengetahuan Sosial',
                    context,
                  ),
                  _buildTeacherContainer(
                    'Pak Joko Slamet',
                    'Pendidikan Kewarganegaraan',
                    context,
                  ),
                  _buildTeacherContainer(
                    'Bu Ismi',
                    'Ilmu Pengetahuan Alam',
                    context,
                  ),
                  _buildTeacherContainer(
                    'Pak Agus Setiawan',
                    'Pendidikan Keagamaan',
                    context,
                  ),
                  _buildTeacherContainer(
                    'Pak Hadi Prasetyo',
                    'Prakarya',
                    context,
                  ),
                  _buildTeacherContainer(
                    'Bu Nia Kartika',
                    'Komputer',
                    context,
                  ),
                  _buildTeacherContainer(
                    'Pak Heri Setiawan',
                    'Olahraga',
                    context,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTeacherContainer(
      String subject, String teacher, BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 1.h),
      padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
      decoration: BoxDecoration(
        color: const Color.fromRGBO(238, 238, 238, 1),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
        border: Border.all(
          color: Colors.grey.withOpacity(0.5),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                subject,
                style: const TextStyle(
                  height: 1.0,
                  fontSize: 12,
                  fontWeight: FontWeight.normal,
                ),
              ),
              Text(
                teacher,
                style: const TextStyle(
                  height: 1.1,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const Icon(Icons.arrow_forward_ios, size: 24),
        ],
      ),
    );
  }
}
