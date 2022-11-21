import 'package:cloud_firestore/cloud_firestore.dart';

class ReminderModel {
  // String bookingID;
  String email;
  String location;
  num userPhoneNumber;
  Timestamp dateTime;
  String uid;
  String fullName;

  ReminderModel(
    // this.bookingID,
    this.email,
    this.location,
    this.userPhoneNumber,
    this.dateTime,
    this.uid,
    this.fullName,
  );

}
