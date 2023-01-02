import 'package:flutter/cupertino.dart';
import 'package:telecomm_mobile/models/contact_model.dart';
import 'package:telecomm_mobile/services/batch_service.dart';

class BatchNotifier extends ChangeNotifier {
  List<ContactModel> _batchList = [];
  List<ContactModel> get batchList => _batchList;

  final BatchService _batchService = BatchService();

  Future<void> fetchBatch(uid) async {
    _batchList = await _batchService.fetchBatch(uid);
    notifyListeners();
  }

  // Future<void> fetchUserBatch(String uid) async {
  //   _batchList = await _batchService.fetchUserBatch(uid);
  //   notifyListeners();
  // }
}
