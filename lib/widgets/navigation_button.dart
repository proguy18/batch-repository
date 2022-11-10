import 'package:flutter/material.dart';
import 'package:telecomm_mobile/widgets/custom_page_route.dart';

class NavButton extends StatelessWidget {
  final String page;
  final Widget destination;

  NavButton({required this.page, required this.destination});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          onPressed: () => Navigator.of(context).push(
            CustomPageRoute(child: destination),
          ),
          child: GridTile(
            child: Center(
              child: Text(
                page,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 10),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ));
  }
}
