import 'package:flutter/material.dart';
import 'package:telecomm_mobile/controllers/reminders_notifier.dart';
import 'package:telecomm_mobile/models/reminders_model.dart';
import 'package:provider/provider.dart';
import 'package:telecomm_mobile/glassmorphism/glassmorphism.dart';
import '../widgets/reminders_card.dart';

import 'dart:developer';
// import 'admin_reminders_card_widget.dart';

class RemindersPage extends StatefulWidget {
  const RemindersPage({Key? key}) : super(key: key);

  @override
  State<RemindersPage> createState() => _RemindersPageState();
}

class _RemindersPageState extends State<RemindersPage> {
  @override
  void initState() {
    super.initState();
    Provider.of<RemindersNotifier>(context, listen: false).fetchReminders();
  }

  @override
  Widget build(BuildContext context) {
    return Selector<RemindersNotifier, List<ReminderModel>>(
        selector: (_, notifier) => notifier.remindersList,
        builder: (_, remindersList, __) {
          return Scaffold(
            extendBodyBehindAppBar: true,
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.transparent,
              leading: IconButton(
                icon: Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () {
                  // passing this to our root
                  Navigator.of(context).pop();
                },
              ),
            ),
            body: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 15, 23, 25),
                  border: new Border.all(
                      color: Colors
                          .transparent), //color is transparent so that it does not blend with the actual color specified
                ),
                child: Align(
                  alignment: Alignment.center,
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.8,
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: ListView.builder(
                        itemCount: remindersList.length,
                        itemBuilder: (context, index) {
                          log('data: $remindersList');
                          return RemindersCard(
                            reminders: remindersList[index],
                          );
                        }),
                  ),
                )),
          );
        });
  }
}
