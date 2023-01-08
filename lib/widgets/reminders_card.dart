import 'package:firebase_auth/firebase_auth.dart';
import 'package:telecomm_mobile/glassmorphism/glassmorphism.dart';
import 'package:flutter/material.dart';
import 'package:telecomm_mobile/models/reminders_model.dart';
import 'package:intl/intl.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:auto_size_text/auto_size_text.dart';
// import 'package:line_icons/line_icons.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:telecomm_mobile/widgets/delete_reminders.dart';
// import 'package:url_launcher/url_launcher.dart' as url_launcher;

class RemindersCard extends StatelessWidget {
  final ReminderModel reminders;
  RemindersCard({required this.reminders});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    DateFormat('dd/MM/yyyy, HH:mm')
                        .format(reminders.reminderDate.toDate())
                        .toString(),
                    style: GoogleFonts.montserrat(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    reminders.description,
                    style: GoogleFonts.montserrat(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    reminders.name,
                    style: GoogleFonts.montserrat(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  // Text(
                  //   reminders.type,
                  //   style: GoogleFonts.montserrat(
                  //     fontSize: 16,
                  //     color: Colors.black,
                  //   ),
                  // ),
                  // SizedBox(height: 8),
                  // Text(
                  //   reminders.number.toString(),
                  //   style: GoogleFonts.montserrat(
                  //     fontSize: 16,
                  //     color: Colors.black,
                  //   ),
                  // ),
                  SizedBox(height: 8),
                  IconButton(
                    color: Colors.red,
                    icon: Icon(Icons.phone),
                    onPressed: () {
                      // Add code here to initiate a phone call
                    },
                  ),
                ],
              ),
            );
          },
        );
      },
      child: Padding(
        padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
        child: GlassMorphism(
          color: Colors.white,
          blur: 10,
          opacity: 0.05,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 150,
                  child: AutoSizeText(
                    reminders.name,
                    minFontSize: 10,
                    maxFontSize: 30,
                    maxLines: 1,
                    style: GoogleFonts.montserrat(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.centerRight,
                  child: Row(
                    children: [
                      SizedBox(
                        width: 70,
                        height: 20,
                        child: Container(
                          alignment: Alignment.center,
                          child: Text(
                            DateFormat('HH:mm')
                                .format(reminders.reminderDate.toDate())
                                .toString(),
                            style: GoogleFonts.montserrat(
                              color: Colors.white,
                              fontSize: 20,
                              // fontWeight: FontWeight,
                            ),
                          ),
                        ),
                      ),
                      IconButton(
                        color: Colors.red,
                        icon: Icon(Icons.phone),
                        onPressed: () {
                          // Add code here to initiate a phone call
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
