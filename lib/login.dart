import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:study/login_guru.dart';
import 'package:study/login_ortu.dart';

class LoginPage extends StatefulWidget {
  static String routeName = 'LoginPage';

  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formField = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  int _selectedIndex = 0;
  bool passToggle = true;

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color.fromRGBO(186, 252, 182, 1),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(186, 252, 182, 1),
        elevation: 0.sp,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_rounded,
            size: 30.sp,
            color: const Color.fromRGBO(79, 69, 87, 1),
          ),
        ),
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Container(
              color: Colors.transparent,
            ),
          ),
          Positioned(
            bottom: 0,
            child: Image.asset(
              "assets/images/school.png",
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 2.w,
              right: 2.w,
            ),
            child: Form(
              key: _formField,
              child: Column(
                children: [
                  //J U D U L
                  Animate(
                    effects: const [FadeEffect(), ScaleEffect()],
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: Text(
                        'Kids Trackr',
                        style: TextStyle(
                          fontSize: 62.sp,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w700,
                          color: const Color.fromRGBO(79, 69, 87, 1),
                          height: 0.8.h,
                          fontStyle: FontStyle.normal,
                          shadows: <Shadow>[
                            Shadow(
                              offset: Offset(4.0.w, 4.0.h),
                              color: const Color.fromRGBO(109, 93, 110, 0.2),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  //f O R M    E M A I L
                  Animate(
                    effects: const [FadeEffect(), ScaleEffect()],
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          //Pilih jenis login
                          Row(
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
                                      "Orang Tua",
                                      style: TextStyle(
                                        color:
                                            const Color.fromRGBO(75, 63, 99, 1),
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
                                      "Guru",
                                      style: TextStyle(
                                        color:
                                            const Color.fromRGBO(75, 63, 99, 1),
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
                          SizedBox(
                            height: 190.h,
                            child: _selectedIndex == 0
                                ? const LoginOrtu()
                                : const LoginGuru(),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
