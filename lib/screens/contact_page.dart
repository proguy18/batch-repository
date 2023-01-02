import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:telecomm_mobile/controllers/contact_notifier.dart';
import 'package:provider/provider.dart';
import 'package:telecomm_mobile/glassmorphism/glassmorphism.dart';
import 'package:telecomm_mobile/models/contact_model.dart';
import 'package:telecomm_mobile/models/user_model.dart';
import '../widgets/contact_card.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({Key? key}) : super(key: key);

  @override
  _ContactPageState createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
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
      Provider.of<ContactNotifier>(context, listen: false).fetchContact(loggedInUser.uid);
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    // getNextContact();
    return Selector<ContactNotifier, List<ContactModel>>(
      selector: (_, notifier) => notifier.contactList,
      builder: (_, contactList, __) {
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
                            itemCount: contactList.length,
                            itemBuilder: (context, index) {
                              return ContactCard(
                                contactModel: contactList[index],
                              );
                            }),
                      ),
                    ),
                  ),
                  // "Dump and get next contact" button
                  TextButton(
                    onPressed: () {
                      // Call the dumpContact and getNextContact functions here
                      dumpAndGetNextContact(loggedInUser);
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

  void dumpAndGetNextContact(UserModel user) async {
    dumpCurrentContact(user);
    moveNextContact();
  }

  void dumpCurrentContact(UserModel user) async {
    CollectionReference sourceCollection = FirebaseFirestore.instance
        .collection("users")
        .doc(user.uid)
        .collection('currentContact');

    // If no contactes to dump, do nothing
    if (sourceCollection == null) {
      return;
    }

    CollectionReference destinationCollection =
        FirebaseFirestore.instance.collection('dumpedContactes');

    QuerySnapshot snapshot = await sourceCollection.get();
    List<DocumentSnapshot> documents = snapshot.docs;

    for (var document in documents) {
      Map<String, dynamic> data = document.data() as Map<String, dynamic>;
      await destinationCollection.add(data);
      await document.reference.delete();
    }
  }

  // void getNextContact() {
  //   var contact = FirebaseFirestore.instance
  //       .collection('contactes')
  //       .orderBy('contactNo', descending: false);

  //   print(contact.get());
  // }

  void moveNextContact() async {
    QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection('availableContactes')
        .orderBy('contactNo', descending: false)
        .limit(1)
        .get();

    List<DocumentSnapshot> documents = snapshot.docs;
    for (var document in documents) {
      Map<String, dynamic> data = document.data() as Map<String, dynamic>;

      // Get the collection reference for the source and destination collections
      CollectionReference sourceCollection =
          document.reference.collection('contactCollection');

      CollectionReference destinationCollection = FirebaseFirestore.instance
          .collection("users")
          .doc(user.uid)
          .collection('currentContact');
      // .doc(document.id)
      // .collection('contactCollection');

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
