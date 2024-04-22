import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';
import 'package:study/menu/berita/berita1.dart';

class BeritaHome extends StatefulWidget {
  static String routeName = 'BeritaHome';

  const BeritaHome({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _BeritaHomeState createState() => _BeritaHomeState();
}

class _BeritaHomeState extends State<BeritaHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(186, 252, 182, 1),
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: const Color.fromRGBO(186, 252, 182, 1),
        title: const Text(
          'Berita',
          style: TextStyle(
            fontSize: 20.0,
            fontFamily: 'WorkSans',
            fontWeight: FontWeight.normal,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                padding:
                    EdgeInsetsDirectional.only(top: 2.h, start: 8.w, end: 8.w),
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
                child: ListView(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Berita1(),
                          ),
                        );
                      },
                      child: const BeritaItemWithShimmer(
                        judul: 'Undangan Pentas Seni Anak',
                        deskripsi:
                            'Pentas ini selalu diadakan tiap tahunnya, dengan harap...',
                        thumbnail: AssetImage('assets/images/berita_0.png'),
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: const BeritaItemWithShimmer(
                        judul: 'Acara Perlombaan 17 Agustus',
                        deskripsi:
                            'Dalam rangka hari ulang tahun republik Indonesia, diadakan perlombaan yang...',
                        thumbnail: AssetImage('assets/images/berita_1.png'),
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: const BeritaItemWithShimmer(
                        judul: 'Asesmen Nasional Kelas 5',
                        deskripsi:
                            'Asesmen nasional merupakan sebuah program penilaian terhadap mutu setiap sekolah...',
                        thumbnail: AssetImage('assets/images/berita_2.png'),
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: const BeritaItemWithShimmer(
                        judul: 'Silaturahmi sebelum Ramadhan',
                        deskripsi:
                            'Ramadhan memang menjadi bulan yang istimewa bagi tiap muslim...',
                        thumbnail: AssetImage('assets/images/berita_3.png'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BeritaItemWithShimmer extends StatefulWidget {
  final String judul;
  final String deskripsi;
  final ImageProvider<Object> thumbnail;

  const BeritaItemWithShimmer({
    required this.judul,
    required this.deskripsi,
    required this.thumbnail,
    super.key,
  });

  @override
  // ignore: library_private_types_in_public_api
  _BeritaItemWithShimmerState createState() => _BeritaItemWithShimmerState();
}

class _BeritaItemWithShimmerState extends State<BeritaItemWithShimmer> {
  bool _isLoading = true;

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
    return Column(
      children: [
        ListTile(
          leading: Container(
            width: 30.w,
            height: 500.h,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: _isLoading
                    ? const AssetImage('assets/images/shade.png')
                    : widget.thumbnail,
                fit: BoxFit.fill,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          title: _isLoading
              ? _buildShimmerBox(width: 200.w, height: 4.h)
              : Text(
                  widget.judul,
                  style: const TextStyle(
                    fontSize: 16,
                    fontFamily: 'WorkSans',
                    fontWeight: FontWeight.bold,
                  ),
                ),
          subtitle: _isLoading
              ? _buildShimmerBox(width: 250.w, height: 3.h)
              : Text(
                  widget.deskripsi,
                  style: const TextStyle(
                    fontSize: 12,
                    fontFamily: 'WorkSans',
                    fontWeight: FontWeight.normal,
                  ),
                ),
        ),
        const Divider(),
      ],
    );
  }

  Widget _buildShimmerBox({required double width, required double height}) {
    return SizedBox(
      width: width,
      height: height,
      child: Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: Container(
          color: Colors.white,
        ),
      ),
    );
  }
}

class BeritaItem extends StatelessWidget {
  final String judul;
  final String deskripsi;
  final ImageProvider<Object> thumbnail;

  const BeritaItem({
    required this.judul,
    required this.deskripsi,
    required this.thumbnail,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: Container(
            width: 30.w,
            height: 500.h,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: thumbnail,
                fit: BoxFit.fill,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          title: Text(
            judul,
            style: const TextStyle(
              fontSize: 16,
              fontFamily: 'WorkSans',
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Text(
            deskripsi,
            style: const TextStyle(
              fontSize: 12,
              fontFamily: 'WorkSans',
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
        const Divider(),
      ],
    );
  }
}
