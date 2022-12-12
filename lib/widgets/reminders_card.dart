import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:telecomm_mobile/models/reminders_model.dart';
import 'package:intl/intl.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:line_icons/line_icons.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:telecomm_mobile/widgets/delete_reminders.dart';
// import 'package:url_launcher/url_launcher.dart' as url_launcher;

class RemindersCard extends StatelessWidget {
  final ReminderModel reminders;
  RemindersCard({required this.reminders});

  @override
  Widget build(BuildContext context) {
    // User user = FirebaseAuth.instance.currentUser!;
    return Padding(
        padding: const EdgeInsets.all(0.0),
        child: Container(
            height: MediaQuery.of(context).size.height * 0.2,
            color: Colors.transparent,
            child: Container(
              width: MediaQuery.of(context).size.width * 0.9,
              height: MediaQuery.of(context).size.height * 0.2,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                  color: Color.fromARGB(255, 187, 242, 70)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Date
                  Container(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        DateFormat('dd/MM/yyyy, HH:mm')
                            .format(reminders.reminderDate.toDate())
                            .toString(),
                        style: GoogleFonts.openSans(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  // Description
                  Container(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        reminders.description,
                        style: GoogleFonts.openSans(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        reminders.name,
                        style: GoogleFonts.openSans(
                          fontWeight: FontWeight.w600,
                          fontSize: 20,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    child: Align(
                      alignment: Alignment.center,
                      child:
                          //1
                          IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.call),
                        color: Colors.black,
                      ),
                      //2
                      // Container(
                      //   child: TextButton(
                      //       onPressed: () async {
                      //         url_launcher.launchUrl(
                      //             Uri.parse(
                      //                 'https://wa.me/${reminders.locationPhoneNumber.toString()}'),
                      //             mode: url_launcher
                      //                 .LaunchMode.externalApplication);
                      //       },
                      //       child: Text(
                      //         '\+' + reminders.locationPhoneNumber.toString(),
                      //         style: TextStyle(fontSize: 20, color: Colors.black),
                      //       )),
                      // ),
                    ),
                  ),
                  //3
                  // TextButton(
                  //   onPressed: () => showDialog(
                  //     context: context,
                  //     builder: (context) => DeleteReminders(
                  //         remindersID: reminders.remindersID, uid: user.uid),
                  //   ),
                  //   child: Text(
                  //     'Cancel Reminders',
                  //     style: TextStyle(fontSize: 20, color: Colors.red),
                  //   ),
                  // ),
                ],
              ),
            )));
  }
}
