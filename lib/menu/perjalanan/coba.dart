import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sizer/sizer.dart';
import 'package:shimmer/shimmer.dart';
import 'package:image_picker/image_picker.dart';

class LatihanGuru extends StatefulWidget {
  const LatihanGuru({super.key});
  static String routeName = 'LatihanGuru';

  @override
  // ignore: library_private_types_in_public_api
  _LatihanGuruState createState() => _LatihanGuruState();
}

class _LatihanGuruState extends State<LatihanGuru> {
  final _formKey = GlobalKey<FormState>();
  final _pertanyaanController = TextEditingController();
  final _pilihanAController = TextEditingController();
  final _pilihanBController = TextEditingController();
  final _pilihanCController = TextEditingController();
  final _pilihanDController = TextEditingController();
  final _scrollController = ScrollController();
  final _catatanFocusNode = FocusNode();
  bool _isLoading = true;
  XFile? _selectedImage;
  String? _correctOption;
  String? _selectedClass;
  String? _selectedLevel;

  @override
  void initState() {
    super.initState();
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
    _pertanyaanController.dispose();
    _pilihanAController.dispose();
    _pilihanBController.dispose();
    _pilihanCController.dispose();
    _pilihanDController.dispose();
    _catatanFocusNode.dispose();
    super.dispose();
  }

  void _scrollToFocusedField() {
    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _selectedImage = image;
      });
    }
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
    if (_formKey.currentState!.validate() && _correctOption != null) {
      // All fields are valid, proceed to save data
      Fluttertoast.showToast(
        msg: "Data berhasil disimpan",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        textColor: Colors.white,
        fontSize: 16.0,
      );
      // Code to save data to the database will go here
    } else {
      Fluttertoast.showToast(
        msg: "Harap lengkapi semua kolom",
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
          'Latihan',
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
                              'Silahkan isi kolom Pertanyaan',
                              style: TextStyle(
                                color: Color.fromRGBO(75, 63, 99, 1),
                                fontSize: 16.0,
                                fontFamily: 'WorkSans',
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                            SizedBox(height: 2.h),

                            // Soal
                            _isLoading
                                ? _buildShimmer(height: 60)
                                : TextFormField(
                                    controller: _pertanyaanController,
                                    maxLines: 2,
                                    decoration: const InputDecoration(
                                      labelStyle: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15,
                                        fontFamily: 'WorkSans',
                                        fontWeight: FontWeight.normal,
                                      ),
                                      labelText: 'Soal',
                                      border: OutlineInputBorder(),
                                    ),
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Pertanyaan tidak boleh kosong';
                                      }
                                      return null;
                                    },
                                  ),
                            SizedBox(height: 3.h),

                            // Kelas Dropdown
                            _isLoading
                                ? _buildShimmer(height: 60)
                                : DropdownButtonFormField<String>(
                                    decoration: const InputDecoration(
                                      labelStyle: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15,
                                        fontFamily: 'WorkSans',
                                        fontWeight: FontWeight.normal,
                                      ),
                                      labelText: 'Kelas',
                                      border: OutlineInputBorder(),
                                    ),
                                    value: _selectedClass,
                                    onChanged: (String? newValue) {
                                      setState(() {
                                        _selectedClass = newValue!;
                                      });
                                    },
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Kelas tidak boleh kosong';
                                      }
                                      return null;
                                    },
                                    items: <String>[
                                      'Kelas 1',
                                      'Kelas 2',
                                      'Kelas 3',
                                      'Kelas 4',
                                      'Kelas 5',
                                      'Kelas 6'
                                    ].map<DropdownMenuItem<String>>(
                                        (String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(value),
                                      );
                                    }).toList(),
                                  ),
                            SizedBox(height: 3.h),

                            // Level Dropdown
                            _isLoading
                                ? _buildShimmer(height: 60)
                                : DropdownButtonFormField<String>(
                                    decoration: const InputDecoration(
                                      labelStyle: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15,
                                        fontFamily: 'WorkSans',
                                        fontWeight: FontWeight.normal,
                                      ),
                                      labelText: 'Level',
                                      border: OutlineInputBorder(),
                                    ),
                                    value: _selectedLevel,
                                    onChanged: (String? newValue) {
                                      setState(() {
                                        _selectedLevel = newValue!;
                                      });
                                    },
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Level tidak boleh kosong';
                                      }
                                      return null;
                                    },
                                    items: <String>[
                                      '1',
                                      '2',
                                      '3',
                                      '4',
                                      '5',
                                      '6',
                                      '7',
                                      '8',
                                      '9',
                                      '10'
                                    ].map<DropdownMenuItem<String>>(
                                        (String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(value),
                                      );
                                    }).toList(),
                                  ),
                            SizedBox(height: 3.h),

                            // Image Picker
                            _isLoading
                                ? _buildShimmer(height: 60)
                                : Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        'Pilih gambar soal (opsional)',
                                        style: TextStyle(fontSize: 14),
                                      ),
                                      SizedBox(height: 1.h),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          ElevatedButton(
                                            onPressed: _pickImage,
                                            style: ElevatedButton.styleFrom(
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(50.0),
                                              ),
                                              backgroundColor:
                                                  const Color.fromRGBO(
                                                      76, 66, 83, 1),
                                              foregroundColor: Colors.white,
                                              elevation: 5.0,
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 30.0,
                                                      vertical: 15.0),
                                            ),
                                            child: const Text('Pilih Gambar'),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                            SizedBox(height: 1.h),
                            if (_selectedImage != null)
                              Image.file(
                                File(_selectedImage!.path),
                                height: 150,
                              ),
                            SizedBox(height: 3.h),

                            // Pilihan Jawaban
                            _isLoading
                                ? _buildShimmer(height: 60)
                                : Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        'Pilih Jawaban Benar',
                                        style: TextStyle(fontSize: 14),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Radio<String>(
                                            value: 'A',
                                            groupValue: _correctOption,
                                            onChanged: (value) {
                                              setState(() {
                                                _correctOption = value;
                                              });
                                            },
                                          ),
                                          const Text('A'),
                                          Radio<String>(
                                            value: 'B',
                                            groupValue: _correctOption,
                                            onChanged: (value) {
                                              setState(() {
                                                _correctOption = value;
                                              });
                                            },
                                          ),
                                          const Text('B'),
                                          Radio<String>(
                                            value: 'C',
                                            groupValue: _correctOption,
                                            onChanged: (value) {
                                              setState(() {
                                                _correctOption = value;
                                              });
                                            },
                                          ),
                                          const Text('C'),
                                          Radio<String>(
                                            value: 'D',
                                            groupValue: _correctOption,
                                            onChanged: (value) {
                                              setState(() {
                                                _correctOption = value;
                                              });
                                            },
                                          ),
                                          const Text('D'),
                                        ],
                                      ),
                                      if (_correctOption == null)
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 16.0),
                                          child: Text(
                                            'Pilihan jawaban tidak boleh kosong',
                                            style: TextStyle(
                                              color: Colors.red[700],
                                              fontSize: 12,
                                            ),
                                          ),
                                        ),
                                    ],
                                  ),
                            SizedBox(height: 2.h),

                            // Pilihan A
                            _isLoading
                                ? _buildShimmer(height: 60)
                                : TextFormField(
                                    controller: _pilihanAController,
                                    decoration: const InputDecoration(
                                      labelText: 'Pilihan A',
                                      border: OutlineInputBorder(),
                                    ),
                                    maxLines: 1,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Pilihan A tidak boleh kosong';
                                      }
                                      return null;
                                    },
                                  ),
                            SizedBox(height: 2.h),

                            // Pilihan B
                            _isLoading
                                ? _buildShimmer(height: 60)
                                : TextFormField(
                                    controller: _pilihanBController,
                                    decoration: const InputDecoration(
                                      labelText: 'Pilihan B',
                                      border: OutlineInputBorder(),
                                    ),
                                    maxLines: 1,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Pilihan B tidak boleh kosong';
                                      }
                                      return null;
                                    },
                                  ),
                            SizedBox(height: 2.h),

                            // Pilihan C
                            _isLoading
                                ? _buildShimmer(height: 60)
                                : TextFormField(
                                    controller: _pilihanCController,
                                    decoration: const InputDecoration(
                                      labelText: 'Pilihan C',
                                      border: OutlineInputBorder(),
                                    ),
                                    maxLines: 1,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Pilihan C tidak boleh kosong';
                                      }
                                      return null;
                                    },
                                  ),
                            SizedBox(height: 2.h),

                            // Pilihan D
                            _isLoading
                                ? _buildShimmer(height: 60)
                                : TextFormField(
                                    controller: _pilihanDController,
                                    decoration: const InputDecoration(
                                      labelText: 'Pilihan D',
                                      border: OutlineInputBorder(),
                                    ),
                                    maxLines: 1,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Pilihan D tidak boleh kosong';
                                      }
                                      return null;
                                    },
                                  ),
                            SizedBox(height: 2.h),

                            // Submit Button
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
                                    child: const Text('Tambah Latihan'),
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
