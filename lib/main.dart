import 'package:flutter/material.dart';
import 'package:study/anak/latihan/level1.dart';
import 'package:study/menu/berita/beritahome.dart';
import 'package:study/my_profile/pembayaran/lunas.dart';
import 'package:study/my_profile/pembayaran/tabb.dart';
import 'package:sizer/sizer.dart';
import 'my_profile/profile.dart';
import 'my_profile/about/about.dart';
import 'my_profile/pengaturan/setting.dart';
import 'my_profile/pembayaran/payment.dart';
import 'my_profile/update/update.dart';
import 'package:study/home.dart';
import 'package:study/login.dart';
import 'package:study/started.dart';
import 'package:study/menu/gizi.dart';
import 'package:study/menu/pesan.dart';
import 'package:study/menu/absensi/absensi.dart';
import 'package:study/menu/pelajaran/mapel.dart';
import 'package:study/menu/pelajaran/senin.dart';
import 'package:study/menu/pelajaran/selasa.dart';
import 'package:study/menu/pelajaran/rabu.dart';
import 'package:study/menu/pelajaran/kamis.dart';
import 'package:study/menu/pelajaran/jumat.dart';
import 'package:study/menu/penilaian/penilaian.dart';
import 'package:study/menu/penilaian/semesterone.dart';
import 'package:study/menu/penilaian/semestertwo.dart';
import 'package:study/anak/home_anak.dart';
import 'package:study/anak/modul.dart';
import 'package:study/anak/berhitung.dart';
import 'package:study/menu/penilaian/matpel.dart';
import 'package:study/anak/latihan/latihan.dart';

// import 'package:study/menu/perjalanan/rute.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, device) {
      return MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        debugShowCheckedModeBanner: false,
        routes: {
          StaredPage.routeName: (context) => const StaredPage(),
          LoginPage.routeName: (context) => const LoginPage(),
          Home.routeName: (context) => const Home(),
          Gizi.routeName: (context) => const Gizi(),
          Pesan.routeName: (context) => const Pesan(),
          Absensi.routeName: (context) => const Absensi(),
          Mapel.routeName: (context) => const Mapel(),
          Senin.routeName: (context) => const Senin(),
          Selasa.routeName: (context) => const Selasa(),
          Rabu.routeName: (context) => const Rabu(),
          Kamis.routeName: (context) => const Kamis(),
          Jumat.routeName: (context) => const Jumat(),
          Penilaian.routeName: (context) => const Penilaian(),
          Matpel.routeName: (context) => const Matpel(),
          SemesterOne.routeName: (context) => const SemesterOne(),
          SemesterTwo.routeName: (context) => const SemesterTwo(),
          // Rute.routeName: (context) => const Rute(),
          BeritaHome.routeName: (context) => const BeritaHome(),
          ProfileDetail.routeName: (context) => const ProfileDetail(),
          About.routeName: (context) => const About(),
          Pengaturan.routeName: (context) => const Pengaturan(),
          Update.routeName: (context) => const Update(),
          Pembayaran.routeName: (context) => const Pembayaran(),
          Tabb.routeName: (context) => const Tabb(),
          Lunas.routeName: (context) => const Lunas(),
          Anak.routeName: (context) => const Anak(),
          Modul.routeName: (context) => const Modul(),
          Berhitung.routeName: (context) => const Berhitung(),
          Latihan.routeName: (context) => const Latihan(),
          LevelOne.routeName: (context) => const LevelOne(),
        },
        initialRoute: StaredPage.routeName,
      );
    });
  }
}
