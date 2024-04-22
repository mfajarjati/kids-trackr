import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';

class Pengaturan extends StatefulWidget {
  const Pengaturan({super.key});

  static String routeName = 'Pengaturan';

  @override
  // ignore: library_private_types_in_public_api
  _PengaturanState createState() => _PengaturanState();
}

class _PengaturanState extends State<Pengaturan> {
  bool _isPushNotificationEnabled = true;
  bool _isAutoUpdateEnabled = false;
  bool _isPrivateMessagingEnabled = true;
  bool _isDataEncrypted = false;

  @override
  void initState() {
    super.initState();
    _loadSettings();
  }

  void _loadSettings() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _isPushNotificationEnabled =
          prefs.getBool('push_notification_enabled') ?? true;
      _isAutoUpdateEnabled = prefs.getBool('auto_update_enabled') ?? false;
      _isPrivateMessagingEnabled =
          prefs.getBool('private_messaging_enabled') ?? true;
      _isDataEncrypted = prefs.getBool('data_encrypted') ?? false;
    });
  }

  void _saveSettings() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('push_notification_enabled', _isPushNotificationEnabled);
    prefs.setBool('auto_update_enabled', _isAutoUpdateEnabled);
    prefs.setBool('private_messaging_enabled', _isPrivateMessagingEnabled);
    prefs.setBool('data_encrypted', _isDataEncrypted);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(186, 252, 182, 1),
      appBar: AppBar(
        title: const Text(
          'Pengaturan',
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
                  'assets/images/pengaturan.png',
                  height: 100,
                  width: 100,
                ),
                const SizedBox(height: 7),
                const Text(
                  'Pengaturan',
                  style: TextStyle(
                    color: Color.fromRGBO(75, 63, 99, 1),
                    fontSize: 20.0,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'WorkSans',
                  ),
                ),
                const Text(
                  'Sesuaikan dengan keinginan Anda',
                  style: TextStyle(
                    color: Color.fromRGBO(75, 63, 99, 1),
                    fontSize: 14.0,
                    fontFamily: 'WorkSans',
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.only(left: 6.w, right: 7.w, top: 5.w),
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
                child: Column(
                  children: [
                    _buildSwitchListTile(
                      title: 'Nyalakan Notifikasi',
                      value: _isPushNotificationEnabled,
                      onChanged: (value) {
                        setState(() {
                          _isPushNotificationEnabled = value;
                        });
                        _saveSettings(); // Simpan perubahan ke SharedPreferences
                      },
                    ),
                    _buildSwitchListTile(
                      title: 'Mode Gelap',
                      value: _isAutoUpdateEnabled,
                      onChanged: (value) {
                        setState(() {
                          _isAutoUpdateEnabled = value;
                        });
                        _saveSettings(); // Simpan perubahan ke SharedPreferences
                      },
                    ),
                    _buildSwitchListTile(
                      title: 'Aktifkan Mode Offline',
                      value: _isPrivateMessagingEnabled,
                      onChanged: (value) {
                        setState(() {
                          _isPrivateMessagingEnabled = value;
                        });
                        _saveSettings(); // Simpan perubahan ke SharedPreferences
                      },
                    ),
                    _buildSwitchListTile(
                      title: 'Enkripsi Data',
                      value: _isDataEncrypted,
                      onChanged: (value) {
                        setState(() {
                          _isDataEncrypted = value;
                        });
                        _saveSettings(); // Simpan perubahan ke SharedPreferences
                      },
                    ),
                    SizedBox(height: 3.h),
                    ElevatedButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content: Text('Pengaturan berhasil disimpan')),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        backgroundColor: const Color.fromRGBO(76, 66, 83, 1),
                        foregroundColor: Colors.white,
                        elevation: 5.0,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 80.0, vertical: 15.0),
                      ),
                      child: const Text('Simpan Pengaturan'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSwitchListTile({
    required String title,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    return SwitchListTile(
      contentPadding:
          const EdgeInsets.symmetric(horizontal: 5.0, vertical: 6.0),
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 15.0,
          fontFamily: 'Intern',
          fontWeight: FontWeight.w700,
        ),
      ),
      value: value,
      onChanged: onChanged,
    );
  }
}
