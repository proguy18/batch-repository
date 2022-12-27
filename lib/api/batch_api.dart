import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:telecomm_mobile/models/booking_model.dart';

getBatch() {
  var snapshot = FirebaseFirestore.instance
      .collection('availableBatches')
      .orderBy('batchNo', descending: false)
      .limit(1)
      .get();
  // .then((snapshot) {
  //   DocumentSnapshot firstDocument = snapshot.docs.first;
  //   Map<String, dynamic> data = firstDocument.data;
  // });

  // var firstDocument = snapshot.documents.first;

  // .where('dateTime', isGreaterThanOrEqualTo: getToday())
  // .orderBy('dateTime', descending: false);
  // var unavailableBatchCollection =
  //     FirebaseFirestore.instance.collection('unavailableBatches');

  // // unavailableBatchCollection.set(batch)

  // return batch.get().then((batchRef) {
  //   print(batchRef);
  // });
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
