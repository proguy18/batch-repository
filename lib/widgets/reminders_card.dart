import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:telecomm_mobile/models/reminders_model.dart';
import 'package:intl/intl.dart';
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
        padding: const EdgeInsets.all(8.0),
        child: Container(
            height: MediaQuery.of(context).size.height * 0.2,
            color: Colors.transparent,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Date
                Container(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      DateFormat('dd/MM/yyyy, HH:mm')
                          .format(reminders.reminderDate.toDate())
                          .toString(),
                      style: TextStyle(fontSize: 20, color: Colors.black),
                    ),
                  ),
                ),
                // Description
                Container(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      reminders.description,
                      style: TextStyle(fontSize: 20, color: Colors.black),
                    ),
                  ),
                ),
                Container(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      reminders.name,
                      style: TextStyle(fontSize: 20, color: Colors.black),
                    ),
                  ),
                ),
                Row(
                  children: [
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
                  ],
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
            )));
  }
}
