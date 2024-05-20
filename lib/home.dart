import 'package:flutter/material.dart';
import 'package:study/menu/absensi/absensi.dart';
import 'package:study/menu/pesan/chat_page.dart';
import 'package:study/my_profile/profile.dart';
import 'package:sizer/sizer.dart';
import 'package:study/menu/gizi.dart';

import 'package:study/menu/pelajaran/mapel.dart';
// import 'package:study/menu/perjalanan/rute.dart';
import 'package:study/menu/berita/beritahome.dart';
import 'package:study/menu/penilaian/matpel.dart';
//import 'package:study/started.dart';
import 'package:flutter_animate/flutter_animate.dart';

class Home extends StatefulWidget {
  static String routeName = 'Home';

  const Home({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: const Icon(Icons.logout),
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

                              //pushNamed(context, StaredPage.routeName);
                            },
                            child: const Text('Keluar'),
                          ),
                        ],
                      ),
                    );
                  },
                  iconSize: 30,
                ),
                const SizedBox(
                    width: 235), // Jarak antara ikon logout dan profil
                IconButton(
                  icon: const Icon(Icons.person_outline),
                  onPressed: () {
                    Navigator.pushNamed(context, ProfileDetail.routeName);
                  },
                  iconSize: 30,
                ),
              ],
            ),
          ),
        ],
      ),
      backgroundColor: const Color.fromRGBO(186, 252, 182, 1),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Hallo!\nNita Sarah",
                          style: TextStyle(
                            height: 0.9,
                            color: Color.fromRGBO(75, 63, 99, 1),
                            fontSize: 52.0,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w700,
                          ),
                        ).animate(delay: 200.ms).fadeIn(duration: 300.ms),
                        const SizedBox(
                            height: 20), // Spacing before image/text row
                        Row(
                          // Use Row for horizontal arrangement
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const SizedBox(width: 70),
                            Image.asset(
                              // Insert image here
                              'assets/images/children.png',
                              height: 25,
                              width: 25,
                            ),
                            const SizedBox(
                                width: 10), // Spacing between image and text
                            const Text(
                              'Aisha Zahra',
                              style: TextStyle(
                                fontSize: 24.0,
                                fontFamily: 'WorkSans',
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ],
                        ).animate(delay: 200.ms).fadeIn(duration: 300.ms),
                        const SizedBox(
                            height: 10), // Spacing after image/text row
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                padding:
                    EdgeInsetsDirectional.only(top: 2.h, start: 5.w, end: 1.w),
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
                child: GridView.count(
                  shrinkWrap: true,
                  crossAxisCount: 2,
                  crossAxisSpacing: 7,
                  children: [
                    GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, Mapel.routeName);
                        },
                        child: Stack(
                          children: [
                            Container(
                              width: 140,
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
                                color: const Color.fromARGB(156, 142, 213, 255),
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: const Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 5),
                                  Text(
                                    'Jadwal',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    'Mata\nPelajaran',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal,
                                      height: 1.1,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Positioned(
                              bottom: 29,
                              right: 10,
                              child: Transform.rotate(
                                angle: 0.3,
                                child: Container(
                                  width: 20.w,
                                  height: 10.h,
                                  decoration: BoxDecoration(
                                    image: const DecorationImage(
                                      image: AssetImage(
                                        'assets/images/jadwal.png',
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )).animate(delay: 200.ms).fadeIn(duration: 300.ms),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, Absensi.routeName);
                      },
                      child: Stack(
                        children: [
                          Container(
                            width: 140,
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
                              color: const Color.fromRGBO(206, 184, 255, 100),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 5),
                                Text(
                                  'Absensi',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  'Kehadiran\nAnak',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                    height: 1.1,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                            bottom: 27,
                            right: 7,
                            child: Transform.rotate(
                              angle: 0.3,
                              child: Container(
                                width: 20.w,
                                height: 10.h,
                                decoration: BoxDecoration(
                                  image: const DecorationImage(
                                    image: AssetImage(
                                      'assets/images/absensi.png',
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ).animate(delay: 200.ms).fadeIn(duration: 300.ms),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, Matpel.routeName);
                      },
                      child: Stack(
                        children: [
                          Container(
                            width: 140,
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
                              color: const Color.fromRGBO(255, 213, 159, 100),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 5),
                                Text(
                                  'Penilaian',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  'Terampil\nAnak',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                    height: 1.1,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                            bottom: 27,
                            right: 7,
                            child: Transform.rotate(
                              angle: 0.3,
                              child: Container(
                                width: 21.w,
                                height: 11.h,
                                decoration: BoxDecoration(
                                  image: const DecorationImage(
                                    image: AssetImage(
                                      'assets/images/penilaian.png',
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ).animate(delay: 200.ms).fadeIn(duration: 300.ms),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, ChatPageOrtu.routeName);
                      },
                      child: Stack(
                        children: [
                          Container(
                            width: 140,
                            height: 120,
                            padding: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 2,
                                  blurRadius: 7,
                                  offset: const Offset(0, 5),
                                ),
                              ],
                              color: const Color.fromRGBO(255, 159, 159, 100),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: const Column(
                              textBaseline: TextBaseline.alphabetic,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 5),
                                Text(
                                  'Pesan',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  'Terhadap\nGuru',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                    height: 1,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                            bottom: 27,
                            right: 7,
                            child: Transform.rotate(
                              angle: 0.3,
                              child: Container(
                                width: 22.w,
                                height: 10.h,
                                decoration: BoxDecoration(
                                  image: const DecorationImage(
                                    image: AssetImage(
                                      'assets/images/pesan.png',
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ).animate(delay: 200.ms).fadeIn(duration: 300.ms),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, BeritaHome.routeName);
                      },
                      child: Stack(
                        children: [
                          Container(
                            width: 140,
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
                              color: const Color.fromRGBO(232, 255, 159, 100),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 5),
                                Text(
                                  'Berita',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  'Sekolah\nTerkini',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                    height: 1.1,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                            bottom: 27,
                            right: 7,
                            child: Transform.rotate(
                              angle: 0.3,
                              child: Container(
                                width: 21.w,
                                height: 11.h,
                                decoration: BoxDecoration(
                                  image: const DecorationImage(
                                    image: AssetImage(
                                      'assets/images/berita.png',
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ).animate(delay: 200.ms).fadeIn(duration: 300.ms),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, Gizi.routeName);
                      },
                      child: Stack(
                        children: [
                          Container(
                            width: 140,
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
                              color: const Color.fromRGBO(184, 255, 186, 90),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 5),
                                Text(
                                  'Gizi',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  'Makanan\nHarian',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                    height: 1.1,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                            bottom: 27,
                            right: 7,
                            child: Transform.rotate(
                              angle: 0.3,
                              child: Container(
                                width: 22.w,
                                height: 10.h,
                                decoration: BoxDecoration(
                                  image: const DecorationImage(
                                    image: AssetImage(
                                      'assets/images/gizi.png',
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ).animate(delay: 200.ms).fadeIn(duration: 300.ms),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
