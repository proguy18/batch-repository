import 'package:cloud_firestore/cloud_firestore.dart';

import '../api/contact_api.dart';
import '../models/contact_model.dart';

class ContactRepository {
  Future<List<QueryDocumentSnapshot<Map<String, dynamic>>>> 
  fetchAllContact(uid) async {
    var snapshot = await getContact(uid);
    return snapshot.docs;
  }

  // Future<List<QueryDocumentSnapshot<Map<String, dynamic>>>> 
  // fetchUserContact(String uid) async {
  //   var snapshot = await getUserContact(uid);
  //   return snapshot.docs;
  // }
}