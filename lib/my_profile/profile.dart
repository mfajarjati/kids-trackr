import 'package:flutter/material.dart';
import 'package:study/my_profile/about/about.dart';
import 'package:sizer/sizer.dart';
// import 'package:study/my_profile/pengaturan/setting.dart';
import 'package:study/my_profile/pembayaran/tabb.dart';
import 'package:study/my_profile/update/update.dart';
import 'package:study/anak/home_anak.dart';
//import 'package:study/started.dart';

class ProfileDetail extends StatefulWidget {
  static String routeName = 'ProfileDetail';

  const ProfileDetail({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ProfileDetailState createState() => _ProfileDetailState();
}

class _ProfileDetailState extends State<ProfileDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color.fromRGBO(186, 252, 182, 1),
      appBar: AppBar(
        title: const Text(
          'Profile',
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
      body: Column(
        children: [
          Container(
            height: 200,
            decoration: const BoxDecoration(
              color: Color.fromRGBO(186, 252, 182, 100),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/profile.png',
                  height: 100,
                  width: 100,
                ),
                const SizedBox(height: 7),
                const Text(
                  'Nita Sarah',
                  style: TextStyle(
                    color: Color.fromRGBO(75, 63, 99, 1),
                    fontSize: 20.0,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'WorkSans',
                  ),
                ),
                const Text(
                  'Hp: 083820194591',
                  style: TextStyle(
                    color: Color.fromRGBO(75, 63, 99, 1),
                    fontSize: 16.0,
                    fontFamily: 'WorkSans',
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              height: 200,
              padding: EdgeInsets.only(left: 6.w, right: 7.w, top: 5.w),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(
                      SizerUtil.deviceType == DeviceType.tablet ? 60 : 40),
                  topRight: Radius.circular(
                      SizerUtil.deviceType == DeviceType.tablet ? 60 : 40),
                ),
              ),
              child: Column(
                children: [
                  ListTile(
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 2.0, vertical: 8.0),
                    leading: const Icon(Icons.face),
                    title: const Text('Mode Anak'),
                    trailing: const Icon(Icons.arrow_forward_ios),
                    onTap: () {
                      Navigator.pushNamed(context, Anak.routeName);
                    },
                  ),
                  ListTile(
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 2.0, vertical: 8.0),
                    leading: const Icon(Icons.payment),
                    title: const Text('Pembayaran'),
                    trailing: const Icon(Icons.arrow_forward_ios),
                    onTap: () {
                      Navigator.pushNamed(context, Tabb.routeName);
                    },
                  ),
                  ListTile(
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 2.0, vertical: 8.0),
                    selectedTileColor: Colors.grey,
                    leading: const Icon(Icons.person),
                    title: const Text('Lihat Data Diri'),
                    trailing: const Icon(Icons.arrow_forward_ios),
                    onTap: () {
                      Navigator.pushNamed(context, Update.routeName);
                    },
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, About.routeName);
                    },
                    onHover: (isHovering) {
                      // Lakukan sesuatu saat widget dihover (opsional)
                      // Misalnya, mengubah warna teks atau ikon
                    },
                    child: const ListTile(
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 2.0, vertical: 8.0),
                      leading: Icon(Icons.info),
                      title: Text('Tentang'),
                      trailing: Icon(Icons.arrow_forward_ios),
                    ),
                  ),
                  const Divider(
                    color: Colors.grey, // Adjust color as needed
                    thickness: 1, // Adjust thickness as needed
                    height: 20,
                  ),
                  ListTile(
                    selectedTileColor: Colors.grey,
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 2.0, vertical: 8.0),
                    leading: const Icon(Icons.exit_to_app),
                    title: const Text('Log Out'),
                    trailing: const Icon(Icons.arrow_forward_ios),
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const Text('Konfirmasi'),
                          content:
                              const Text('Apakah Anda yakin ingin keluar?'),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.of(context).pop(),
                              child: const Text('Batal'),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                                Navigator.pop(context);
                                Navigator.pop(context);

                                //Navigator.pushNamed(context, StaredPage.routeName);
                              },
                              child: const Text('Keluar'),
                            ),
                          ],
                        ),
                      );
                    },
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
