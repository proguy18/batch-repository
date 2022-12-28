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
              )),
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
                            "Reminders",
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
                            itemCount: batchList[0].batchCollection.length,
                            itemBuilder: (context, index) {
                              return ContactCard(
                                batchCollectionModel:
                                    batchList[0].batchCollection[index],
                              );
                            }),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ));
        });
  }

  void dumpAndGetNextBatch() {}

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

  void getNextBatch() {
    var batchCollection = FirebaseFirestore.instance
        .collection('batches')
        .orderBy('batchNo', descending: false);

    print(batchCollection.get());
  }
}
