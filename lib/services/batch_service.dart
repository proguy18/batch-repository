import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:telecomm_mobile/models/contact_model.dart';
import 'package:telecomm_mobile/repository/batch_repository.dart';

import '../models/contact_model.dart';

class BatchService {
  final BatchRepository _batchRepository = BatchRepository();

  Future<List<ContactModel>> fetchBatch(uid) async {
    var batch = await _batchRepository.fetchAllBatch(uid);

    return batch.map((snapshot) {
      var batchMap = snapshot.data();
      return ContactModel.fromMap(batchMap);
    }).toList();
  }
}
