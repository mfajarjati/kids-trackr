import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:study/home.dart';

class LoginPage extends StatefulWidget {
  static String routeName = 'LoginPage';

  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formField = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
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
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //J U D U L
                  Animate(
                    effects: const [FadeEffect(), ScaleEffect()],
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: Text(
                        'Kids Trackr',
                        style: TextStyle(
                          fontSize: 72.sp,
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
                  //f O R M    E M A I L
                  Animate(
                    effects: const [FadeEffect(), ScaleEffect()],
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: 20.w,
                        right: 20.w,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          //E  M  A  I  L
                          SizedBox(
                            height: 4.h,
                          ),
                          TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            controller: emailController,
                            decoration: InputDecoration(
                              labelText: "Nomor Handphone",
                              prefixIcon: const Icon(
                                Icons.phone,
                                color: Color.fromRGBO(79, 69, 87, 1),
                              ),
                              enabledBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color.fromRGBO(177, 178, 181, 1),
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: const Color.fromRGBO(177, 178, 181, 1),
                                  width: 2.0.w,
                                ),
                              ),
                              labelStyle: TextStyle(
                                color: Colors.black,
                                fontSize: 15.sp,
                              ),
                            ),
                          ),
                          //P  A  S  S  W  O  R  D
                          SizedBox(height: 10.h),
                          TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            controller: passwordController,
                            obscureText: passToggle,
                            decoration: InputDecoration(
                              labelText: "Password",
                              prefixIcon: const Icon(
                                Icons.lock,
                                color: Color.fromRGBO(79, 69, 87, 1),
                              ),
                              enabledBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color.fromRGBO(177, 178, 181, 1),
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: const Color.fromRGBO(177, 178, 181, 1),
                                  width: 2.0.w,
                                ),
                              ),
                              labelStyle: TextStyle(
                                color: Colors.black,
                                fontSize: 15.sp,
                              ),
                              suffixIcon: InkWell(
                                onTap: () {
                                  setState(() {
                                    passToggle = !passToggle;
                                  });
                                },
                                child: Icon(
                                  passToggle
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: const Color.fromRGBO(79, 69, 87, 1),
                                ),
                              ),
                            ),
                          ),
                          //b u t t o n   s i g n   I N
                          SizedBox(height: 15.h),
                          InkWell(
                            onTap: () {
                              Navigator.pushNamed(context, Home.routeName);
                            },
                            child: Container(
                              width: 192.w,
                              height: 40.h,
                              decoration: BoxDecoration(
                                color: const Color.fromRGBO(255, 255, 255, 1),
                                borderRadius: BorderRadius.circular(5),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Color.fromRGBO(0, 0, 0, 0.2),
                                    spreadRadius: 0,
                                    blurRadius: 4,
                                    offset: Offset(4, 4),
                                  )
                                ],
                              ),
                              child: Center(
                                child: Text(
                                  " Sign In",
                                  style: TextStyle(
                                    color: const Color.fromRGBO(79, 69, 87, 1),
                                    fontSize: 24.sp,
                                    fontFamily: 'Work Sans',
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          //F O R G O T   P A S S W O R D
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              TextButton(
                                onPressed: () {},
                                child: Text(
                                  "Forgot Password?",
                                  style: TextStyle(
                                    fontStyle: FontStyle.normal,
                                    fontSize: 9.sp,
                                    fontFamily: 'Work Sans',
                                    fontWeight: FontWeight.w500,
                                    color: const Color.fromRGBO(79, 69, 87, 1),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 250.h),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
