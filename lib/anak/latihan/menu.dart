import 'package:flutter/material.dart';
import 'package:study/anak/latihan/latihan.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_animate/flutter_animate.dart';

class Menu extends StatefulWidget {
  static String routeName = 'Menu';

  const Menu({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      backgroundColor: const Color.fromRGBO(186, 252, 182, 1),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
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
                          Navigator.pushNamed(context, Latihan.routeName);
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
                                color: Color.fromARGB(156, 255, 219, 142),
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: const Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 5),
                                  Text(
                                    'Pembelajaran',
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    'Berhitung',
                                    style: TextStyle(
                                      fontSize: 16,
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
                                        'assets/images/berhitung.png',
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
                      onTap: () {},
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
                              color: Color.fromARGB(220, 119, 189, 255),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 5),
                                Text(
                                  'Pembelajaran',
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  'Bahasa',
                                  style: TextStyle(
                                    fontSize: 17,
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
                                      'assets/images/bahasa.png',
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
                      onTap: () {},
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
                              color: Color.fromARGB(199, 240, 255, 106),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 5),
                                Text(
                                  'Pembelajaran',
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  'Ilmu\nAlam',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal,
                                    height: 1.1,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                            bottom: 27,
                            right: 10,
                            child: Transform.rotate(
                              angle: 0.2,
                              child: Container(
                                width: 25.w,
                                height: 13.h,
                                decoration: BoxDecoration(
                                  image: const DecorationImage(
                                    image: AssetImage(
                                      'assets/images/alam2.png',
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
                      onTap: () {},
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
                              color: Color.fromARGB(156, 202, 255, 159),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: const Column(
                              textBaseline: TextBaseline.alphabetic,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 5),
                                Text(
                                  'Pembelajaran',
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  'Ilmu\nSosial',
                                  style: TextStyle(
                                    fontSize: 16,
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
                                height: 12.h,
                                decoration: BoxDecoration(
                                  image: const DecorationImage(
                                    image: AssetImage(
                                      'assets/images/sosial.png',
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
                      onTap: () {},
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
                              color: Color.fromARGB(127, 255, 159, 247),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 5),
                                Text(
                                  'Pembelajaran',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  'Etika',
                                  style: TextStyle(
                                    fontSize: 19,
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
                              angle: 0.1,
                              child: Container(
                                width: 23.w,
                                height: 13.h,
                                decoration: BoxDecoration(
                                  image: const DecorationImage(
                                    image: AssetImage(
                                      'assets/images/etika.png',
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
