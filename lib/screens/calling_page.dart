import 'dart:ui';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:telecomm_mobile/glassmorphism/glassmorphism.dart';
import 'package:video_player/video_player.dart';

class CallingPage extends StatefulWidget {
  CallingPage({Key? key}) : super(key: key);

  @override
  State<CallingPage> createState() => _CallingPageState();
}

class _CallingPageState extends State<CallingPage> {
  // const name({Key? key}) : super(key: key);

  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset('assets/video.mp4')
      ..initialize().then((_) {
        _controller.play();
        _controller.setLooping(true);
        _controller.setVolume(0.0);
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Stack(
                children: [
                  //1
                  SizedBox.expand(
                    child: FittedBox(
                      fit: BoxFit.cover,
                      child: SizedBox(
                        width: _controller.value.size.width ?? 0,
                        height: _controller.value.size.height ?? 0,
                        child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 20, sigmaY: 10),
                            child: VideoPlayer(_controller)),
                      ),
                    ),
                  ),
                  //2
                  GlassMorphism(
                      blur: 10,
                      opacity: 0.05,
                      child: Column(
                        children: [
                          //1
                          Container(
                            width: MediaQuery.of(context).size.width * 0.5,
                            height: MediaQuery.of(context).size.height * 0.5,
                            decoration: BoxDecoration(
                                color: Colors.black.withOpacity(0.2),
                                shape: BoxShape.circle),
                            child: Padding(
                              padding: const EdgeInsets.all(30.0),
                              child: IconButton(
                                icon: Image.asset(
                                  "assets/user.png",
                                  fit: BoxFit.contain,
                                ),
                                onPressed: () {},
                              ),
                            ),
                          ),
                          //gap
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.2,
                            child: DefaultTextStyle(
                                style: GoogleFonts.montserrat(
                                  fontSize: 30.0,
                                ),
                                child: AnimatedTextKit(
                                  totalRepeatCount: 10000,
                                  pause: const Duration(seconds: 2),
                                  displayFullTextOnTap: true,
                                  stopPauseOnTap: true,
                                  animatedTexts: [
                                    TypewriterAnimatedText('Calling...'),
                                  ],
                                )),
                          ),
                          //2
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width:
                                    MediaQuery.of(context).size.width * 0.175,
                                height:
                                    MediaQuery.of(context).size.width * 0.175,
                                decoration: BoxDecoration(
                                    color: Colors.black.withOpacity(0.2),
                                    shape: BoxShape.circle),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: IconButton(
                                    icon: Image.asset(
                                      "assets/mute.png",
                                      fit: BoxFit.contain,
                                    ),
                                    onPressed: () {},
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(50.0),
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.175,
                                  height:
                                      MediaQuery.of(context).size.width * 0.175,
                                  decoration: BoxDecoration(
                                      color: Colors.black.withOpacity(0.2),
                                      shape: BoxShape.circle),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: IconButton(
                                      icon: Image.asset(
                                        "assets/endcall.png",
                                        fit: BoxFit.contain,
                                      ),
                                      onPressed: () {},
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                width:
                                    MediaQuery.of(context).size.width * 0.175,
                                height:
                                    MediaQuery.of(context).size.width * 0.175,
                                decoration: BoxDecoration(
                                    color: Colors.black.withOpacity(0.2),
                                    shape: BoxShape.circle),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: IconButton(
                                    icon: Image.asset(
                                      "assets/speaker.png",
                                      fit: BoxFit.contain,
                                    ),
                                    onPressed: () {},
                                  ),
                                ),
                              )
                            ],
                          )
                        ],
                      ))
                ],
              ),
            ),
          ),
        ));
  }
}


// Column(
//           children: [
//             //1
//             Container(
//               width: MediaQuery.of(context).size.width * 0.5,
//               height: MediaQuery.of(context).size.height * 0.5,
//               decoration: BoxDecoration(
//                   color: Color.fromARGB(255, 187, 242, 70),
//                   shape: BoxShape.circle),
//               child: Padding(
//                 padding: const EdgeInsets.all(30.0),
//                 child: IconButton(
//                   icon: Image.asset(
//                     "assets/user.png",
//                     fit: BoxFit.contain,
//                   ),
//                   onPressed: () {},
//                 ),
//               ),
//             ),
//             //2
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Container(
//                   width: MediaQuery.of(context).size.width * 0.175,
//                   height: MediaQuery.of(context).size.width * 0.175,
//                   decoration: BoxDecoration(
//                       color: Color.fromARGB(255, 187, 242, 70),
//                       shape: BoxShape.circle),
//                   child: Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: IconButton(
//                       icon: Image.asset(
//                         "assets/mute.png",
//                         fit: BoxFit.contain,
//                       ),
//                       onPressed: () {},
//                     ),
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(50.0),
//                   child: Container(
//                     width: MediaQuery.of(context).size.width * 0.175,
//                     height: MediaQuery.of(context).size.width * 0.175,
//                     decoration: BoxDecoration(
//                         color: Color.fromARGB(255, 187, 242, 70),
//                         shape: BoxShape.circle),
//                     child: Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: IconButton(
//                         icon: Image.asset(
//                           "assets/endcall.png",
//                           fit: BoxFit.contain,
//                         ),
//                         onPressed: () {},
//                       ),
//                     ),
//                   ),
//                 ),
//                 Container(
//                   width: MediaQuery.of(context).size.width * 0.175,
//                   height: MediaQuery.of(context).size.width * 0.175,
//                   decoration: BoxDecoration(
//                       color: Color.fromARGB(255, 187, 242, 70),
//                       shape: BoxShape.circle),
//                   child: Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: IconButton(
//                       icon: Image.asset(
//                         "assets/speaker.png",
//                         fit: BoxFit.contain,
//                       ),
//                       onPressed: () {},
//                     ),
//                   ),
//                 )
//               ],
//             )
//           ],
//         )