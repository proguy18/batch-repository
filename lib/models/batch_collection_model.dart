import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';

class BatchCollectionModel {
  final String name;
  final num number;
  final String type;

  BatchCollectionModel(
      {required this.name,
      required this.number,
      required this.type});

  factory BatchCollectionModel.fromMap(Map<String, dynamic> map) {
    return BatchCollectionModel(
      name: map['Name'],
      number: map['Nomor'],
      type: map['Type'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'number': number,
      'type': type,
    };
  }
}
