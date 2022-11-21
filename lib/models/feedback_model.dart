import 'package:cloud_firestore/cloud_firestore.dart';

class FeedbackModel {
  num rating;
  String description;


  FeedbackModel(
    this.rating,
    this.description,
  );
}
