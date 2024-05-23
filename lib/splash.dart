import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:study/started.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});
  static String routeName = 'SplashPage';

  @override
  Widget build(BuildContext context) {
    // Mengatur penundaan sebelum navigasi ke halaman berikutnya
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacementNamed(StaredPage.routeName);
    });

    ScreenUtil.init(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(186, 252, 182, 1),
      ),
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color.fromRGBO(186, 252, 182, 1),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //J U D U L
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.only(left: 20.w),
              child: Text(
                'Kids Trackr',
                style: TextStyle(
                  fontSize: 100.sp,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w700,
                  color: const Color.fromRGBO(79, 69, 87, 1),
                  height: 0.8.h,
                  fontStyle: FontStyle.normal,
                  shadows: <Shadow>[
                    Shadow(
                      offset: Offset(4.0.w, 4.0.h),
                      color: const Color.fromRGBO(109, 93, 110, 0.2),
                    ),
                  ],
                ),
              ),
            ),

            //G a m b a r s e k o l a h
            Expanded(
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Positioned(
                    bottom: 0,
                    child: Image.asset(
                      "assets/images/school.png",
                      width: MediaQuery.of(context)
                          .size
                          .width, // Lebar sesuai dengan layar
                      fit: BoxFit
                          .contain, // Sesuaikan gambar dengan kotak yang tersedia
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
