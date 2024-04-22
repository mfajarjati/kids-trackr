import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class About extends StatelessWidget {
  const About({super.key});
  static String routeName = 'About';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Set background color for entire app
      backgroundColor: const Color.fromRGBO(186, 252, 182, 1),
      appBar: AppBar(
        title: const Text(
          'About',
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
        // Use Column for vertical layout
        children: [
          // Header section
          Container(
            height: 50,
            decoration: const BoxDecoration(
              color: Color.fromRGBO(186, 252, 182, 1),
            ),
          ),

          // Menu section
          Expanded(
            // Make container fill remaining space
            child: Container(
              padding: EdgeInsets.only(left: 6.w, right: 7.w),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(
                      SizerUtil.deviceType == DeviceType.tablet ? 60 : 40),
                  topRight: Radius.circular(
                      SizerUtil.deviceType == DeviceType.tablet ? 60 : 40),
                ),
              ),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Kids\nTrackr',
                    style: TextStyle(
                      height: 1.1,
                      fontSize: 80,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Inter',
                      color: Color.fromRGBO(75, 63, 99, 1),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    'v1.0',
                    style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'WorkSans',
                        fontWeight: FontWeight.w500),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 40), // Add some space between texts
                  Text(
                    'Selamat datang di aplikasi Kids Trackr,',
                    style: TextStyle(
                        fontSize: 14,
                        fontFamily: 'WorkSans',
                        fontWeight: FontWeight.w500),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    'aplikasi ini ditujukan untuk memonitoring',
                    style: TextStyle(
                        fontSize: 14,
                        fontFamily: 'WorkSans',
                        fontWeight: FontWeight.w500),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    'anak di sekolah.',
                    style: TextStyle(
                        fontSize: 14,
                        fontFamily: 'WorkSans',
                        fontWeight: FontWeight.w500),
                    textAlign: TextAlign.center,
                  ),
                  Divider(
                    color: Color.fromARGB(10, 255, 255, 255),
                    thickness: 1.0,
                    height: 10.0,
                  ),
                  SizedBox(height: 20),
                  Divider(
                    color: Colors.grey, // Adjust color as needed
                    thickness: 1, // Adjust thickness as needed
                    height: 20,
                  ),
                  SizedBox(height: 20),
                  Text(
                    'By',
                    style: TextStyle(
                        fontSize: 14,
                        fontFamily: 'WorkSans',
                        fontWeight: FontWeight.w500),
                    textAlign: TextAlign.center,
                  ),

                  Text(
                    'Destya Aulia Nurul Hutami',
                    style: TextStyle(
                        fontSize: 14,
                        fontFamily: 'WorkSans',
                        fontWeight: FontWeight.w500),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    'Muhammad Fajar Jati Permana',
                    style: TextStyle(
                        fontSize: 14,
                        fontFamily: 'WorkSans',
                        fontWeight: FontWeight.w500),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    'Wildan Tisna Surya Nugraha',
                    style: TextStyle(
                        fontSize: 14,
                        fontFamily: 'WorkSans',
                        fontWeight: FontWeight.w500),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 100),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
