import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';

class BatchCollectionModel {
  final String id;
  final String name;
  final num number;
  final String type;

  BatchCollectionModel(
      {required this.id,
      required this.name,
      required this.number,
      required this.type});

  factory BatchCollectionModel.fromMap(Map<String, dynamic> map) {
    return BatchCollectionModel(
      id: map['id'],
      name: map['name'],
      number: map['number'],
      type: map['type'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'number': number,
      'type': type,
    };
  }
}
