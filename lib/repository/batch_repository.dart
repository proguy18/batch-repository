import 'package:cloud_firestore/cloud_firestore.dart';

import '../api/batch_api.dart';
import '../models/contact_model.dart';

class BatchRepository {
  Future<List<QueryDocumentSnapshot<Map<String, dynamic>>>> 
  fetchAllBatch(uid) async {
    var snapshot = await getBatch(uid);
    return snapshot.docs;
  }

  // Future<List<QueryDocumentSnapshot<Map<String, dynamic>>>> 
  // fetchUserBatch(String uid) async {
  //   var snapshot = await getUserBatch(uid);
  //   return snapshot.docs;
  // }
}