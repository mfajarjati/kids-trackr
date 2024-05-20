import 'package:animation_list/animation_list.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';

class Pesan extends StatelessWidget {
  const Pesan({super.key});
  static String routeName = 'Pesan';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(186, 252, 182, 1),
      appBar: AppBar(
        scrolledUnderElevation: 0,
        elevation: 0,
        title: const Text(
          'Pesan',
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
                  EdgeInsetsDirectional.only(top: 2.h, start: 8.w, end: 8.w),
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
                  _buildTeacherContainer(
                    'Wali Kelas & Matematika',
                    'Pak Janeudi',
                    'NOMOR WHATSAPP',
                    context,
                  ),
                  _buildTeacherContainer(
                    'Bahasa Indonesia',
                    'Bu Zulaifa Fauziah',
                    'NOMOR WHATSAPP',
                    context,
                  ),
                  _buildTeacherContainer(
                    'Bahasa Sunda',
                    'Pak Ahman Sanusi',
                    'NOMOR WHATSAPP',
                    context,
                  ),
                  _buildTeacherContainer(
                    'Bahasa Inggris',
                    'Bu Siti Nurhayati',
                    'NOMOR WHATSAPP',
                    context,
                  ),
                  _buildTeacherContainer(
                    'Ilmu Pengetahuan Sosial',
                    'Pak Mamud Ismail',
                    'NOMOR WHATSAPP',
                    context,
                  ),
                  _buildTeacherContainer(
                    'Pendidikan Kewarganegaraan',
                    'Pak Joko Slamet',
                    'NOMOR WHATSAPP',
                    context,
                  ),
                  _buildTeacherContainer(
                    'Ilmu Pengetahuan Alam',
                    'Bu Ismi',
                    'NOMOR WHATSAPP',
                    context,
                  ),
                  _buildTeacherContainer(
                    'Pendidikan Keagamaan',
                    'Pak Agus Setiawan',
                    'NOMOR WHATSAPP',
                    context,
                  ),
                  _buildTeacherContainer(
                    'Prakarya',
                    'Pak Hadi Prasetyo',
                    'NOMOR WHATSAPP',
                    context,
                  ),
                  _buildTeacherContainer(
                    'Komputer',
                    'Bu Nia Kartika',
                    'NOMOR WHATSAPP',
                    context,
                  ),
                  _buildTeacherContainer(
                    'Olahraga',
                    'Pak Heri Setiawan',
                    'NOMOR WHATSAPP',
                    context,
                  ),
                  SizedBox(height: 3.h),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTeacherContainer(
      String subject, String teacher, String phone, BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 1.h),
      padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
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
      child: GestureDetector(
        onTap: () {
          final Uri url = Uri(
            scheme: 'https',
            host: 'wa.me',
            path: phone,
          );
          launchUrl(url);
        },
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
            const Icon(Icons.arrow_forward_ios, size: 28),
          ],
        ),
      ),
    );
  }
}
