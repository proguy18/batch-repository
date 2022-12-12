import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:telecomm_mobile/controllers/reminders_notifier.dart';
import 'package:telecomm_mobile/models/reminders_model.dart';
import 'package:provider/provider.dart';
import 'package:telecomm_mobile/glassmorphism/glassmorphism.dart';
import '../widgets/reminders_card.dart';

class BatchPage extends StatelessWidget {
  // const name({Key? key}) : super(key: key);

  @override
  @override
  Widget build(BuildContext context) => Scaffold(
          body: Align(
        alignment: Alignment.center,
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Color.fromARGB(255, 15, 23, 25),
              Colors.black,
            ],
          )),
          child: Column(
            children: [
              //top gap
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.08,
              ),
              //top gap
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.08,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        "Batch",
                        style: GoogleFonts.montserrat(
                            fontSize: 30,
                            fontWeight: FontWeight.w600,
                            textStyle: TextStyle(color: Colors.white)),
                      ),
                    ),
                  ],
                ),
              ),
              //Row 1
              Padding(
                padding: const EdgeInsets.all(13.0),
                child: GlassMorphism(
                  blur: 10,
                  opacity: 0.05,
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: MediaQuery.of(context).size.height * 0.175,
                    child: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [],
                      ),
                    ),
                  ),
                ),
              ),
              //Row2

              //row3
            ],
          ),
        ),
      ));
}
