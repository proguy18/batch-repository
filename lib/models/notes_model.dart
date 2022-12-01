import 'package:cloud_firestore/cloud_firestore.dart';

class NoteModel {
  num rating;
  String description;

  NoteModel(
    this.rating,
    this.description,
  );
}
