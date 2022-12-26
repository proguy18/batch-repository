import 'package:flutter/material.dart';

class ContactCard extends StatelessWidget {
  final String name;
  final String type;
  final String phone;

  ContactCard({required this.name, required this.type, required this.phone});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  type,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  phone,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            IconButton(
              icon: Icon(Icons.phone),
              onPressed: () {
                // Add code here to initiate a phone call
              },
            ),
          ],
        ),
      ),
    );
  }
}