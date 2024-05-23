import 'dart:async';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sizer/sizer.dart';
import 'package:shimmer/shimmer.dart';
import 'package:super_tooltip/super_tooltip.dart';

class LihatNilai extends StatefulWidget {
  const LihatNilai({super.key});
  static String routeName = 'LihatNilai';

  @override
  // ignore: library_private_types_in_public_api
  _LihatNilaiState createState() => _LihatNilaiState();
}

class _LihatNilaiState extends State<LihatNilai> {
  bool _isLoading = true;
  String _selectedSemester = 'Semester 1';

  final List<String> _semesterList = [
    "Semester 1",
    "Semester 2",
  ];

  final List<Map<String, String>> _semester1Grades = [
    {
      'title': 'Tugas 1',
      'subject': 'Tema 1: Diriku',
      'tooltip': 'Nilai Tugas 1 sudah bagus dan tolong dipertahankan',
      'score': '100'
    },
    {
      'title': 'Tugas 2',
      'subject': 'Tema 2: Kegemaranku',
      'tooltip': 'Nilai Tugas 2 sudah bagus dan tolong dipertahankan',
      'score': '90'
    },
    {
      'title': 'Tugas 3',
      'subject': 'Tema 3: Kegiatanku',
      'tooltip': 'Nilai Tugas 3 sudah bagus dan tolong dipertahankan',
      'score': '100'
    },
    {
      'title': 'UTS',
      'subject': 'Tema 4: Keluargaku',
      'tooltip': 'Nilai UTS sudah bagus dan tolong dipertahankan',
      'score': '90'
    },
  ];

  final List<Map<String, String>> _semester2Grades = [
    {
      'title': 'Tugas 4',
      'subject': 'Tema 5: Pengalamanku',
      'tooltip': 'Nilai Tugas 4 sudah bagus dan tolong dipertahankan',
      'score': '90'
    },
    {
      'title': 'Tugas 5',
      'subject': 'Tema 6: Lingkungan bersih, sehat, dan asri',
      'tooltip': 'Nilai Tugas 5 sudah bagus dan tolong dipertahankan',
      'score': '95'
    },
    {
      'title': 'Quiz',
      'subject': 'Tema 7: Benda, hewan, dan tanaman di sekitarku',
      'tooltip': 'Nilai Quiz cukup bagus dan perlu ditingkatkan',
      'score': '80'
    },
    {
      'title': 'UAS',
      'subject': 'Tema 8: Peristiwa alam',
      'tooltip': 'Nilai UAS cukup bagus dan perlu ditingkatkan',
      'score': '85'
    },
  ];

  @override
  void initState() {
    super.initState();
    Timer(const Duration(milliseconds: 300), () {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> grades =
        _selectedSemester == 'Semester 1' ? _semester1Grades : _semester2Grades;

    return Scaffold(
      backgroundColor: const Color.fromRGBO(186, 252, 182, 1),
      body: Column(
        children: [
          const SizedBox(height: 20),
          Expanded(
            child: Container(
              padding: EdgeInsets.only(left: 7.w, right: 7.w, top: 3.w),
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
              child: Container(
                margin: EdgeInsets.only(top: 1.h, bottom: 3.h),
                padding: EdgeInsets.symmetric(horizontal: 1.w),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      DropdownButton<String>(
                        value: _selectedSemester,
                        onChanged: (String? newValue) {
                          setState(() {
                            _selectedSemester = newValue!;
                          });
                        },
                        items: _semesterList
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                      const SizedBox(height: 20),
                      for (var grade in grades) ...[
                        _buildRow(grade['title']!, grade['tooltip']!,
                            grade['score']!),
                        const Divider(
                          color: Colors.grey,
                          thickness: 1,
                          height: 20,
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                      ],
                      _isLoading
                          ? _buildShimmerContainer()
                          : Container(
                              margin: EdgeInsets.symmetric(vertical: 1.h),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 5.w, vertical: 3.h),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5.w),
                                border: Border.all(
                                  color: Colors.grey.withOpacity(0.5),
                                ),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Refleksi perkembangan anak akhir semester',
                                    style: TextStyle(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                  const Divider(
                                    color: Colors.grey,
                                    thickness: 1,
                                    height: 20,
                                  ),
                                  SizedBox(height: 2.h),
                                  Text(
                                    'Selama satu semester Ananda sudah bagus dan lulus ke tingkat selanjutnya',
                                    style: TextStyle(fontSize: 14.sp),
                                  ),
                                  SizedBox(height: 2.h),
                                ],
                              ),
                            ),
                      SizedBox(height: 2.h),
                      _isLoading
                          ? _buildShimmerButton()
                          : ElevatedButton(
                              onPressed: () {
                                Fluttertoast.showToast(
                                    msg: "Rapot telah diunduh",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.CENTER,
                                    timeInSecForIosWeb: 1,
                                    textColor: Colors.white,
                                    fontSize: 16.0);
                              },
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                backgroundColor:
                                    const Color.fromRGBO(76, 66, 83, 1),
                                foregroundColor: Colors.white,
                                elevation: 5.0,
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 105.0,
                                  vertical: 15.0,
                                ),
                              ),
                              child: const Text('Unduh Rapot'),
                            ),
                      SizedBox(height: 10.h),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRow(String title, String tooltip, String score) {
    return _isLoading
        ? _buildShimmerRow()
        : Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          title,
                          style: const TextStyle(
                            height: 1.0,
                            fontSize: 16,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        SuperTooltip(
                          content: Text(
                            tooltip,
                            softWrap: true,
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          backgroundColor: Colors.black12,
                          popupDirection: TooltipDirection.right,
                          child: const SizedBox(
                            width: 30,
                            child: Icon(
                              Icons.contact_support,
                              color: Colors.black,
                              size: 17,
                            ),
                          ),
                        ),
                      ],
                    ),
                    // Wrap(
                    //   children: [
                    //     Text(
                    //       subject,
                    //       style: const TextStyle(
                    //         height: 1.0,
                    //         fontSize: 14,
                    //         fontWeight: FontWeight.w300,
                    //       ),
                    //     ),
                    //   ],
                    // ),
                  ],
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                      width:
                          10), // Add some spacing between the tooltip and score
                  Text(
                    score,
                    style: const TextStyle(
                      height: 1.1,
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
            ],
          );
  }

  Widget _buildShimmerRow() {
    return SizedBox(
      height: 40, // Adjusted to accommodate two lines of text
      child: Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 80,
                  height: 20,
                  color: Colors.white,
                ),
                Container(
                  width: 60,
                  height: 20,
                  color: Colors.white,
                ),
              ],
            ),
            Container(
              width: 30,
              height: 20,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildShimmerContainer() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 1.h),
      padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 3.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5.w),
        border: Border.all(
          color: Colors.grey.withOpacity(0.5),
        ),
      ),
      child: Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 12.sp,
              color: Colors.white,
            ),
            const Divider(
              color: Colors.grey,
              thickness: 1,
              height: 20,
            ),
            SizedBox(height: 2.h),
            Container(
              width: double.infinity,
              height: 14.sp,
              color: Colors.white,
            ),
            SizedBox(height: 2.h),
          ],
        ),
      ),
    );
  }

  Widget _buildShimmerButton() {
    return SizedBox(
      width: double.infinity,
      child: Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            backgroundColor: Colors.white,
            elevation: 0,
          ),
          child: const Text('Unduh Rapot'),
        ),
      ),
    );
  }
}
