import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:telecomm_mobile/models/batch_model.dart';
import 'package:telecomm_mobile/repository/batch_repository.dart';

import '../models/contact_model.dart';

class Batchervice {
  final BatchRepository _batchRepository = BatchRepository();

  Future<List<BatchModel>> fetchBatch() async {
    var batch = await _batchRepository.fetchAllBatch();

    List<Future<BatchModel>> batchModels = batch.map((snapshot) async {
      var batchMap = snapshot.data();
      DocumentReference batchRef = snapshot.reference;
      CollectionReference contactRef = batchRef.collection('batchCollection');
      QuerySnapshot contactSnapshot = await contactRef.get();
      List<ContactModel> contact = contactSnapshot.docs
          .map(
              (doc) => ContactModel.fromMap(doc.data() as Map<String, dynamic>))
          .toList();
      return BatchModel(
        batchNo: batchMap['batchNo'],
        contact: contact,
      );
    }).toList();

    return Future.wait(batchModels);
  }
}
