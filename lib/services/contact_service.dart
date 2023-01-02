import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:telecomm_mobile/models/contact_model.dart';
import 'package:telecomm_mobile/repository/contact_repository.dart';

import '../models/contact_model.dart';

class Contactervice {
  final ContactRepository _contactRepository = ContactRepository();

  Future<List<ContactModel>> fetchContact(uid) async {
    var contact = await _contactRepository.fetchAllContact(uid);

    return contact.map((snapshot) {
      var contactMap = snapshot.data();
      return ContactModel.fromMap(contactMap);
    }).toList();
  }
}
