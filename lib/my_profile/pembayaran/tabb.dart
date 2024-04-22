import 'package:flutter/material.dart';
import 'package:study/my_profile/pembayaran/lunas.dart';
import 'package:study/my_profile/pembayaran/payment.dart';
import 'package:sizer/sizer.dart';

class Tabb extends StatefulWidget {
  const Tabb({super.key});
  static const String routeName = 'Tabb';

  @override
  // ignore: library_private_types_in_public_api
  _TabbState createState() => _TabbState();
}

class _TabbState extends State<Tabb> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(186, 252, 182, 1),
      appBar: AppBar(
        title: const Text(
          'Pembayaran',
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
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  height: 170,
                  decoration: const BoxDecoration(
                    color: Color.fromRGBO(186, 252, 182, 1),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/payment.png',
                        height: 100,
                        width: 100,
                      ),
                      const SizedBox(height: 7),
                      const Text(
                        'Tagihan Anda saat ini',
                        style: TextStyle(
                          color: Color.fromRGBO(75, 63, 99, 1),
                          fontSize: 16.0,
                          fontFamily: 'WorkSans',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 1),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                              "Tagihan",
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
                              "Lunas",
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
                  height: 60.h,
                  child:
                      _selectedIndex == 0 ? const Pembayaran() : const Lunas(),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
