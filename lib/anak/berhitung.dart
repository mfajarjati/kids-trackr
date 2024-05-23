import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';

class Berhitung extends StatefulWidget {
  const Berhitung({super.key});

  static String routeName = 'Berhitung';

  @override
  // ignore: library_private_types_in_public_api
  _BerhitungState createState() => _BerhitungState();
}

class _BerhitungState extends State<Berhitung> {
  late VideoPlayerController _videoPlayerController;
  late ChewieController _chewieController;
  late Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    super.initState();
    _videoPlayerController = VideoPlayerController.asset(
      'assets/images/Wildlife.mp4',
    );

    _initializeVideoPlayerFuture =
        _videoPlayerController.initialize().then((_) {
      setState(() {
        _chewieController = ChewieController(
          videoPlayerController: _videoPlayerController,
          autoPlay: false,
          looping: true,
          // Remove hardcoded aspectRatio
          // Use ChewieController's auto aspect ratio
          autoInitialize: true,
          allowedScreenSleep: false,
          showControls: true,
          fullScreenByDefault: false,
        );
      });
    });
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    _chewieController.dispose();
    super.dispose();
  }

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
          // Video player with controls
          FutureBuilder(
            future: _initializeVideoPlayerFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return AspectRatio(
                  aspectRatio: _videoPlayerController.value.aspectRatio,
                  child: Chewie(controller: _chewieController),
                );
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          ),

          Expanded(
            child: Container(
              padding: EdgeInsets.only(left: 6.w, right: 9.w, top: 5.w),
              decoration: const BoxDecoration(
                color: Colors.white,
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
}
