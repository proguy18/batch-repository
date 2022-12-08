import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';

class ReminderModel {
  // String bookingID;
  Timestamp dateCreated;
  String description;
  String name;
  String noteID;
  num rating;
  bool reminderCreated;
  Timestamp reminderDate;
  String userCreated;

  ReminderModel(
    // this.bookingID,
    this.dateCreated,
    this.description,
    this.name,
    this.noteID,
    this.rating,
    this.reminderCreated,
    this.reminderDate,
    this.userCreated,
  );
}
