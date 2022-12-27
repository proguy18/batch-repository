import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:telecomm_mobile/models/batch_model.dart';
import 'package:telecomm_mobile/repository/batch_repository.dart';

import '../models/batch_collection_model.dart';

class Batchervice {
  final BatchRepository _batchRepository = BatchRepository();

  Future<List<BatchModel>> fetchBatch() async {
    var batch = await _batchRepository.fetchAllBatch();

    List<Future<BatchModel>> batchModels = batch.map((snapshot) async {
      var batchMap = snapshot.data();
      DocumentReference batchRef = snapshot.reference;
      CollectionReference batchCollectionRef =
          batchRef.collection('batchCollection');
      QuerySnapshot batchCollectionSnapshot = await batchCollectionRef.get();
      List<BatchCollectionModel> batchCollection = batchCollectionSnapshot.docs
          .map((doc) => BatchCollectionModel.fromMap(doc.data() as Map<String, dynamic>))
          .toList();
      return BatchModel(
        batchNo: batchMap['batchNo'],
        batchCollection: batchCollection,
      );
    }).toList();

    return Future.wait(batchModels);
  }
}
