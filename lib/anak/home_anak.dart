import 'package:flutter/material.dart';
import 'package:study/anak/latihan/latihan.dart';
import 'package:study/anak/latihan/menu.dart';
import 'package:study/anak/modul.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_animate/flutter_animate.dart';

class Anak extends StatefulWidget {
  static String routeName = 'Anak';

  const Anak({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _AnakState createState() => _AnakState();
}

class _AnakState extends State<Anak> {
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<void> _showExitDialog() async {
    _phoneController.text = "";
    _passwordController.text = "";
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // Prevents dismissing by tapping outside
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Konfirmasi Keluar'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _phoneController,
                decoration: const InputDecoration(
                  labelText: 'Nomor Telepon',
                ),
                keyboardType: TextInputType.phone,
              ),
              TextField(
                controller: _passwordController,
                decoration: const InputDecoration(
                  labelText: 'Password',
                ),
                obscureText: true,
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Batal'),
              onPressed: () {
                _phoneController.text = "";
                _passwordController.text = "";
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Submit'),
              onPressed: () {
                if (_phoneController.text == '123' &&
                    _passwordController.text == '123') {
                  Navigator.of(context).pop();
                  Navigator.of(context).pop(); // Exits the current screen
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        content: Text('Nomor telepon atau password salah')),
                  );
                }
              },
            ),
          ],
        );
      },
    );
  }

  Future<bool> _onWillPop() async {
    await _showExitDialog();
    return false;
  }

  @override
  Widget build(BuildContext context) {
    // ignore: deprecated_member_use
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        appBar: AppBar(
          scrolledUnderElevation: 0,
          backgroundColor: const Color.fromRGBO(186, 252, 182, 1),
          leading: const SizedBox(), // Menghilangkan leading icon
          actions: [
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(width: 4),
                  IconButton(
                    icon: const Icon(Icons.close_rounded),
                    onPressed: _showExitDialog,
                    iconSize: 30,
                  ),
                ],
              ),
            ),
          ],
        ),
        backgroundColor: const Color.fromRGBO(186, 252, 182, 1),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/anak.png',
                    height: 100,
                    width: 100,
                  ),
                  const SizedBox(height: 7),
                  const Text(
                    'Aisha Zahra',
                    style: TextStyle(
                      color: Color.fromRGBO(75, 63, 99, 1),
                      fontSize: 20.0,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'WorkSans',
                    ),
                  ),
                  const Text(
                    '3A',
                    style: TextStyle(
                      color: Color.fromRGBO(75, 63, 99, 1),
                      fontSize: 16.0,
                      fontFamily: 'WorkSans',
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  const SizedBox(height: 15)
                ],
              ).animate(delay: 200.ms).fadeIn(duration: 300.ms),
              Container(
                height: 64.4.h,
                padding:
                    EdgeInsetsDirectional.only(top: 2.h, start: 5.w, end: 5.w),
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
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(height: 2.h),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, Modul.routeName);
                      },
                      child: Container(
                        height: 120,
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
                          color: const Color.fromRGBO(146, 224, 172, 100),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 5),
                                  Text(
                                    '   Modul',
                                    style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    '    Belajar\n    Mandiri',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.normal,
                                      height: 1.1,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Transform.rotate(
                              angle: 0.3,
                              child: Container(
                                width: 33.w,
                                height: 18.h,
                                decoration: BoxDecoration(
                                  image: const DecorationImage(
                                    image:
                                        AssetImage('assets/images/modul.png'),
                                    fit: BoxFit.cover,
                                  ),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ).animate(delay: 200.ms).fadeIn(duration: 300.ms),
                    SizedBox(height: 2.h),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, Menu.routeName);
                      },
                      child: Container(
                        width: 8.w,
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
                          color: const Color.fromRGBO(161, 213, 245, 100),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 5),
                                  Text(
                                    '    Latihan',
                                    style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    '     Kemapuan\n     Mandiri',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.normal,
                                      height: 1.1,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Transform.rotate(
                              angle: 0.3,
                              child: Container(
                                width: 33.w,
                                height: 18.h,
                                decoration: BoxDecoration(
                                  image: const DecorationImage(
                                    image:
                                        AssetImage('assets/images/tugas.png'),
                                    fit: BoxFit.cover,
                                  ),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ).animate(delay: 200.ms).fadeIn(duration: 300.ms),
                    SizedBox(height: 4.h),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        width: 8.w,
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
                          color: Color.fromARGB(156, 193, 161, 245),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 5),
                                  Text(
                                    '    Dashboard',
                                    style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    '     Kemampuan\n     Anak',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.normal,
                                      height: 1.1,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Transform.rotate(
                              angle: 0.3,
                              child: Container(
                                width: 33.w,
                                height: 18.h,
                                decoration: BoxDecoration(
                                  image: const DecorationImage(
                                    image: AssetImage(
                                        'assets/images/dashboard1.png'),
                                    fit: BoxFit.cover,
                                  ),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ).animate(delay: 200.ms).fadeIn(duration: 300.ms),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
