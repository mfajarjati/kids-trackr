import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sizer/sizer.dart';
import 'package:shimmer/shimmer.dart';

class TugasSiswa extends StatefulWidget {
  const TugasSiswa({super.key});
  static String routeName = 'TugasSiswa';

  @override
  // ignore: library_private_types_in_public_api
  _TugasSiswaState createState() => _TugasSiswaState();
}

class _TugasSiswaState extends State<TugasSiswa> {
  final _formKey = GlobalKey<FormState>();
  final _namaController = TextEditingController();
  final _catatanController = TextEditingController();
  final _nilaiController = TextEditingController();
  final _tahunController = TextEditingController();
  final _scrollController = ScrollController();
  final _catatanFocusNode = FocusNode();
  String? _mataPelajaran =
      "Matematika"; // Inisialisasi dengan nilai default yang ada dalam daftar
  List<String> _mataPelajaranList = [
    "Matematika",
    "Fisika",
    "Kimia",
    "Biologi"
  ];
  String? _semester;
  bool _isLoading = true;

  // final List<String> _mataPelajaranList = [
  //   "Tema 1: Diriku",
  //   "Tema 2: Kegemaranku",
  //   "Tema 3: Kegiatanku",
  //   "Tema 4: Keluargaku",
  //   "Tema 5: Pengalamanku",
  //   "Tema 6: Lingkungan bersih, sehat, dan asri",
  //   "Tema 7: Benda, hewan, dan tanaman di sekitarku",
  //   "Tema 8: Peristiwa alam",
  // ];

  final List<String> _semesterList = [
    "Semester 1",
    "Semester 2",
  ];

  @override
  void initState() {
    super.initState();
    _nilaiController.text = ''; // Set initial value for nilai
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        _isLoading = false;
      });
    });

    _catatanFocusNode.addListener(() {
      if (_catatanFocusNode.hasFocus) {
        _scrollToFocusedField();
      }
    });
  }

  @override
  void dispose() {
    _namaController.dispose();
    _catatanController.dispose();
    _nilaiController.dispose();
    _catatanFocusNode.dispose();
    super.dispose();
  }

  void _incrementNilai() {
    setState(() {
      int currentValue = int.parse(_nilaiController.text);
      if (currentValue < 100) {
        _nilaiController.text = (currentValue + 1).toString();
      }
    });
  }

  void _decrementNilai() {
    setState(() {
      int currentValue = int.parse(_nilaiController.text);
      if (currentValue > 0) {
        _nilaiController.text = (currentValue - 1).toString();
      }
    });
  }

  void _onNilaiChanged(String value) {
    setState(() {
      int? currentValue = int.tryParse(value);
      if (currentValue == null || currentValue < 0) {
        _nilaiController.text = '0';
      } else if (currentValue > 100) {
        _nilaiController.text = '100';
      }
    });
  }

  void _scrollToFocusedField() {
    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  Widget _buildShimmer({required double height}) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        height: height,
        color: Colors.white,
        margin: const EdgeInsets.symmetric(vertical: 5),
      ),
    );
  }

  void _saveForm() {
    if (_formKey.currentState!.validate()) {
      // All fields are valid, proceed to save data
      Fluttertoast.showToast(
        msg: "Data berhasil disimpan",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: const Color.fromRGBO(186, 252, 182, 1),
      appBar: AppBar(
        scrolledUnderElevation: 0,
        elevation: 0,
        title: const Text(
          'Penilaian',
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
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
      ),
      body: Form(
        key: _formKey,
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Column(
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.only(left: 7.w, right: 7.w, top: 7.w),
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
                    child: SingleChildScrollView(
                      controller: _scrollController,
                      child: Padding(
                        padding: EdgeInsets.only(
                            bottom: MediaQuery.of(context).viewInsets.bottom),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Text(
                              'Silahkan isi kolom penilaian',
                              style: TextStyle(
                                color: Color.fromRGBO(75, 63, 99, 1),
                                fontSize: 16.0,
                                fontFamily: 'WorkSans',
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                            SizedBox(height: 2.h),

                            // nama
                            _isLoading
                                ? _buildShimmer(height: 60)
                                : TextFormField(
                                    controller: _namaController,
                                    decoration: const InputDecoration(
                                      labelStyle: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15,
                                        fontFamily: 'WorkSans',
                                        fontWeight: FontWeight.normal,
                                      ),
                                      labelText: 'Nama',
                                      border: OutlineInputBorder(),
                                    ),
                                    onChanged: (value) {
                                      setState(() {});
                                    },
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Nama tidak boleh kosong';
                                      }
                                      return null;
                                    },
                                  ),
                            SizedBox(height: 3.h),

                            // Tahun
                            _isLoading
                                ? _buildShimmer(height: 60)
                                : TextFormField(
                                    keyboardType: TextInputType.phone,
                                    controller: _tahunController,
                                    decoration: const InputDecoration(
                                      labelStyle: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15,
                                        fontFamily: 'WorkSans',
                                        fontWeight: FontWeight.normal,
                                      ),
                                      labelText: 'Tahun',
                                      border: OutlineInputBorder(),
                                    ),
                                    onChanged: (value) {
                                      setState(() {});
                                    },
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Tahun tidak boleh kosong';
                                      }
                                      return null;
                                    },
                                  ),
                            SizedBox(height: 3.h),

                            // semester
                            _isLoading
                                ? _buildShimmer(height: 60)
                                : DropdownButtonFormField<String>(
                                    value: _semester,
                                    isExpanded: true,
                                    onChanged: (String? newValue) {
                                      setState(() {
                                        _semester = newValue;
                                      });
                                    },
                                    items: _semesterList
                                        .map<DropdownMenuItem<String>>(
                                            (String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(
                                          value,
                                          style: const TextStyle(
                                            fontFamily: 'WorkSans',
                                            fontWeight: FontWeight.normal,
                                          ),
                                        ),
                                      );
                                    }).toList(),
                                    decoration: const InputDecoration(
                                      labelText: 'Semester',
                                      border: OutlineInputBorder(),
                                    ),
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Semester tidak boleh kosong';
                                      }
                                      return null;
                                    },
                                  ),
                            SizedBox(height: 3.h),

                            // mata pelajaran
                            _isLoading
                                ? _buildShimmer(height: 60)
                                : DropdownButtonFormField<String>(
                                    value: _mataPelajaran,
                                    isExpanded: true,
                                    onChanged: (String? newValue) {
                                      setState(() {
                                        _mataPelajaran = newValue;
                                      });
                                    },
                                    items: _mataPelajaranList
                                        .map<DropdownMenuItem<String>>(
                                            (String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(
                                          value,
                                          style: const TextStyle(
                                            fontFamily: 'WorkSans',
                                            fontWeight: FontWeight.normal,
                                          ),
                                        ),
                                      );
                                    }).toList(),
                                    decoration: const InputDecoration(
                                      labelText: 'Mata Pelajaran',
                                      border: OutlineInputBorder(),
                                    ),
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Mata pelajaran tidak boleh kosong';
                                      }
                                      return null;
                                    },
                                  ),
                            SizedBox(height: 3.h),

                            // nilai
                            _isLoading
                                ? _buildShimmer(height: 60)
                                : Row(
                                    children: [
                                      Expanded(
                                        child: TextFormField(
                                          controller: _nilaiController,
                                          keyboardType: TextInputType.number,
                                          textAlign: TextAlign.center,
                                          decoration: const InputDecoration(
                                            labelStyle: TextStyle(
                                              color: Colors.black,
                                              fontSize: 15,
                                              fontFamily: 'WorkSans',
                                              fontWeight: FontWeight.normal,
                                            ),
                                            labelText: 'Nilai',
                                            border: OutlineInputBorder(),
                                          ),
                                          onChanged: _onNilaiChanged,
                                          validator: (value) {
                                            if (value == null ||
                                                value.isEmpty ||
                                                int.tryParse(value) == null ||
                                                int.tryParse(value)! < 0 ||
                                                int.tryParse(value)! > 100) {
                                              return 'Nilai harus antara 0 dan 100';
                                            }
                                            return null;
                                          },
                                        ),
                                      ),
                                      IconButton(
                                        icon: const Icon(Icons.remove),
                                        onPressed: _decrementNilai,
                                      ),
                                      IconButton(
                                        icon: const Icon(Icons.add),
                                        onPressed: _incrementNilai,
                                      ),
                                    ],
                                  ),
                            SizedBox(height: 3.h),

                            // catatan
                            _isLoading
                                ? _buildShimmer(height: 60)
                                : TextFormField(
                                    controller: _catatanController,
                                    focusNode: _catatanFocusNode,
                                    decoration: const InputDecoration(
                                      labelText: 'Catatan',
                                      border: OutlineInputBorder(),
                                    ),
                                    maxLines: 3,
                                    onChanged: (value) {
                                      setState(() {});
                                    },
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Catatan tidak boleh kosong';
                                      }
                                      return null;
                                    },
                                  ),
                            SizedBox(height: 3.h),

                            // button
                            _isLoading
                                ? _buildShimmer(height: 60)
                                : ElevatedButton(
                                    onPressed: _saveForm,
                                    style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      backgroundColor:
                                          const Color.fromRGBO(76, 66, 83, 1),
                                      foregroundColor: Colors.white,
                                      elevation: 5.0,
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 90.0, vertical: 15.0),
                                    ),
                                    child: const Text('Tambah Penilaian'),
                                  ),
                            SizedBox(height: 5.h),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
