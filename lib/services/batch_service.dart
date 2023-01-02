import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:telecomm_mobile/models/batch_model.dart';
import 'package:telecomm_mobile/repository/batch_repository.dart';

import '../models/contact_model.dart';

class Batchervice {
  final BatchRepository _batchRepository = BatchRepository();

  Future<List<ContactModel>> fetchBatch(uid) async {
    var batch = await _batchRepository.fetchAllBatch(uid);

    return batch.map((snapshot) {
      var contactMap = snapshot.data();
      return ContactModel.fromMap(contactMap);
    }).toList();
  }
}
