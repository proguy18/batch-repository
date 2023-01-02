import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';

class ContactModel {
  final String name;
  final num number;
  final String type;
  final bool isCalled;

  ContactModel({required this.name, required this.number, required this.type, required this.isCalled});

  factory ContactModel.fromMap(Map<String, dynamic> map) {
    return ContactModel(
      name: map['Name'],
      number: map['Nomor'],
      type: map['Type'],
      isCalled: map['isCalled'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'number': number,
      'type': type,
      'isCalled': isCalled,
    };
  }
}
