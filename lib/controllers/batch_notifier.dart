import 'package:flutter/cupertino.dart';
import 'package:telecomm_mobile/models/batch_model.dart';
import 'package:telecomm_mobile/services/batch_service.dart';

class BatchNotifier extends ChangeNotifier {
  List<BatchModel> _batchList = [];
  List<BatchModel> get batchList => _batchList;

  final Batchervice _batchervice = Batchervice();

  Future<void> fetchBatch() async {
    _batchList = await _batchervice.fetchBatch();
    notifyListeners();
  }

  // Future<void> fetchUserBatch(String uid) async {
  //   _batchList = await _batchervice.fetchUserBatch(uid);
  //   notifyListeners();
  // }
}
