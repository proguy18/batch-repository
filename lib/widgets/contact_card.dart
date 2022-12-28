import 'package:flutter/material.dart';

import '../models/batch_collection_model.dart';

class ContactCard extends StatelessWidget {
  final BatchCollectionModel batchCollectionModel;

  ContactCard({required this.batchCollectionModel});

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
                  batchCollectionModel.name,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  batchCollectionModel.type,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  batchCollectionModel.number.toString(),
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
