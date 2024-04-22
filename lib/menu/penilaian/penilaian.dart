import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:study/menu/penilaian/semesterone.dart';
import 'package:study/menu/penilaian/semestertwo.dart';
import 'package:sizer/sizer.dart';

class Penilaian extends StatefulWidget {
  const Penilaian({super.key});
  static const String routeName = 'Penilaian';

  @override
  // ignore: library_private_types_in_public_api
  _PenilaianState createState() => _PenilaianState();
}

class _PenilaianState extends State<Penilaian> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(186, 252, 182, 1),
      appBar: AppBar(
        title: const Text(
          'Penilaian',
          style: TextStyle(
            fontSize: 20.0,
            fontFamily: 'WorkSans',
            fontWeight: FontWeight.normal,
          ),
        ),
        backgroundColor: const Color.fromRGBO(186, 252, 182, 1),
        centerTitle: true,
      ),
      body: CustomScrollView(
        physics: const NeverScrollableScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                Container(
                  height: 100,
                  decoration: const BoxDecoration(
                    color: Color.fromRGBO(186, 252, 182, 1),
                  ),
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      //SizedBox(height: 7),
                      Text(
                        'Aisha Zahra',
                        style: TextStyle(
                          color: Color.fromRGBO(75, 63, 99, 1),
                          fontSize: 20.0,
                          fontFamily: 'WorkSans',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '3A',
                        style: TextStyle(
                          color: Color.fromRGBO(75, 63, 99, 1),
                          fontSize: 12.0,
                          fontFamily: 'WorkSans',
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      SizedBox(height: 1),
                    ],
                  ),
                ).animate(delay: 200.ms).fadeIn(duration: 300.ms),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        borderRadius: BorderRadius.circular(30),
                        onTap: () {
                          setState(() {
                            _selectedIndex = 0;
                          });
                        },
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          padding: const EdgeInsets.all(8),
                          width: 155,
                          decoration: BoxDecoration(
                            color: _selectedIndex == 0
                                ? Colors.white
                                : const Color.fromRGBO(0, 0, 0, 0.05),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Center(
                            child: Text(
                              "Semester 1",
                              style: TextStyle(
                                color: const Color.fromRGBO(75, 63, 99, 1),
                                fontSize: 15.0,
                                fontFamily: 'WorkSans',
                                fontWeight: _selectedIndex == 0
                                    ? FontWeight.bold
                                    : FontWeight.normal,
                              ),
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        borderRadius: BorderRadius.circular(30),
                        onTap: () {
                          setState(() {
                            _selectedIndex = 1;
                          });
                        },
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          padding: const EdgeInsets.all(8),
                          width: 155,
                          decoration: BoxDecoration(
                            color: _selectedIndex == 1
                                ? Colors.white
                                : const Color.fromRGBO(0, 0, 0, 0.05),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Center(
                            child: Text(
                              "Semester 2",
                              style: TextStyle(
                                color: const Color.fromRGBO(75, 63, 99, 1),
                                fontSize: 15.0,
                                fontFamily: 'WorkSans',
                                fontWeight: _selectedIndex == 1
                                    ? FontWeight.bold
                                    : FontWeight.normal,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 80.h,
                  child: _selectedIndex == 0
                      ? const SemesterOne()
                      : const SemesterTwo(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
