import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:fluttertoast/fluttertoast.dart';
// import 'package:telecomm_mobile/widgets/rating.dart';

class FeedbackPage extends StatefulWidget {
  FeedbackPage({Key? key}) : super(key: key);

  @override
  State<FeedbackPage> createState() => _FeedbackPageState();
}

class _FeedbackPageState extends State<FeedbackPage> {
  final _auth = FirebaseAuth.instance;

  int selectedRating = 0;

  // string for displaying the error Message
  String? errorMessage;

  // our form key
  final _formKey = GlobalKey<FormState>();
  final descriptionEditingController = new TextEditingController();

  @override
  void dispose() {
    descriptionEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // ENTER YOUR PERCEIVED CUSTOMER EXPERIENCE HOW LIKELY IS THE CUSTOMER LIKELY TO BUY A PRODUCT

    // NOTES
    final descriptionField = TextFormField(
        autofocus: false,
        controller: descriptionEditingController,
        keyboardType: TextInputType.text,
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
          hintText: "Enter any additional description here.",
          hintStyle: TextStyle(
            color: Colors.white,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ));

    final createFeedbackButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Colors.black,
      child: MaterialButton(
          padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          minWidth: MediaQuery.of(context).size.width,
          onPressed: () => showDialog(
                context: context,
                builder: (context) => feedbackConfirmation(),
              ),
          child: Text(
            "Send Feedback",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
          )),
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
                    RatingBar.builder(
                      initialRating: 3,
                      itemCount: 5,
                      onRatingUpdate: (rating) {
                        // print(rating);
                        selectedRating = rating.toInt();
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
                    SizedBox(height: 20),
                    descriptionField,
                    SizedBox(height: 15),
                    createFeedbackButton,
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

  Widget feedbackConfirmation() {
    return AlertDialog(
        backgroundColor: Colors.black.withOpacity(0.9),
        title: Text("Are you sure you want to create this feedback?",
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
              createAndSendFeedback();
              Navigator.pop(context);
            },
            child: Text(
              "Create feedback",
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
          ),
        ]);
  }

  void createAndSendFeedback() async {
    CollectionReference feedbackCollection =
        FirebaseFirestore.instance.collection('feedbacks');

    // Add the feedback to the feedbacks collection
    feedbackCollection.add({
      'rating': selectedRating,
      'description': descriptionEditingController.text,
      'dateCreated': Timestamp.now(),
    }).then((feedbackRef) {
      // Add feedbackID field to the feedback
      feedbackCollection
          .doc(feedbackRef.id)
          .set({'feedbackID': feedbackRef.id}, SetOptions(merge: true));

      // Add the feedback to the feedbacks collection within the user
    }).catchError((error) => print("Failed to add feedback: $error"));

    Fluttertoast.showToast(
      msg: "Feedback Created",
      textColor: Colors.black,
      backgroundColor: Colors.green,
      gravity: ToastGravity.CENTER,
    );
  }
}
