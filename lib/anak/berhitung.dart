import 'package:flutter/material.dart';
import 'package:flutter_youtube_view/flutter_youtube_view.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_animate/flutter_animate.dart';

class Berhitung extends StatefulWidget {
  const Berhitung({super.key});

  static String routeName = 'Berhitung';

  @override
  // ignore: library_private_types_in_public_api
  _BerhitungState createState() => _BerhitungState();
}

class _BerhitungState extends State<Berhitung>
    implements YouTubePlayerListener {
  // ignore: unused_field
  late FlutterYoutubeViewController _controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(186, 252, 182, 1),
      appBar: AppBar(
        scrolledUnderElevation: 0,
        title: const Text(
          'Berhitung',
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
            Navigator.pop(context); // Go back to the previous screen
          },
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            decoration: const BoxDecoration(
              color: Color.fromRGBO(186, 252, 182, 1),
            ),
            child: SingleChildScrollView(
// kalau pakai gambar
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      'assets/images/video1.jpeg',
                      height: 180,
                      width: 300,
                    ),
                  ]).animate(delay: 200.ms).fadeIn(duration: 300.ms),

// kalau pakai video yotube
              // child: Column(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: <Widget>[
              //     SizedBox(height: 2.h),
              //     SizedBox(
              //       width: 260,
              //       height: 150,
              //       child: FlutterYoutubeView(
              //         onViewCreated: _onYoutubeCreated,
              //         listener: this,
              //         scaleMode: YoutubeScaleMode
              //             .fitWidth, // <option> fitWidth, fitHeight
              //         params: const YoutubeParam(
              //           videoId: 'dCMtKTg08SY',
              //           showUI: false,
              //           startSeconds: 0.0, // <option>
              //           autoPlay: false,
              //         ),
              //       ),
              //     ),
              //   ],
              // ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.only(left: 6.w, right: 9.w, top: 5.w),
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
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 1.h),
                padding: EdgeInsets.symmetric(horizontal: 1.w),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(height: 2.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Gambar
                          Image.asset(
                            'assets/images/gambar_jam.png',
                            width: 100,
                            height: 100,
                          ),
                          const SizedBox(width: 10),
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    'Tanggal Rilis: ',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                  Text(
                                    '13 April 2024',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    'Guru : ',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                  Text(
                                    'Pak Janeudi',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    'Sekolah : ',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                  Text(
                                    'UPI School',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        'Belajar Membaca Waktu',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Divider(
                          color: Colors.grey, thickness: 1, height: 20),
                      const Text(
                        'Hallo Kidster bagaimana kabarnya nih? harus terus semangat ya belajarnya, sekarang kita akan belajar mengenai Waktu. apa kidster tau bagaimana cara membaca waktu?, nah disini bapak mau menjelaskan mengenai bagaimana cara membaca waktu, silahkan simak video berikut yaa!!! ',
                        style: TextStyle(
                          height: 1.5,
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                          fontFamily: 'WorkSans',
                        ),
                        textAlign: TextAlign.justify,
                      ),
                    ],
                  ).animate(delay: 200.ms).fadeIn(duration: 300.ms),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ignore: unused_element
  void _onYoutubeCreated(FlutterYoutubeViewController controller) {
    // Assign the controller to the local variable
    _controller = controller;
  }

  @override
  void onCurrentSecond(double second) {
    // Implement your logic here
  }

  @override
  void onReady() {
    // Implement your logic here
  }

  @override
  void onError(String error) {
    // Implement your logic here
  }

  @override
  void onStateChange(String state) {
    // Implement your logic here
  }

  @override
  void onVideoDuration(double duration) {
    // Implement your logic here
  }

  void onYoutubeError(String error) {
    // Implement your logic here
  }

  void onVideoEnded() {
    // Implement your logic here
  }

  void onVideoStarted() {
    // Implement your logic here
  }

  void onBuffering() {
    // Implement your logic here
  }

  void onPaused() {
    // Implement your logic here
  }

  void onPlaying() {
    // Implement your logic here
  }

  void onSeekTo(double second) {
    // Implement your logic here
  }

  void onStopped() {
    // Implement your logic here
  }
}
