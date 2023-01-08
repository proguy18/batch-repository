import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:telecomm_mobile/glassmorphism/glassmorphism.dart';
import 'package:telecomm_mobile/screens/batch_page.dart';
import 'package:telecomm_mobile/screens/calling_page.dart';
import 'package:telecomm_mobile/screens/notes_page.dart';
import 'package:telecomm_mobile/screens/login_page.dart';
import 'package:telecomm_mobile/screens/reminders_page.dart';
import 'package:telecomm_mobile/widgets/navigation_button.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import '../main.dart';
import 'package:line_icons/line_icon.dart';
import 'package:scaffold_gradient_background/scaffold_gradient_background.dart';
import '../widgets/custom_page_route.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';

class HomePageCopy extends StatefulWidget {
  HomePageCopy({Key? key}) : super(key: key);

  @override
  State<HomePageCopy> createState() => _HomePageCopyState();
}

class _HomePageCopyState extends State<HomePageCopy>
    with SingleTickerProviderStateMixin {
  // final pages = List.generate(5, (index) => '$index');
  final controller = ScrollController();
  final pages = {
    "Batch": BatchPage(),
    "Calling": CallingPage(),
    "Note": NotesPage(),
    "Login": LoginPage(),
    "Reminders": RemindersPage(),
  };

  late final List pagesString = pages.keys.toList();
  late final List pagesWidget = pages.values.toList();

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: <Color>[
                Color.fromARGB(255, 0, 0, 0),
                Color.fromARGB(255, 7, 45, 56),
                Color.fromARGB(255, 0, 217, 255),
              ], // Gradient from https://learnui.design/tools/gradient-generator.html
              tileMode: TileMode.mirror,
            ),
          ),
          child: Align(
            alignment: Alignment.center,
            child: Column(
              children: [
                //sizebox
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.1,
                ),
                //Row 1
                Padding(
                  padding: const EdgeInsets.all(13.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: MediaQuery.of(context).size.height * 0.175,
                    child: GlassMorphism(
                      color: Colors.black,
                      blur: 10,
                      opacity: 0.5,
                      child: Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            //1
                            Padding(
                              padding: EdgeInsets.fromLTRB(0, 0,
                                  MediaQuery.of(context).size.width * 0.025, 0),
                              child: IconButton(
                                icon: LineIcon.phone(
                                  color: Colors.white,
                                  size: 40,
                                ),
                                onPressed: () {},
                              ),
                            ),
                            //2
                            AnimatedButton(
                              selectedBackgroundColor:
                                  Color.fromARGB(255, 0, 217, 255)
                                      .withOpacity(0.5),
                              backgroundColor: Colors.transparent,
                              textAlignment: Alignment.center,
                              width: MediaQuery.of(context).size.width * 0.6,
                              borderRadius: 50,
                              isReverse: true,
                              selectedTextColor: Colors.white,
                              transitionType: TransitionType.LEFT_TO_RIGHT,
                              textStyle: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 30,
                                  color: Colors.white),
                              text: "Call",
                              onPress: () {
                                Navigator.of(context).push(
                                  CustomPageRoute(child: CallingPage()),
                                );
                              },
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                //Row2
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GlassMorphism(
                      color: Colors.black,
                      blur: 10,
                      opacity: 0.5,
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.4,
                        height: MediaQuery.of(context).size.height * 0.25,
                        child: Column(
                          children: [
                            //1
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  IconButton(
                                    icon: LineIcon.cubes(
                                      color: Colors.white,
                                      size: 40,
                                    ),
                                    onPressed: () {},
                                  ),
                                ],
                              ),
                            ),
                            //2
                            Padding(
                              padding: const EdgeInsets.fromLTRB(16, 70, 0, 0),
                              child: Row(
                                children: [
                                  Text(
                                    "Change",
                                    style: GoogleFonts.montserrat(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 15,
                                        color: Colors.white.withOpacity(0.5)),
                                  ),
                                ],
                              ),
                            ),
                            //3
                            Padding(
                              padding: const EdgeInsets.fromLTRB(16, 0, 0, 0),
                              child: Row(
                                children: [
                                  Text(
                                    "Batch",
                                    style: GoogleFonts.montserrat(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 20,
                                        color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.08,
                    ),
                    GlassMorphism(
                      color: Colors.black,
                      blur: 10,
                      opacity: 0.5,
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.4,
                        height: MediaQuery.of(context).size.height * 0.25,
                        child: Column(
                          children: [
                            //1
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  IconButton(
                                    icon: LineIcon.bell(
                                      color: Colors.white,
                                      size: 40,
                                    ),
                                    onPressed: () {},
                                  ),
                                ],
                              ),
                            ),
                            //2
                            Padding(
                              padding: const EdgeInsets.fromLTRB(16, 70, 0, 0),
                              child: Row(
                                children: [
                                  Text(
                                    "Check",
                                    style: GoogleFonts.montserrat(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 15,
                                        color: Colors.white.withOpacity(0.5)),
                                  ),
                                ],
                              ),
                            ),
                            //3
                            Padding(
                              padding: const EdgeInsets.fromLTRB(16, 0, 0, 0),
                              child: Row(
                                children: [
                                  Text(
                                    "Reminder",
                                    style: GoogleFonts.montserrat(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 20,
                                        color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                //row3
                Padding(
                  padding: const EdgeInsets.all(13.0),
                  child: GlassMorphism(
                    color: Colors.black,
                    blur: 10,
                    opacity: 0.5,
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: MediaQuery.of(context).size.height * 0.3,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );

  List<MaterialColor> colorizeColors = [Colors.green, Colors.grey];
}
