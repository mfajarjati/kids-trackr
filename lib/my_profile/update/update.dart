import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:shimmer/shimmer.dart';

class Update extends StatefulWidget {
  const Update({super.key});
  static String routeName = 'Update';

  @override
  // ignore: library_private_types_in_public_api
  _UpdateState createState() => _UpdateState();
}

class _UpdateState extends State<Update> {
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    // Simulasi penundaan untuk menunjukkan efek shimmer
    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        _isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color.fromRGBO(186, 252, 182, 1),
      appBar: AppBar(
        scrolledUnderElevation: 0,
        title: const Text(
          'Data Diri',
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
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context)
              .unfocus(); // Menutup keyboard saat area luar form disentuh
        },
        child: Column(
          children: [
            Container(
              height: 140,
              decoration: const BoxDecoration(
                color: Color.fromRGBO(186, 252, 182, 1),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/update.png',
                    height: 100,
                    width: 100,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.w),
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
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 1.h),
                        child: const Text(
                          'Data Orang Tua',
                          style: TextStyle(
                            color: Color.fromRGBO(75, 63, 99, 1),
                            fontSize: 15.0,
                            fontFamily: 'WorkSans',
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      _isLoading
                          ? _buildShimmerTextContainer()
                          : const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Nama',
                                  style: TextStyle(
                                    color: Color.fromRGBO(79, 69, 87, 50),
                                    fontSize: 13.0,
                                    fontFamily: 'WorkSans',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                SizedBox(
                                  height: 3,
                                ), // Spasi antara label dan teks nomor telepon
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Nita Sarah',
                                      style: TextStyle(
                                        height: 1.0,
                                        fontSize: 16,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                    Icon(
                                      Icons.lock,
                                      size: 20,
                                      color: Color.fromRGBO(75, 63, 99, 1),
                                    ),
                                  ],
                                ),
                                Divider(), // Garis pembatas
                              ],
                            ),
                      const SizedBox(height: 20),
                      _isLoading
                          ? _buildShimmerTextContainer()
                          : const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Nomor Telepon',
                                  style: TextStyle(
                                    color: Color.fromRGBO(79, 69, 87, 50),
                                    fontSize: 13.0,
                                    fontFamily: 'WorkSans',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                SizedBox(
                                  height: 3,
                                ), // Spasi antara label dan teks nomor telepon
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      '083820194591',
                                      style: TextStyle(
                                        height: 1.0,
                                        fontSize: 16,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                    Icon(
                                      Icons.lock,
                                      size: 20,
                                      color: Color.fromRGBO(75, 63, 99, 1),
                                    ),
                                  ],
                                ),
                                Divider(), // Garis pembatas
                              ],
                            ),
                      const SizedBox(height: 20),
                      _isLoading
                          ? _buildShimmerTextContainer()
                          : const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Password',
                                  style: TextStyle(
                                    color: Color.fromRGBO(79, 69, 87, 50),
                                    fontSize: 13.0,
                                    fontFamily: 'WorkSans',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                SizedBox(
                                  height: 3,
                                ), // Spasi antara label dan teks nomor telepon
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      '********',
                                      style: TextStyle(
                                        height: 1.0,
                                        fontSize: 16,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                    Icon(
                                      Icons.lock,
                                      size: 20,
                                      color: Color.fromRGBO(75, 63, 99, 1),
                                    ),
                                  ],
                                ),
                                Divider(), // Garis pembatas
                              ],
                            ),
                      const SizedBox(height: 8),
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'Data Anak',
                          style: TextStyle(
                            color: Color.fromRGBO(75, 63, 99, 1),
                            fontSize: 15.0,
                            fontFamily: 'WorkSans',
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      _isLoading
                          ? _buildShimmerTextContainer()
                          : const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Nama',
                                  style: TextStyle(
                                    color: Color.fromRGBO(79, 69, 87, 50),
                                    fontSize: 13.0,
                                    fontFamily: 'WorkSans',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                SizedBox(
                                  height: 3,
                                ), // Spasi antara label dan teks nomor telepon
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Aisha Zahra',
                                      style: TextStyle(
                                        height: 1.0,
                                        fontSize: 16,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                    Icon(
                                      Icons.lock,
                                      size: 20,
                                      color: Color.fromRGBO(75, 63, 99, 1),
                                    ),
                                  ],
                                ),
                                Divider(), // Garis pembatas
                              ],
                            ),
                      const SizedBox(height: 20),
                      _isLoading
                          ? _buildShimmerTextContainer()
                          : const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Kelas',
                                  style: TextStyle(
                                    color: Color.fromRGBO(79, 69, 87, 50),
                                    fontSize: 13.0,
                                    fontFamily: 'WorkSans',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                SizedBox(
                                  height: 3,
                                ), // Spasi antara label dan teks nomor telepon
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      '3A',
                                      style: TextStyle(
                                        height: 1.0,
                                        fontSize: 16,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                    Icon(
                                      Icons.lock,
                                      size: 20,
                                      color: Color.fromRGBO(75, 63, 99, 1),
                                    ),
                                  ],
                                ),
                                Divider(), // Garis pembatas
                              ],
                            ),
                      SizedBox(height: 4.h),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildShimmerTextContainer() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: Container(
            width: 100,
            height: 16,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 3),
        Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: Container(
            width: 150,
            height: 16,
            color: Colors.white,
          ),
        ),
        const Divider(),
      ],
    );
  }
}
