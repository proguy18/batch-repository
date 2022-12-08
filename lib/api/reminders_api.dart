import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:telecomm_mobile/models/booking_model.dart';

getReminders() {
  var reminders = FirebaseFirestore.instance.collection('notes');
  // .where('dateTime', isGreaterThanOrEqualTo: getToday())
  // .orderBy('dateTime', descending: false);
  return reminders.get();
}

// getUserReminders(String uid) {
//   var userReminders = FirebaseFirestore.instance
//       .collection('users')
//       .doc(uid)
//       .collection('notes')
//       // .where('dateTime', isGreaterThanOrEqualTo: getToday())
//       .orderBy('dateTime', descending: false);
//   return userReminders.get();
// }

getToday() {
  DateTime now = DateTime.now();
  DateTime today = DateTime(now.year, now.month, now.day, 0, 0, 0, 0, 0);
  return today;
}
