import 'package:flutter/cupertino.dart';
import 'package:telecomm_mobile/models/contact_model.dart';
import 'package:telecomm_mobile/services/contact_service.dart';

class ContactNotifier extends ChangeNotifier {
  List<ContactModel> _contactList = [];
  List<ContactModel> get contactList => _contactList;

  final Contactervice _contactervice = Contactervice();

  Future<void> fetchContact(uid) async {
    _contactList = await _contactervice.fetchContact(uid);
    notifyListeners();
  }

  // Future<void> fetchUserContact(String uid) async {
  //   _contactList = await _contactervice.fetchUserContact(uid);
  //   notifyListeners();
  // }
}
