// import 'dart:ffi';

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:telecomm_mobile/models/contact_model.dart';

// class ContactModel {
//   final num batchNo;
//   final List<ContactModel> contact;

//   ContactModel({
//     required this.batchNo,
//     required this.contact,
//   });

//   factory ContactModel.fromMap(Map<String, dynamic> map) {
//     return ContactModel(
//       contact: map['contact']
//           .map<ContactModel>((batch) => ContactModel.fromMap(batch))
//           .toList(),
//       batchNo: map['batchNo'],
//     );
//   }

//   Map<String, dynamic> toMap() {
//     return {
//       'contact': contact.map((batch) => batch.toMap()).toList(),
//       'batchNo': batchNo,
//     };
//   }
// }
