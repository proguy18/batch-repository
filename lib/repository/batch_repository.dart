import 'package:cloud_firestore/cloud_firestore.dart';

import '../api/batch_api.dart';
import '../models/batch_model.dart';

class BatchRepository {
  Future<List<QueryDocumentSnapshot<Map<String, dynamic>>>> 
  fetchAllBatch() async {
    var snapshot = await getBatch();
    return snapshot.docs;
  }

  // Future<List<QueryDocumentSnapshot<Map<String, dynamic>>>> 
  // fetchUserBatch(String uid) async {
  //   var snapshot = await getUserBatch(uid);
  //   return snapshot.docs;
  // }
}