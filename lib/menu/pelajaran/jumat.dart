import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:animation_list/animation_list.dart';

class Jumat extends StatefulWidget {
  const Jumat({super.key});
  static String routeName = 'Jumat';

  @override
  // ignore: library_private_types_in_public_api
  _JumatState createState() => _JumatState();
}

class _JumatState extends State<Jumat> {
  List<Map<String, String>> activities = [
    {
      'type': 'Pembelajaran',
      'title': 'Pendidikan Kewarganegaraan',
      'time': 'Jam 07.00 - 08.30',
    },
    {
      'type': 'Pembelajaran',
      'title': 'Pendidikan Keagamaan',
      'time': 'Jam 08.30 - 10.00',
    },
    {
      'type': 'Kegiatan',
      'title': 'Istirahat',
      'time': 'Jam 10.00 - 10.30',
    },
    {
      'type': 'Pembelajaran',
      'title': 'Ilmu Pengetahuan Alam',
      'time': 'Jam 10.30 - 11.45',
    },
    {
      'type': 'Kegiatan',
      'title': 'Istirahat',
      'time': 'Jam 11.45 - 13.00',
    },
    {
      'type': 'Pembelajaran',
      'title': 'Komputer',
      'time': 'Jam 13.00 - 14.00',
    },
    {
      'type': 'Kegiatan',
      'title': 'Kepulangan',
      'time': 'Jam 14.00 - 15.00',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(186, 252, 182, 1),
      body: Column(
        children: [
          const SizedBox(height: 20),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 8.w),
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
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 7,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: AnimationList(
                padding: const EdgeInsetsDirectional.only(top: 15),
                duration: 1000,
                reBounceDepth: 10.0,
                children: _buildActivityContainers(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildActivityContainers() {
    List<Widget> containers = [];
    for (int i = 0; i < activities.length; i += 3) {
      List<Widget> children = [];
      for (int j = i; j < i + 3 && j < activities.length; j++) {
        children.add(_buildActivityContainer(activities[j]['type']!,
            activities[j]['title']!, activities[j]['time']!));
      }
      containers.add(Column(children: children));
    }
    // Memastikan iterasi kedua tetap terjadi jika jumlah aktivitas tidak habis dibagi 3
    if (activities.length % 3 != 0) {
      containers.add(_buildActivityContainer(
          activities[activities.length - 1]['type']!,
          activities[activities.length - 1]['title']!,
          activities[activities.length - 1]['time']!));
    }
    return containers;
  }

  Widget _buildActivityContainer(String type, String title, String time) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10, top: 10, right: 5, left: 5),
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                type,
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.normal,
                ),
              ),
              Text(
                time,
                style: TextStyle(
                  fontSize: 9.sp,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ],
          ),
          Text(
            title,
            style: TextStyle(
              height: 0.9,
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
