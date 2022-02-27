import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

// ignore: use_key_in_widget_constructors
class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String email = "";
  String password = "";
  bool loading = false;
  final _loginFormKey = GlobalKey<FormState>();



  bool isValidEmail(String email) {
    final emailRegExp = RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    return emailRegExp.hasMatch(email);
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(height: 180),
            Text("Money Earn Save",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w900,
                )),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 40),
              child: Form(
                key: _loginFormKey,
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      onChanged: (value) {
                        email = value;
                        setState(() {});
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "This is mandatory";
                        } else if (!isValidEmail(value)) {
                          return "Invalid email";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          labelStyle: TextStyle(
                              color: Colors.black45,
                              fontSize: 22,
                              fontWeight: FontWeight.w600),
                          labelText: "Email address",
                          hintText: "Enter email address"),
                    ),
                    SizedBox(height: 25),
                    TextFormField(
                      onChanged: (value) {
                        password = value;
                        setState(() {});
                      },
                      obscureText: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "This is mandatory";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          labelStyle: TextStyle(
                              color: Colors.black45,
                              fontSize: 22,
                              fontWeight: FontWeight.w600),
                          labelText: "Password",
                          hintText: "Enter password"),
                    ),
                    SizedBox(height: 25),
                    Material(
                      color: Colors.teal[400],
                      borderRadius: BorderRadius.circular(8),
                      child: InkWell(
                        onTap: () async {
                          {
                            if (_loginFormKey.currentState!.validate()) {
                              setState(() {
                                loading = true;
                              });
                            }
                            try {

                              await FirebaseAuth.instance
                                  .createUserWithEmailAndPassword(
                                  email: email, password: password);
                              Fluttertoast.showToast(
                                  msg: "User Created Successfully",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.TOP,
                                  timeInSecForIosWeb: 3,
                                  fontSize: 16.0);
                              Navigator.pushNamed(context,'/home');

                            } on FirebaseAuthException catch (e) {
                              Fluttertoast.showToast(
                                  msg: e.message.toString(),
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.TOP,
                                  timeInSecForIosWeb: 3,
                                  fontSize: 16.0);
                            }
                            setState(() {
                              loading = false;
                            });
    }
    },
                        child: AnimatedContainer(
                            duration: Duration(seconds: 1),
                            width: loading ? 90 : 150,
                            height: 50,
                            alignment: Alignment.center,
                            child: loading
                                ? Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 8, horizontal: 2),
                              child: CircularProgressIndicator(
                                color: Colors.white,
                              ),
                            )
                                : Text("Register",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 22))),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}



