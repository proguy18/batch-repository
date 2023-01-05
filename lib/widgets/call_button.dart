import 'package:flutter/material.dart';
import 'package:flutter_voximplant/flutter_voximplant.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:telecomm_mobile/screens/calling_page.dart';

import 'custom_page_route.dart';

class CallButton extends StatelessWidget {
  final String phoneNumber;
  final VIClient client;
  const CallButton({required this.phoneNumber, required this.client});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: IconButton(
          onPressed: () async {
            PermissionStatus microphoneStatus =
                await Permission.microphone.request();

            if (microphoneStatus == PermissionStatus.granted) {
              handleCall(phoneNumber);
              Navigator.of(context).push(
                CustomPageRoute(child: CallingPage()),
              );
            }

            if (microphoneStatus == PermissionStatus.denied) {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text(
                      "You need to enable your microphone to make calls.")));
            }

            if (microphoneStatus == PermissionStatus.permanentlyDenied) {
              openAppSettings();
            }
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
