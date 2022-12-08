import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:fluttertoast/fluttertoast.dart';
// import 'package:telecomm_mobile/widgets/rating.dart';

class NotesPage extends StatefulWidget {
  const NotesPage({Key? key}) : super(key: key);

  @override
  State<NotesPage> createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  User user = FirebaseAuth.instance.currentUser!;

  int selectedRating = 0;

  String ratingText = "Neutral";

  // string for displaying the error Message
  String? errorMessage;

  // our form key
  final _formKey = GlobalKey<FormState>();
  final nameEditingController = new TextEditingController();
  final descriptionEditingController = new TextEditingController();

  bool reminderCheckboxBool = false;

  @override
  void dispose() {
    descriptionEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // ENTER YOUR PERCEIVED CUSTOMER EXPERIENCE HOW LIKELY IS THE CUSTOMER LIKELY TO BUY A PRODUCT

    final nameField = TextFormField(
        autofocus: false,
        controller: nameEditingController,
        keyboardType: TextInputType.text,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        onSaved: (value) {
          nameEditingController.text = value!;
        },
        textInputAction: TextInputAction.done,
        style: TextStyle(
          color: Colors.white,
        ),
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.black.withOpacity(0.2),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Enter the client's name.",
          hintStyle: TextStyle(
            color: Colors.white,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ));

    // NOTES
    final descriptionField = TextFormField(
        maxLines: null,
        autofocus: false,
        controller: descriptionEditingController,
        keyboardType: TextInputType.multiline,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        onSaved: (value) {
          descriptionEditingController.text = value!;
        },
        textInputAction: TextInputAction.done,
        style: TextStyle(
          color: Colors.white,
        ),
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.black.withOpacity(0.2),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Enter any additional notes here.",
          hintMaxLines: null,
          hintStyle: TextStyle(
            color: Colors.white,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ));

    final createnoteButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Colors.black,
      child: MaterialButton(
          padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          minWidth: MediaQuery.of(context).size.width,
          onPressed: () => showDialog(
                context: context,
                builder: (context) => noteConfirmation(),
              ),
          child: Text(
            "Send note",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
          )),
    );

    final reminderCheckbox = Row(
      children: [
        Text("Create a reminder"),
        Checkbox(
          value: reminderCheckboxBool,
          onChanged: (bool? value) {
            setState(() {
              reminderCheckboxBool = value!;
            });
          },
        ),
      ],
    );

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            // passing this to our root
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              // image: DecorationImage(
              //   image: AssetImage("assets/back2.jpg"),
              //   fit: BoxFit.cover,
              //   opacity: 1,
              // ),
              border: new Border.all(
                  color: Colors
                      .transparent), //color is transparent so that it does not blend with the actual color specified
            ),
            child: Padding(
              padding: const EdgeInsets.all(36.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                        height: 180,
                        child: Image.asset(
                          "assets/inferno_logo_black.png",
                          fit: BoxFit.contain,
                        )),
                    SizedBox(height: 20),
                    Column(
                      children: [
                        RatingBar.builder(
                          initialRating: 3,
                          itemCount: 5,
                          onRatingUpdate: (rating) {
                            // print(rating);
                            selectedRating = rating.toInt();
                            // switch (selectedRating) {
                            //   case 0:
                            //     ratingText = "Extremely Dissatisfied";
                            //     print(ratingText);
                            //     break;
                            //   case 1:
                            //     ratingText = "Very Dissatisfied";
                            //     print(ratingText);
                            //     break;
                            //   case 2:
                            //     ratingText = "Dissatisfied";
                            //     print(ratingText);
                            //     break;
                            //   case 3:
                            //     ratingText = "Neutral";
                            //     print(ratingText);
                            //     break;
                            //   case 4:
                            //     ratingText = "Satisfied";
                            //     print(ratingText);
                            //     break;
                            //   case 5:
                            //     ratingText = "Very Satisfied";
                            //     print(ratingText);
                            //     break;
                            // }
                          },
                          itemBuilder: (context, index) {
                            switch (index) {
                              case 0:
                                return Icon(
                                  Icons.sentiment_very_dissatisfied,
                                  color: Colors.red,
                                );
                              case 1:
                                return Icon(
                                  Icons.sentiment_dissatisfied,
                                  color: Colors.redAccent,
                                );
                              case 2:
                                return Icon(
                                  Icons.sentiment_neutral,
                                  color: Colors.amber,
                                );
                              case 3:
                                return Icon(
                                  Icons.sentiment_satisfied,
                                  color: Colors.lightGreen,
                                );
                              case 4:
                                return Icon(
                                  Icons.sentiment_very_satisfied,
                                  color: Colors.green,
                                );
                            }
                            return Text("Something went wrong");
                          },
                        ),
                        // Builder(builder: (context) => StatefulBuilder(builder: (context, StepStateSB)))
                        // ValueListenableBuilder(
                        //   valueListenable: ratingText,
                        //   builder: (context, value, child) {
                        //     Text(ratingText);
                        //   },
                        // )
                      ],
                    ),
                    SizedBox(height: 20),
                    nameField,
                    SizedBox(height: 15),
                    descriptionField,
                    SizedBox(height: 15),
                    reminderCheckbox,
                    SizedBox(height: 15),
                    createnoteButton,
                    SizedBox(height: 15),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget noteConfirmation() {
    return AlertDialog(
        backgroundColor: Colors.black.withOpacity(0.9),
        title: Text("Are you sure you want to create this note?",
            style: TextStyle(fontSize: 20, color: Colors.white)),
        actions: <Widget>[
          TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                "Go back",
                style: TextStyle(fontSize: 20, color: Colors.white),
              )),
          TextButton(
            onPressed: () {
              createAndSendnote();
              Navigator.pop(context);
            },
            child: Text(
              "Create note",
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
          ),
        ]);
  }

  void createAndSendnote() async {
    CollectionReference noteCollection =
        FirebaseFirestore.instance.collection('notes');

    reminderCheckboxBool
        ?
        // Add notes to the notes collection and add a reminder
        noteCollection.add({
            'userCreated': user.uid,
            'name': nameEditingController.text,
            'rating': selectedRating,
            'description': descriptionEditingController.text,
            'dateCreated': Timestamp.now(),
            'reminderCreated': reminderCheckboxBool,
            'reminderDate': addDayTimeStamp(Timestamp.now().toDate(), 1),
          }).then((noteRef) {
            // Add noteID field to the note
            noteCollection
                .doc(noteRef.id)
                .set({'noteID': noteRef.id}, SetOptions(merge: true));

            // Add the note to the notes collection within the user
          }).catchError((error) => print("Failed to add note: $error"))
        :
        // Add notes to the notes collection
        noteCollection.add({
            'userCreated': user.uid,
            'name': nameEditingController.text,
            'rating': selectedRating,
            'description': descriptionEditingController.text,
            'dateCreated': Timestamp.now(),
            'reminderCreated': reminderCheckboxBool,
          }).then((noteRef) {
            // Add noteID field to the note
            noteCollection
                .doc(noteRef.id)
                .set({'noteID': noteRef.id}, SetOptions(merge: true));

            // Add the note to the notes collection within the user
          }).catchError((error) => print("Failed to add note: $error"));

    // void createReminder() async {
    //   CollectionReference reminderCollection =
    //       FirebaseFirestore.instance.collection('notes');

    //   // Add the note to the notes collection
    //   reminderCollection.add({
    //     'rating': selectedRating,
    //     'description': descriptionEditingController.text,
    //     'dateCreated': Timestamp.now(),
    //   }).then((noteRef) {
    //     // Add noteID field to the note
    //     reminderCollection
    //         .doc(noteRef.id)
    //         .set({'noteID': noteRef.id}, SetOptions(merge: true));

    //     // Add the note to the notes collection within the user
    //   }).catchError((error) => print("Failed to add note: $error"));

    // }

    Fluttertoast.showToast(
      msg: "note Created",
      textColor: Colors.black,
      backgroundColor: Colors.green,
      gravity: ToastGravity.CENTER,
    );
  }

  Timestamp updateHourTimeStamp(DateTime date, int hour) {
    DateTime inputDate =
        DateTime(date.year, date.month, date.day, hour, date.minute, 0, 0, 0);
    Timestamp newResult = Timestamp.fromDate(inputDate);
    return newResult;
  }

  Timestamp addDayTimeStamp(DateTime date, int day) {
    DateTime inputDate = DateTime(date.year, date.month, (date.day + day),
        date.hour, date.minute, 0, 0, 0);
    Timestamp newResult = Timestamp.fromDate(inputDate);
    return newResult;
  }
}
