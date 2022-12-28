import 'package:flutter/material.dart';

import '../models/contact_model.dart';

class ContactCard extends StatelessWidget {
  final ContactModel contactModel;

  ContactCard({required this.contactModel});

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
                  contactModel.name,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  contactModel.type,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  contactModel.number.toString(),
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
