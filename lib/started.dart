import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:study/login.dart';

class StaredPage extends StatelessWidget {
  const StaredPage({super.key});
  static String routeName = 'StaredPage';

  @override
  Widget build(BuildContext context) {
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
            Padding(
              padding: EdgeInsets.only(left: 20.w),
              child: Text(
                'Kids Trackr',
                style: TextStyle(
                  fontSize: 72.sp,
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
            )
                .animate(
                  delay: 200.ms,
                )
                .fadeIn(delay: 500.ms),
            //K A L I M A T
            Padding(
              padding: EdgeInsets.only(top: 20.h, left: 20.w),
              child: Text(
                'Selamat datang di aplikasi Kids Trackr, \naplikasi ini ditujukan untuk memonitoring \nanak di sekolah. Silahkan klik Get Started \nuntuk memulai.',
                style: TextStyle(
                  fontSize: 14.sp,
                  fontFamily: 'Work Sans',
                  fontWeight: FontWeight.w500,
                  color: const Color.fromRGBO(79, 69, 87, 1),
                  height: 1.5,
                  fontStyle: FontStyle.normal,
                ),
              ),
            )
                .animate(
                  delay: 200.ms,
                )
                .fadeIn(delay: 500.ms),
            //B U T T O N
            SizedBox(height: 25.h),
            Padding(
              padding: EdgeInsets.only(left: 20.w),
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.pushNamed(context, LoginPage.routeName);
                },
                icon: Icon(
                  Icons.keyboard_double_arrow_right,
                  size: 40.sp,
                  color: const Color.fromRGBO(79, 69, 87, 1),
                ),
                label: Text(
                  'Get Started',
                  style: TextStyle(
                    fontSize: 23.sp,
                    fontFamily: 'Work Sans',
                    fontWeight: FontWeight.w600,
                    color: const Color.fromRGBO(79, 69, 87, 1),
                    height: 1.2.h,
                    fontStyle: FontStyle.normal,
                  ),
                ),
                style: ButtonStyle(
                  backgroundColor: const MaterialStatePropertyAll<Color>(
                      Color.fromRGBO(186, 252, 182, 1)),
                  side: MaterialStatePropertyAll<BorderSide>(BorderSide(
                    color: const Color.fromRGBO(79, 69, 87, 1),
                    width: 2.w,
                  )),
                  minimumSize:
                      MaterialStatePropertyAll<Size>(Size(230.w, 50.h)),
                  elevation: const MaterialStatePropertyAll<double>(5),
                ),
              ),
            )
                .animate(
                  delay: 200.ms,
                )
                .fadeIn(delay: 500.ms),
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
            )
                .animate(
                  delay: 200.ms,
                )
                .fadeIn(delay: 500.ms),
          ],
        ),
      ),
    );
  }
}
