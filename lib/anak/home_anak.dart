import 'package:flutter/material.dart';
import 'package:study/anak/latihan/latihan.dart';
import 'package:study/anak/modul.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_animate/flutter_animate.dart';

class Anak extends StatefulWidget {
  static String routeName = 'Anak';

  const Anak({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _AnakState createState() => _AnakState();
}

class _AnakState extends State<Anak> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: const Color.fromRGBO(186, 252, 182, 1),
        leading: const SizedBox(), // Menghilangkan leading icon

        actions: [
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(width: 4),
                IconButton(
                  icon: const Icon(Icons.close_rounded),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text('Konfirmasi'),
                        content: const Text('Apakah Anda yakin ingin keluar?'),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.of(context).pop(),
                            child: const Text('Batal'),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                              Navigator.pop(context);
                            },
                            child: const Text('Keluar'),
                          ),
                        ],
                      ),
                    );
                  },
                  iconSize: 30,
                ),
                // Jarak antara ikon logout dan profil
              ],
            ),
          ),
        ],
      ),
      backgroundColor: const Color.fromRGBO(186, 252, 182, 1),
      body: Column(
        children: [
          Container(
            height: 25.h,
            decoration: const BoxDecoration(
              color: Color.fromRGBO(186, 252, 182, 100),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/anak.png',
                  height: 100,
                  width: 100,
                ),
                const SizedBox(height: 7),
                const Text(
                  'Aisha Zahra',
                  style: TextStyle(
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
                    fontSize: 16.0,
                    fontFamily: 'WorkSans',
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ],
            ),
          ).animate(delay: 200.ms).fadeIn(duration: 300.ms),
          Expanded(
            flex: 1,
            child: Container(
              padding:
                  EdgeInsetsDirectional.only(top: 2.h, start: 5.w, end: 5.w),
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(
                    height: 2.h,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, Modul.routeName);
                    },
                    child: Container(
                      height: 120,
                      margin: const EdgeInsets.only(
                          bottom: 10), // Spacing between containers
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 7,
                            offset: const Offset(0, 5),
                          ),
                        ],
                        color: const Color.fromRGBO(146, 224, 172, 100),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 5),
                                Text(
                                  '   Modul',
                                  style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  '    Belajar\n    Mandiri',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.normal,
                                    height: 1.1,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Transform.rotate(
                            angle: 0.3,
                            child: Container(
                              width: 33.w,
                              height: 18.h,
                              decoration: BoxDecoration(
                                image: const DecorationImage(
                                  image: AssetImage(
                                    'assets/images/modul.png',
                                  ),
                                  fit: BoxFit.cover,
                                ),
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ).animate(delay: 200.ms).fadeIn(duration: 300.ms),
                  SizedBox(
                    height: 2.h,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, Latihan.routeName);
                    },
                    child: Container(
                      width: 8.w,
                      height: 120,
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 7,
                            offset: const Offset(0, 5),
                          ),
                        ],
                        color: const Color.fromRGBO(161, 213, 245, 100),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 5),
                                Text(
                                  '    Latihan',
                                  style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  '     Kemapuan\n     Mandiri',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.normal,
                                    height: 1.1,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Transform.rotate(
                            angle: 0.3,
                            child: Container(
                              width: 33.w,
                              height: 18.h,
                              decoration: BoxDecoration(
                                image: const DecorationImage(
                                  image: AssetImage(
                                    'assets/images/tugas.png',
                                  ),
                                  fit: BoxFit.cover,
                                ),
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ).animate(delay: 200.ms).fadeIn(duration: 300.ms),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
