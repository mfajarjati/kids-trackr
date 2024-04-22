import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:sizer/sizer.dart';

class LevelOne extends StatefulWidget {
  const LevelOne({super.key});

  static String routeName = 'LevelOne';

  @override
  // ignore: library_private_types_in_public_api
  _LevelOneState createState() => _LevelOneState();
}

class _LevelOneState extends State<LevelOne> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(186, 252, 182, 1),
      appBar: AppBar(
        scrolledUnderElevation: 0,
        title: const Text('Level 1',
            style: TextStyle(
              fontSize: 20.0,
              fontFamily: 'WorkSans',
              fontWeight: FontWeight.normal,
            )),
        backgroundColor: const Color.fromRGBO(186, 252, 182, 1),
        leading: IconButton(
          icon: const Icon(Icons.close_rounded),
          onPressed: () {
            Navigator.pop(context); // Go back to the previous screen
          },
        ),
        centerTitle: true,
      ),
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
                  'assets/images/jam.png',
                  height: 180,
                  width: 200,
                ),
                const SizedBox(height: 7),
              ],
            ),
          ).animate(delay: 200.ms).fadeIn(duration: 300.ms),
          Expanded(
            flex: 1,
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Text(
                    'Waktu yang di tunjukkan pada jam diatas adalah ...',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.normal,
                    ),
                  ).animate(delay: 200.ms).fadeIn(duration: 300.ms),
                  SizedBox(
                    height: 2.h,
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      height: 65,
                      width: 100,
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
                        color: const Color.fromRGBO(177, 178, 181, 1),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: const Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(height: 5),
                                Text(
                                  'Dilewati',
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
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
                    onTap: () {},
                    child: Center(
                      child: Container(
                        width: 200,
                        height: 65,
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
                          color: const Color.fromRGBO(161, 213, 245, 100),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: const Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(height: 5),
                                  Text(
                                    '22.30',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ).animate(delay: 200.ms).fadeIn(duration: 300.ms),
                  SizedBox(
                    height: 2.h,
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Center(
                      child: Container(
                        width: 200,
                        height: 65,
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
                        child: const Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(height: 5),
                                  Text(
                                    '21.30',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ).animate(delay: 200.ms).fadeIn(duration: 300.ms),
                  SizedBox(
                    height: 2.h,
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Center(
                      child: Container(
                        width: 200,
                        height: 65,
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
                        child: const Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(height: 5),
                                  Text(
                                    '10.10',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
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
