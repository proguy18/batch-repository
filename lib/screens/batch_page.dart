import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:telecomm_mobile/controllers/batch_notifier.dart';
import 'package:telecomm_mobile/models/batch_model.dart';
import 'package:provider/provider.dart';
import 'package:telecomm_mobile/glassmorphism/glassmorphism.dart';
import 'package:telecomm_mobile/models/user_model.dart';
import '../widgets/contact_card.dart';

class BatchPage extends StatefulWidget {
  const BatchPage({Key? key}) : super(key: key);

  @override
  _BatchPageState createState() => _BatchPageState();
}

class _BatchPageState extends State<BatchPage> {
  User user = FirebaseAuth.instance.currentUser!;
  UserModel loggedInUser = UserModel();

  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("users")
        .doc(user.uid)
        .get()
        .then((value) {
      this.loggedInUser = UserModel.fromMap(value.data());
      Provider.of<BatchNotifier>(context, listen: false).fetchBatch();
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    // getNextBatch();
    return Selector<BatchNotifier, List<BatchModel>>(
      selector: (_, notifier) => notifier.batchList,
      builder: (_, batchList, __) {
        return Scaffold(
          body: Align(
            alignment: Alignment.center,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                    Color.fromARGB(255, 15, 23, 25),
                    Colors.black,
                  ],
                ),
              ),
              child: Column(
                children: [
                  //top gap
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.08,
                  ),
                  //top gap
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.08,
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                            "Contacts",
                            style: GoogleFonts.montserrat(
                                fontSize: 30,
                                fontWeight: FontWeight.w600,
                                textStyle: TextStyle(color: Colors.white)),
                          ),
                        ),
                      ],
                    ),
                  ),
                  //Row 1
                  Padding(
                    padding: const EdgeInsets.all(13.0),
                    child: GlassMorphism(
                      blur: 10,
                      opacity: 0.05,
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.9,
                        height: MediaQuery.of(context).size.height * 0.7,
                        child: ListView.builder(
                            itemCount: batchList[0].contact.length,
                            itemBuilder: (context, index) {
                              return ContactCard(
                                contactModel: batchList[0].contact[index],
                              );
                            }),
                      ),
                    ),
                  ),
                  // "Dump and get next batch" button
                  TextButton(
                    onPressed: () {
                      // Call the dumpBatch and getNextBatch functions here
                      dumpAndGetNextBatch(loggedInUser);
                    },
                    child: Text("Dump and get next batch"),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void dumpAndGetNextBatch(UserModel user) {
    dumpCurrentBatch(user);
    moveNextBatch();
  }

  void dumpCurrentBatch(UserModel user) {
    DocumentReference<Map<String, dynamic>> userCollection =
        FirebaseFirestore.instance.collection('users').doc(user.uid);

    userCollection.set({
      'uid': user.uid,
      'email': user.email,
      'fullName': user.fullName,
      'batchNo': null,
      'phoneNumber': user.phoneNumber
    }).catchError(
        (error) => print("Failed to dump user's current batch: $error"));
  }

  // void getNextBatch() {
  //   var contact = FirebaseFirestore.instance
  //       .collection('batches')
  //       .orderBy('batchNo', descending: false);

  //   print(contact.get());
  // }

  void moveNextBatch() async {
    QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection('availableBatches')
        .orderBy('batchNo', descending: false)
        .limit(1)
        .get();

    List<DocumentSnapshot> documents = snapshot.docs;
    for (var document in documents) {
      Map<String, dynamic> data = document.data() as Map<String, dynamic>;

      // Get the collection reference for the source and destination collections
      CollectionReference sourceCollection =
          document.reference.collection('batchCollection');

      CollectionReference destinationCollection = FirebaseFirestore.instance
          .collection("users")
          .doc(user.uid)
          .collection('currentBatch');
      // .doc(document.id)
      // .collection('batchCollection');

      // Get the documents in the source subcollection
      QuerySnapshot subcollectionSnapshot = await sourceCollection.get();
      List<DocumentSnapshot> subcollectionDocuments =
          subcollectionSnapshot.docs;

      // Add each document in the subcollection to the destination subcollection
      for (var subcollectionDocument in subcollectionDocuments) {
        Map<String, dynamic> subcollectionData =
            subcollectionDocument.data() as Map<String, dynamic>;
        await destinationCollection.add(subcollectionData);
        await subcollectionDocument.reference.delete();
      }

      // // Add the data for the original document to the destination collection
      // await destinationCollection.parent!.set(data);

      // Delete the original document
      await document.reference.delete();
    }
  }
}
