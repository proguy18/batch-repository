import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:telecomm_mobile/models/batch_collection_model.dart';

class BatchModel {
  final num batchNo;
  final List<BatchCollectionModel> batchCollection;

  BatchModel({
    required this.batchNo,
    required this.batchCollection,
  });

  factory BatchModel.fromMap(Map<String, dynamic> map) {
    return BatchModel(
      batchCollection: map['batchCollection']
          .map<BatchCollectionModel>(
              (batch) => BatchCollectionModel.fromMap(batch))
          .toList(),
      batchNo: map['batchNo'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'batchCollection': batchCollection.map((batch) => batch.toMap()).toList(),
      'batchNo': batchNo,
    };
  }
}
