import 'package:flutter/cupertino.dart';
import 'package:telecomm_mobile/models/contact_model.dart';
import 'package:telecomm_mobile/services/batch_service.dart';

class BatchNotifier extends ChangeNotifier {
  List<ContactModel> _batchList = [];
  List<ContactModel> get batchList => _batchList;

  final Batchervice _batchervice = Batchervice();

  Future<void> fetchBatch(uid) async {
    _batchList = await _batchervice.fetchBatch(uid);
    notifyListeners();
  }

  // Future<void> fetchUserBatch(String uid) async {
  //   _batchList = await _batchervice.fetchUserBatch(uid);
  //   notifyListeners();
  // }
}
