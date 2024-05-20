import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:study/guru/home_guru.dart';

class LoginGuru extends StatefulWidget {
  static String routeName = 'LoginGuru';

  const LoginGuru({super.key});

  @override
  State<LoginGuru> createState() => _LoginGuruState();
}

class _LoginGuruState extends State<LoginGuru> {
  final _formField = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool passToggle = true;

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color.fromRGBO(186, 252, 182, 1),
      body: SingleChildScrollView(
        child: Form(
          key: _formField,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //f O R M    E M A I L
              Animate(
                effects: const [FadeEffect(), ScaleEffect()],
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 10.h,
                    ),
                    //E  M  A  I  L
                    TextFormField(
                      keyboardType: TextInputType.phone,
                      controller: emailController,
                      decoration: InputDecoration(
                        labelText: "Nomor Induk Pegawai",
                        prefixIcon: const Icon(
                          Icons.person,
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
                      keyboardType: TextInputType.visiblePassword,
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
                        Navigator.pushNamed(context, Guru.routeName);
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
