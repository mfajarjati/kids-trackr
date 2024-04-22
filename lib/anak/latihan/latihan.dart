import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:sizer/sizer.dart';
import 'package:study/anak/latihan/bar_graph.dart';
import 'package:study/anak/latihan/level1.dart';

class Latihan extends StatefulWidget {
  const Latihan({super.key});

  static String routeName = 'Latihan';

  @override
  // ignore: library_private_types_in_public_api
  _LatihanState createState() => _LatihanState();
}

class _LatihanState extends State<Latihan> {
  List<int> absensi = [
    17,
    2,
    1,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(186, 252, 182, 1),
      appBar: AppBar(
        scrolledUnderElevation: 0,
        title: const Text('Latihan',
            style: TextStyle(
              fontSize: 20.0,
              fontFamily: 'WorkSans',
              fontWeight: FontWeight.normal,
            )),
        backgroundColor: const Color.fromRGBO(186, 252, 182, 1),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Go back to the previous screen
          },
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            height: 150,
            decoration: const BoxDecoration(
              color: Color.fromRGBO(186, 252, 182, 1),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/latihan.png',
                  height: 140,
                  width: 140,
                ).animate(delay: 200.ms).fadeIn(duration: 300.ms),
                const SizedBox(height: 7),
              ],
            ),
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              LegendItem(
                  color: Color.fromRGBO(60, 229, 117, 1), label: 'Benar'),
              SizedBox(width: 15),
              LegendItem(color: Color.fromRGBO(73, 50, 255, 1), label: 'Salah'),
              SizedBox(width: 15),
              LegendItem(
                  color: Color.fromRGBO(255, 59, 51, 1), label: 'Dilewat'),
            ],
          ).animate(delay: 200.ms).fadeIn(duration: 300.ms),
          SizedBox(height: 2.h),
          SizedBox(
            height: 20.h,
            width: 80.w,
            child: SizedBox(
              height: 20,
              child: MyBarGraph(
                absensi: absensi,
              ),
            ),
          ).animate(delay: 200.ms).fadeIn(duration: 300.ms),
          const SizedBox(height: 20),
          Expanded(
            child: Container(
              padding: EdgeInsets.only(left: 6.w, right: 9.w, top: 5.w),
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
                  crossAxisCount: 3,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                  children: [
                    GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, LevelOne.routeName);
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
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(height: 5),
                                  Text(
                                    'Level 1',
                                    style: TextStyle(
                                      fontSize: 18,
                                      height: 3,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )).animate(delay: 200.ms).fadeIn(duration: 300.ms),
                    GestureDetector(
                        onTap: () {
                          // Navigator.pushNamed(context, Mapel.routeName);
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
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(height: 5),
                                  Text(
                                    'Level 2',
                                    style: TextStyle(
                                      fontSize: 18,
                                      height: 3,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )).animate(delay: 200.ms).fadeIn(duration: 300.ms),
                    GestureDetector(
                        onTap: () {
                          // Navigator.pushNamed(context, Mapel.routeName);
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
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(height: 5),
                                  Text(
                                    'Level 3',
                                    style: TextStyle(
                                      fontSize: 18,
                                      height: 3,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )).animate(delay: 200.ms).fadeIn(duration: 300.ms),
                    GestureDetector(
                        onTap: () {
                          // Navigator.pushNamed(context, Mapel.routeName);
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
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(height: 5),
                                  Text(
                                    'Level 4',
                                    style: TextStyle(
                                      fontSize: 18,
                                      height: 3,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )).animate(delay: 200.ms).fadeIn(duration: 300.ms),
                    GestureDetector(
                        onTap: () {
                          // Navigator.pushNamed(context, Mapel.routeName);
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
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(height: 5),
                                  Text(
                                    'Level 5',
                                    style: TextStyle(
                                      fontSize: 18,
                                      height: 3,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )).animate(delay: 200.ms).fadeIn(duration: 300.ms),
                    GestureDetector(
                        onTap: () {
                          // Navigator.pushNamed(context, Mapel.routeName);
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
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(height: 5),
                                  Text(
                                    'Level 6',
                                    style: TextStyle(
                                      fontSize: 18,
                                      height: 3,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )).animate(delay: 200.ms).fadeIn(duration: 300.ms),
                  ]),
            ),
          )
        ],
      ),
    );
  }
}

class LegendItem extends StatelessWidget {
  final Color color;
  final String label;

  const LegendItem({super.key, required this.color, required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 10,
          height: 10,
          color: color,
        ),
        const SizedBox(width: 5),
        Text(label),
      ],
    );
  }
}
