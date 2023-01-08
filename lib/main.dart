import 'package:flutter/material.dart';

import 'package:flutter_voximplant/flutter_voximplant.dart';
import 'package:telecomm_mobile/controllers/batch_notifier.dart';
import 'package:telecomm_mobile/screens/home_page.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:provider/provider.dart';
import 'controllers/reminders_notifier.dart';

VIClient client = Voximplant().getClient();

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => RemindersNotifier()),
        ChangeNotifierProvider(create: (_) => BatchNotifier()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Test Call',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      debugShowCheckedModeBanner: false,
      // home: const LoginButton(),
      home: HomePage(),
      // home: AdminBookings(),
    );
  }
}
