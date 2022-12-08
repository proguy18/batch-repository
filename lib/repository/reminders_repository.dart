import 'package:cloud_firestore/cloud_firestore.dart';

import '../api/reminders_api.dart';
import '../models/reminders_model.dart';

class ReminderRepository {
  Future<List<QueryDocumentSnapshot<Map<String, dynamic>>>> 
  fetchAllReminders() async {
    var snapshot = await getReminders();
    return snapshot.docs;
  }

  // Future<List<QueryDocumentSnapshot<Map<String, dynamic>>>> 
  // fetchUserReminders(String uid) async {
  //   var snapshot = await getUserReminders(uid);
  //   return snapshot.docs;
  // }
}