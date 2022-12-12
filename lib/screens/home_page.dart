import 'package:flutter/material.dart';
import 'package:telecomm_mobile/screens/batch_page.dart';
import 'package:telecomm_mobile/screens/calling_page.dart';
import 'package:telecomm_mobile/screens/notes_page.dart';
import 'package:telecomm_mobile/screens/login_page.dart';
import 'package:telecomm_mobile/screens/home_page copy.dart';
import 'package:telecomm_mobile/screens/reminders_page.dart';
import 'package:telecomm_mobile/widgets/navigation_button.dart';

import '../main.dart';

class HomePage extends StatelessWidget {
  // final pages = List.generate(5, (index) => '$index');
  final controller = ScrollController();
  final pages = {
    "Batch": BatchPage(),
    "Calling": CallingPage(),
    "Note": NotesPage(),
    "Login": LoginPage(),
    "Reminders": RemindersPage(),
    "Home page Copy": HomePageCopy()
  };

  late final List pagesString = pages.keys.toList();
  late final List pagesWidget = pages.values.toList();

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: Text("This is the homepage"),
          actions: [
            IconButton(
              icon: Icon(Icons.arrow_upward),
              onPressed: () {
                final double value = 0;
                controller.jumpTo(value);
              },
            ),
            IconButton(
              icon: Icon(Icons.arrow_downward),
              onPressed: () {
                final value = controller.position.maxScrollExtent;
                controller.jumpTo(value);
              },
            ),
          ],
        ),
        body: buildGridView(),
      );

  Widget buildGridView() => GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1,
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
        ),
        padding: const EdgeInsets.all(4),
        controller: controller,
        itemCount: pages.length,
        itemBuilder: (context, index) {
          final string = pagesString[index];
          final widget = pagesWidget[index];

          return NavButton(page: string, destination: widget);
        },
      );

  Widget buildNumber(String number) => Container(
        padding: EdgeInsets.all(16),
        color: Colors.grey.shade600,
        child: GridTile(
          child: Center(
            child: Text(
              number,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 48),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      );
}
