import 'package:telecomm_mobile/models/reminders_model.dart';
import 'package:telecomm_mobile/repository/reminders_repository.dart';

class ReminderService {
  final ReminderRepository _reminderRepository = ReminderRepository();

  Future<List<ReminderModel>> fetchReminders() async {
    var reminders = await _reminderRepository.fetchAllReminders();

    return reminders.map((snapshot) {
      var reminderMap = snapshot.data();
      return ReminderModel(
        reminderMap['dateCreated'],
        reminderMap['description'],
        reminderMap['name'],
        reminderMap['noteID'],
        reminderMap['rating'],
        reminderMap['reminderCreated'],
        reminderMap['reminderDate'],
        reminderMap['userCreated'],
      );
    }).toList();
  }

  // Future<List<ReminderModel>> fetchUserReminders(String uid) async {
  //   var reminders = await _reminderRepository.fetchUserReminders(uid);

  //   return reminders.map((snapshot) {
  //     var reminderMap = snapshot.data();
  //     return ReminderModel(
  //       reminderMap['name'],
  //       reminderMap['description'],
  //       reminderMap['rating'],
  //       reminderMap['reminderDate'],
  //     );
  //   }).toList();
  // }
}
