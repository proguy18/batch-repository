import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:telecomm_mobile/screens/admin_view.dart';
// import 'package:telecomm_mobile/screens/forgot_password_screen.dart';
// import 'package:telecomm_mobile/screens/registration_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:telecomm_mobile/screens/home_page.dart';
import 'package:telecomm_mobile/screens/registration_page.dart';
// import 'package:telecomm_mobile/screens/navbar.dart';
// import 'package:video_player/video_player.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //password check
  bool _showPassword = false;
  void _togglevisibility() {
    setState(() {
      _showPassword = !_showPassword;
    });
  }

  //video
  // late VideoPlayerController _controller;
  // form key
  final _formKey = GlobalKey<FormState>();

  // editing controller
  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();

  // firebase
  final _auth = FirebaseAuth.instance;

  // string for displaying the error Message
  String? errorMessage;

  @override
  void initState() {
    super.initState();
    // _controller = VideoPlayerController.asset('assets/video1.mp4')
    // ..initialize().then((_) {
    // _controller.play();
    // _controller.setLooping(true);
    // _controller.setVolume(0.0);
    // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
    // setState(() {});
    // });
  }

  @override
  Widget build(BuildContext context) {
    //email field
    final emailField = TextFormField(
        autofocus: false,
        controller: emailController,
        keyboardType: TextInputType.emailAddress,
        validator: (value) {
          if (value!.isEmpty) {
            return ("Please enter your email");
          }
          // reg expression for email validation
          if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
              .hasMatch(value)) {
            return ("Please enter a valid email");
          }
          return null;
        },
        onSaved: (value) {
          emailController.text = value!;
        },
        textInputAction: TextInputAction.next,
        style: TextStyle(
          color: Colors.white,
        ),
        decoration: InputDecoration(
          fillColor: Colors.black.withOpacity(0.2),
          filled: true,
          prefixIcon: Icon(
            Icons.mail,
            color: Colors.white,
          ),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Email",
          hintStyle: TextStyle(
            color: Colors.white,
          ),
        ));

    //password field
    final passwordField = TextFormField(
        autofocus: false,
        controller: passwordController,
        obscureText: !_showPassword,
        validator: (value) {
          RegExp regex = new RegExp(r'^.{6,}$');
          if (value!.isEmpty) {
            return ("Password is required for login");
          }
          if (!regex.hasMatch(value)) {
            return ("Enter valid password (Min. 6 characters)");
          }
        },
        onSaved: (value) {
          passwordController.text = value!;
        },
        textInputAction: TextInputAction.done,
        decoration: InputDecoration(
          focusColor: Colors.white,
          fillColor: Colors.black.withOpacity(0.2),
          filled: true,
          prefixIcon: Icon(
            Icons.vpn_key,
            color: Colors.white,
          ),
          suffixIcon: GestureDetector(
            onTap: () {
              _togglevisibility();
            },
            child: Icon(
              _showPassword ? Icons.visibility : Icons.visibility_off,
              color: Colors.white,
            ),
          ),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Password",
          hintStyle: TextStyle(
            color: Colors.white,
          ),
        ));

    final loginButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Colors.black,
      child: MaterialButton(
          padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          minWidth: MediaQuery.of(context).size.width,
          onPressed: () {
            signIn(emailController.text, passwordController.text);
          },
          child: Text(
            "Login",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
          )),
    );

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Stack(
              children: [
                //1
                SizedBox.expand(
                  child: FittedBox(
                    fit: BoxFit.cover,
                    child: SizedBox(
                        // width: _controller.value.size.width ?? 0,
                        // height: _controller.value.size.height ?? 0,
                        // child: VideoPlayer(_controller),
                        ),
                  ),
                ),
                //2
                Padding(
                  padding: const EdgeInsets.all(36.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(
                            height: 200,
                            child: Image.asset(
                              "assets/inferno_logo_black.png",
                              fit: BoxFit.contain,
                            )),
                        Padding(
                          padding: EdgeInsets.fromLTRB(
                            MediaQuery.of(context).size.width * 0.05,
                            MediaQuery.of(context).size.height * 0.1,
                            MediaQuery.of(context).size.width * 0.05,
                            MediaQuery.of(context).size.width * 0.025,
                          ),
                          child: emailField,
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(
                            MediaQuery.of(context).size.width * 0.05,
                            MediaQuery.of(context).size.height * 0.025,
                            MediaQuery.of(context).size.width * 0.05,
                            MediaQuery.of(context).size.width * 0.1,
                          ),
                          child: passwordField,
                        ),
                        loginButton,
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                "Don't have an account? ",
                                style: TextStyle(color: Colors.black),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              RegistrationPage()));
                                  // HomePage()));
                                },
                                child: Text(
                                  "Sign up",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                ),
                              ),
                            ]),
                        Padding(
                          padding: EdgeInsets.fromLTRB(0,
                              MediaQuery.of(context).size.height * 0.025, 0, 0),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          // ForgotPassword()));
                                          HomePage()));
                            },
                            child: Text(
                              "Forgot password",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  // login function
  void signIn(String email, String password) async {
    if (_formKey.currentState!.validate()) {
      try {
        await _auth
            .signInWithEmailAndPassword(email: email, password: password)
            .then((userCreds) async => {
                  // // Redirect to admin app
                  // if (await isAdmin(userCreds.user?.uid))
                  //   {
                  //     Fluttertoast.showToast(msg: "Admin login successful"),
                  //     Navigator.of(context).pushReplacement(MaterialPageRoute(
                  //         builder: (context) =>
                  //             // AdminScreen())),
                  //             HomePage())),
                  //   }
                  // // Redirect to user app
                  // else
                  //   {
                  //     Fluttertoast.showToast(msg: "User login successful"),
                  //     Navigator.of(context).pushReplacement(MaterialPageRoute(
                  //         builder: (context) =>
                  //             // NavBarHomeScreen())),
                  //             HomePage())),
                  //   }
                  Fluttertoast.showToast(msg: "Login successful"),
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) =>
                          // AdminScreen())),
                          HomePage())),
                });
      } on FirebaseAuthException catch (error) {
        switch (error.code) {
          case "invalid-email":
            errorMessage = "Your email address appears to be malformed.";

            break;
          case "wrong-password":
            errorMessage = "Your password is wrong.";
            break;
          case "user-not-found":
            errorMessage = "User with this email doesn't exist.";
            break;
          case "user-disabled":
            errorMessage = "User with this email has been disabled.";
            break;
          case "too-many-requests":
            errorMessage = "Too many requests";
            break;
          case "operation-not-allowed":
            errorMessage = "Signing in with email and password is not enabled.";
            break;
          default:
            errorMessage = "An undefined error happened.";
        }
        Fluttertoast.showToast(msg: errorMessage!);
        print(error.code);
      }
    }
  }

  @override
  void dispose() {
    super.dispose();
    // _controller.dispose();
  }

  Future<bool> isAdmin(uid) async {
    var collectionReference =
        await FirebaseFirestore.instance.collection("users").doc(uid).get();
    return collectionReference.data()!['isAdmin'];
  }
}
