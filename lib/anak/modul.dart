import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';
import 'package:study/anak/berhitung.dart';

class Modul extends StatefulWidget {
  static String routeName = 'Modul';

  const Modul({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ModulState createState() => _ModulState();
}

class _ModulState extends State<Modul> {
  String selectedCategory = '';
  List<ModulItem> modulItems = [
    const ModulItem(
      judul: 'Belajar Membaca Waktu',
      kategori: 'Berhitung',
      thumbnail: AssetImage('assets/images/gambar_jam.png'),
    ),
    const ModulItem(
      judul: 'Bagian-bagian batang tumbuhan',
      kategori: 'Ilmu Alam',
      thumbnail: AssetImage('assets/images/tumbuhan.png'),
    ),
    const ModulItem(
      judul: 'Pengenalan Kosa kata Inggris',
      kategori: 'Bahasa',
      thumbnail: AssetImage('assets/images/gambar_abc.png'),
    ),
  ];

  List<ModulItem> filteredModulItems = [];

  @override
  void initState() {
    super.initState();
    // Setelah initState dipanggil, aktifkan filter All secara otomatis
    selectedCategory = 'All';
    _filterModulByCategory(selectedCategory);
  }

  void _filterModulByCategory(String category) {
    setState(() {
      filteredModulItems.clear();
      if (category == 'All') {
        filteredModulItems.addAll(modulItems);
      } else {
        // Jika bukan, filter item modul berdasarkan kategori yang dipilih
        filteredModulItems.addAll(
          modulItems.where((modul) => modul.kategori == category),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(186, 252, 182, 1),
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: const Color.fromRGBO(186, 252, 182, 1),
        title: const Text(
          'Modul',
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
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Filter Berdasarkan Kategori :",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                      height: 5), // Spasi antara teks "Kategori" dan ChoiceChip
                  Wrap(
                    spacing: 5.w,
                    children: [
                      ChoiceChip(
                        label: const Text('All'),
                        selected: selectedCategory == 'All',
                        onSelected: (value) {
                          setState(() {
                            selectedCategory = 'All';
                            _filterModulByCategory(selectedCategory);
                          });
                        },
                      ),
                      ChoiceChip(
                        label: const Text('Berhitung'),
                        selected: selectedCategory == 'Berhitung',
                        onSelected: (value) {
                          setState(() {
                            selectedCategory = 'Berhitung';
                            _filterModulByCategory(selectedCategory);
                          });
                        },
                      ),
                      ChoiceChip(
                        label: const Text('Bahasa'),
                        selected: selectedCategory == 'Bahasa',
                        onSelected: (value) {
                          setState(() {
                            selectedCategory = 'Bahasa';
                            _filterModulByCategory(selectedCategory);
                          });
                        },
                      ),
                      ChoiceChip(
                        label: const Text('Ilmu Alam'),
                        selected: selectedCategory == 'Ilmu Alam',
                        onSelected: (value) {
                          setState(() {
                            selectedCategory = 'Ilmu Alam';
                            _filterModulByCategory(selectedCategory);
                          });
                        },
                      ),
                      ChoiceChip(
                        label: const Text('Ilmu Sosial'),
                        selected: selectedCategory == 'Ilmu Sosial',
                        onSelected: (value) {
                          setState(() {
                            selectedCategory = 'Ilmu Sosial';
                            _filterModulByCategory(selectedCategory);
                          });
                        },
                      ),
                      ChoiceChip(
                        label: const Text('Etika'),
                        selected: selectedCategory == 'Etika',
                        onSelected: (value) {
                          setState(() {
                            selectedCategory = 'Etika';
                            _filterModulByCategory(selectedCategory);
                          });
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15),
            Expanded(
              flex: 1,
              child: Container(
                padding: EdgeInsetsDirectional.only(
                  top: 5.h,
                  start: 8.w,
                  end: 8.w,
                ),
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
                child: ListView.builder(
                  itemCount: filteredModulItems.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        // Periksa judul modul dan buka halaman yang sesuai
                        if (filteredModulItems[index].judul ==
                            'Belajar Membaca Waktu') {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Berhitung(),
                            ),
                          );
                        } else if (filteredModulItems[index].judul ==
                            'Bagian-bagian batang tumbuhan') {
                        } else if (filteredModulItems[index].judul ==
                            'Pengenalan Kosa kata Inggris') {}
                      },
                      child: ModultemWithShimmer(
                        judul: filteredModulItems[index].judul,
                        kategori: filteredModulItems[index].kategori,
                        thumbnail: filteredModulItems[index].thumbnail,
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ModultemWithShimmer extends StatefulWidget {
  final String judul;
  final String kategori;
  final ImageProvider<Object> thumbnail;

  const ModultemWithShimmer({
    required this.judul,
    required this.kategori,
    required this.thumbnail,
    super.key,
  });

  @override
  // ignore: library_private_types_in_public_api
  _ModultemWithShimmerState createState() => _ModultemWithShimmerState();
}

class _ModultemWithShimmerState extends State<ModultemWithShimmer> {
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
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 40.w,
              height: 17.h,
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
            SizedBox(width: 2.w), // Spasi antara gambar dan teks
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _isLoading
                      ? _buildShimmerBox(width: 200.w, height: 4.h)
                      : Text(
                          widget.judul,
                          style: const TextStyle(
                            fontSize: 18,
                            fontFamily: 'WorkSans',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                  SizedBox(height: 0.5.h), // Spasi antara judul dan kategori
                  _isLoading
                      ? _buildShimmerBox(width: 250.w, height: 3.h)
                      : Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 4, horizontal: 8),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.black, // Warna garis
                              width: 1, // Lebar garis
                            ),
                            borderRadius: BorderRadius.circular(10),
                            // Sudut sudut garis
                          ),
                          child: Text(
                            widget.kategori,
                            style: const TextStyle(
                              fontSize: 14,
                              fontFamily: 'WorkSans',
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                ],
              ),
            ),
          ],
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

class ModulItem extends StatelessWidget {
  final String judul;
  final String kategori;
  final ImageProvider<Object> thumbnail;

  const ModulItem({
    required this.judul,
    required this.kategori,
    required this.thumbnail,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 40.w,
          height: 60.h,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: thumbnail,
              fit: BoxFit.fill,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        Text(
          judul,
          style: const TextStyle(
            fontSize: 16,
            fontFamily: 'WorkSans',
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          kategori,
          style: const TextStyle(
            fontSize: 12,
            fontFamily: 'WorkSans',
            fontWeight: FontWeight.normal,
          ),
        ),
        const Divider(),
      ],
    );
  }
}
