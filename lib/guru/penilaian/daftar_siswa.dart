import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:animation_list/animation_list.dart';
import 'package:study/guru/penilaian/penilaian_siswa.dart';

class NilaiSiswa extends StatelessWidget {
  const NilaiSiswa({super.key});
  static String routeName = 'NilaiSiswa';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(186, 252, 182, 1),
      appBar: AppBar(
        scrolledUnderElevation: 0,
        elevation: 0,
        title: const Text(
          'Penilaian',
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
                    child: _buildSiswaContainer(
                      'NIS. 2368709691',
                      'Aisha Zahra',
                      context,
                    ),
                  ),
                  _buildSiswaContainer(
                    'NIS. 2304136582',
                    'Aisyah Mustofa',
                    context,
                  ),
                  _buildSiswaContainer(
                    'NIS. 2319833846',
                    'Balangga Sinaga',
                    context,
                  ),
                  _buildSiswaContainer(
                    'NIS. 2319833846',
                    'Cemeti Yulianti',
                    context,
                  ),
                  _buildSiswaContainer(
                    'NIS. 2378116253',
                    'Dadap Kusumo',
                    context,
                  ),
                  _buildSiswaContainer(
                    'NIS. 2378548481',
                    'Gangsar Salahudin',
                    context,
                  ),
                  _buildSiswaContainer(
                    'NIS. 2372327532',
                    'Harjasa Saputra',
                    context,
                  ),
                  _buildSiswaContainer(
                    'NIS. 2355736649',
                    'Hesti Budiman',
                    context,
                  ),
                  _buildSiswaContainer(
                    '2359884967',
                    'Humaira Waluyo',
                    context,
                  ),
                  _buildSiswaContainer(
                    'NIS. 2388027957',
                    'Ibun Hutasoit',
                    context,
                  ),
                  _buildSiswaContainer(
                    'NIS. 2378239515',
                    'Ida Ardianto',
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

  Widget _buildSiswaContainer(String nis, String siswa, BuildContext context) {
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
                nis,
                style: const TextStyle(
                  height: 1.0,
                  fontSize: 12,
                  fontWeight: FontWeight.normal,
                ),
              ),
              Text(
                siswa,
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
