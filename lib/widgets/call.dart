import 'package:flutter/material.dart';
import 'package:flutter_voximplant/flutter_voximplant.dart';

class CallButton extends StatelessWidget {
  final String phoneNumber;
  final VIClient client;
  CallButton({required this.phoneNumber, required this.client});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: IconButton(
          onPressed: () {
            handleCall(phoneNumber);
          },
          icon: const Icon(Icons.phone)),
    );
  }

  void handleCall(String phoneNumber) async {
    VICallSettings callSettings = VICallSettings();
    callSettings.videoFlags =
        VIVideoFlags(receiveVideo: false, sendVideo: false);
    VICall call = await client.call(phoneNumber, settings: callSettings);
  }
}
