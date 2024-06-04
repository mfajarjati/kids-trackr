import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:animation_list/animation_list.dart';
import 'package:flutter_animate/flutter_animate.dart';

class Gizi extends StatelessWidget {
  const Gizi({super.key});
  static String routeName = 'Gizi';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(186, 252, 182, 1),
      appBar: AppBar(
        scrolledUnderElevation: 0,
        title: const Text(
          'Gizi',
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
            Navigator.pop(context); // Kembali ke halaman sebelumnya
          },
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            height: 200,
            decoration: const BoxDecoration(
              color: Color.fromRGBO(186, 252, 182, 100),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/makan.png',
                  height: 100,
                  width: 100,
                ),
                const SizedBox(height: 7),
                const Text(
                  'Makan Siang',
                  style: TextStyle(
                    color: Color.fromRGBO(75, 63, 99, 1),
                    fontSize: 20.0,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'WorkSans',
                  ),
                ),
                const Text(
                  'di-update tiap minggunya',
                  style: TextStyle(
                    color: Color.fromRGBO(75, 63, 99, 1),
                    fontSize: 16.0,
                    fontFamily: 'WorkSans',
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ],
            ),
          ).animate(delay: 200.ms).fadeIn(duration: 300.ms),
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
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 7,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: AnimationList(
                duration: 1000,
                reBounceDepth: 10.0,
                children: [
                  _buildMenuContainer(
                      'Senin',
                      'Jam 12.00 - 13.00',
                      'Nasi + Ayam',
                      'Gizi: Protein, Karbohidrat, Lemak',
                      'assets/images/nasi_ayam.png',
                      'Nasi dan ayam menyediakan protein untuk membangun otot, karbohidrat untuk energi, dan lemak untuk fungsi tubuh.'),
                  _buildMenuContainer(
                      'Selasa',
                      'Jam 12.00 - 13.00',
                      'Nasi + Sayur',
                      'Gizi: Serat, Vitamin, Mineral',
                      'assets/images/nasi_sayur.png',
                      'Nasi dan sayur memberikan serat untuk pencernaan, vitamin untuk kesehatan mata dan kulit, serta mineral untuk fungsi tubuh.'),
                  _buildMenuContainer(
                      'Rabu',
                      'Jam 12.00 - 13.00',
                      'Gandum',
                      'Gizi: Serat, Karbohidrat, Protein',
                      'assets/images/gandum.png',
                      'Gandum kaya akan serat untuk pencernaan, karbohidrat untuk energi, dan protein untuk memperbaiki jaringan.'),
                  _buildMenuContainer(
                      'Kamis',
                      'Jam 12.00 - 13.00',
                      'Roti + Susu',
                      'Gizi: Kalsium, Protein, Karbohidrat',
                      'assets/images/roti_susu.png',
                      'Roti dan susu memberikan kalsium untuk tulang, protein untuk otot, dan karbohidrat untuk energi.'),
                  _buildMenuContainer(
                      'Jum\'at',
                      'Jam 12.00 - 13.00',
                      'Buah-buahan',
                      'Gizi: Vitamin, Serat, Mineral',
                      'assets/images/buah.png',
                      'Buah-buahan menyediakan vitamin untuk sistem kekebalan tubuh, serat untuk pencernaan, dan mineral untuk fungsi tubuh.'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuContainer(String day, String time, String menu, String gizi,
      String imagePath, String description) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 1.h),
      padding: EdgeInsets.symmetric(
        horizontal: 2.w,
      ),
      decoration: BoxDecoration(
        color: const Color.fromRGBO(238, 238, 238, 100),
        borderRadius: BorderRadius.circular(5.w),
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
      child: ExpansionTile(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              day,
              style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.normal),
            ),
            Text(
              time,
              style: TextStyle(
                fontSize: 9.sp,
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        ),
        subtitle: Text(
          menu,
          style: TextStyle(
            height: 0.9,
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(bottom: 2.h),
            margin: EdgeInsets.only(left: 3.w, right: 1.w),
            child: Column(
              children: [
                Image.asset(
                  imagePath,
                  height: 200,
                  width: 200,
                ),
                SizedBox(height: 1.h),
                Text(
                  gizi,
                  style:
                      TextStyle(fontSize: 10.sp, fontWeight: FontWeight.normal),
                ),
                SizedBox(height: 1.h),
                Text(
                  description,
                  style:
                      TextStyle(fontSize: 10.sp, fontWeight: FontWeight.normal),
                  textAlign: TextAlign.justify,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
