import 'package:flutter/material.dart';

import 'package:flutter_voximplant/flutter_voximplant.dart';
import 'package:telecomm_mobile/screens/test_call.dart';
import 'package:telecomm_mobile/widgets/login.dart';

VIClient client = Voximplant().getClient();

void main() {
  runApp(MyApp());
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
      home: const LoginButton(),
      // home: AdminBookings(),
    );
  }
}
