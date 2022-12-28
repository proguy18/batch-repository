import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';

class ContactModel {
  final String name;
  final num number;
  final String type;

  ContactModel({required this.name, required this.number, required this.type});

  factory ContactModel.fromMap(Map<String, dynamic> map) {
    return ContactModel(
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
