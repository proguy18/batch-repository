import 'package:flutter/material.dart';
import 'package:flutter_voximplant/flutter_voximplant.dart';
import 'package:telecomm_mobile/widgets/call_button.dart';
// import 'package:vox/services/auth_service.dart';

class DemoCall extends StatefulWidget {
  const DemoCall({Key? key}) : super(key: key);

  @override
  State<DemoCall> createState() => _DemoCallState();
}

class _DemoCallState extends State<DemoCall> {
  VIClient client = Voximplant().getClient();
  String displayName = "Test";

  // Login Params
  String username = "testMaskedCaller1@testmask.joeytookanel.voximplant.com";
  String password = "123123";

  Widget build(BuildContext context) {
    return Material(
      child: TextButton(
        onPressed: (() {
          handleLogin(username, password);
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => CallButton(
                      phoneNumber: '6287788098091',
                      client: client,
                    )),
          );
        }),
        child: const Text("Login"),
      ),
    );
  }

  Future<String> handleLogin(String username, String password) async {
    VIClientState clientState = await client.getClientState();
    if (clientState == VIClientState.LoggedIn) {
      return displayName;
    }
    if (clientState == VIClientState.Disconnected) {
      await client.connect();
    }
    VIAuthResult authResult = await client.login(username, password);
    displayName = authResult.displayName;
    return displayName;
  }
}
