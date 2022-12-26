import 'package:telecomm_mobile/models/batch_model.dart';
import 'package:telecomm_mobile/repository/batch_repository.dart';

class Batchervice {
  final BatchRepository _batchRepository = BatchRepository();

  Future<List<BatchModel>> fetchBatch() async {
    var batch = await _batchRepository.fetchAllBatch();

    return batch.map((snapshot) {
      var batchMap = snapshot.data();
      return BatchModel(
        batchMap['batchNo'],
        batchMap['isTaken'],
        
      );
    }).toList();
  }

  // Future<List<BatchModel>> fetchUserBatch(String uid) async {
  //   var batch = await _batchRepository.fetchUserBatch(uid);

  //   return batch.map((snapshot) {
  //     var batchMap = snapshot.data();
  //     return BatchModel(
  //       batchMap['name'],
  //       batchMap['description'],
  //       batchMap['rating'],
  //       batchMap['batchDate'],
  //     );
  //   }).toList();
  // }
}
