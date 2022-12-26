import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:telecomm_mobile/models/booking_model.dart';

getBatch() {
  var batch = FirebaseFirestore.instance.collection('batches');
  // .where('dateTime', isGreaterThanOrEqualTo: getToday())
  // .orderBy('dateTime', descending: false);
  return batch.get();
}

// getUserBatch(String uid) {
//   var userBatch = FirebaseFirestore.instance
//       .collection('users')
//       .doc(uid)
//       .collection('notes')
//       // .where('dateTime', isGreaterThanOrEqualTo: getToday())
//       .orderBy('dateTime', descending: false);
//   return userBatch.get();
// }

getToday() {
  DateTime now = DateTime.now();
  DateTime today = DateTime(now.year, now.month, now.day, 0, 0, 0, 0, 0);
  return today;
}
