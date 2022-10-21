import 'package:flutter/material.dart';
import 'package:telecomm_mobile/services/auth_service.dart';
import 'package:flutter_voximplant/flutter_voximplant.dart';
import 'package:telecomm_mobile/widgets/call.dart';

class TestCall extends StatefulWidget {
  const TestCall({super.key});

  @override
  State<TestCall> createState() => _TestCallState();
}

class _TestCallState extends State<TestCall> {
  @override
  void initState() {
    super.initState();
    String username = "Caller1@app.account";
    String password = "6NNosx%3";
    // String username = "joeytookanel";
    // String password = "#VIPkwqbsnh18";
    AuthService authService = AuthService();
    authService.loginWithPassword(username, password);
  }

  @override
  Widget build(BuildContext context) {
    String phoneNumber = "+6287788098091";
    String username = "Caller1@app.account";
    String password = "6NNosx%3";
    // String username = "joeytookanel";
    // String password = "#VIPkwqbsnh18";
    AuthService authService = AuthService();
    authService.loginWithPassword(username, password);
    return CallButton(
        phoneNumber: phoneNumber, client: authService.getClient());
  }
}
