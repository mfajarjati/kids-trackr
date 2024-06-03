import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_animate/flutter_animate.dart';

class Dashboard extends StatefulWidget {
  static String routeName = 'Dashboard';

  const Dashboard({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        title: const Text('Dashboard',
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
                  children: [],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
