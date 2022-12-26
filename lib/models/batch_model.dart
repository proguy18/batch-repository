import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';

class BatchModel {
  num batchNo;
  bool isTaken;

  BatchModel(
    this.batchNo,
    this.isTaken,
  );
}
