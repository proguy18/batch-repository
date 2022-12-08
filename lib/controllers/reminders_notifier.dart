import 'package:flutter/cupertino.dart';
import 'package:telecomm_mobile/models/reminders_model.dart';
import 'package:telecomm_mobile/services/reminders_service.dart';

class RemindersNotifier extends ChangeNotifier {
  List<ReminderModel> _remindersList = [];
  List<ReminderModel> get remindersList => _remindersList;

  final ReminderService _reminderService = ReminderService();

  Future<void> fetchReminders() async {
    _remindersList = await _reminderService.fetchReminders();
    notifyListeners();
  }

  // Future<void> fetchUserReminders(String uid) async {
  //   _remindersList = await _reminderService.fetchUserReminders(uid);
  //   notifyListeners();
  // }
}
