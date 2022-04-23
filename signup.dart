
import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shopapp/compnents/products.dart';
import 'package:shopapp/pages/db/users.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:shopapp/pages/login.dart';
import '../db/users.dart';
import '../main.dart';


class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();
  UserServices _userServices = UserServices();


  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _passwordsTextController = TextEditingController();
  TextEditingController _nameTextController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();
  String gender;
  String groupValue = "male";
  bool hidePass = true;
  bool loading = false;

  Map get value => null;

  static FirebaseAuth instance;

  set value(Map value) {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.red,
        centerTitle: true,
        title: new Text("Login", style: TextStyle(color: Colors.white),),
        elevation: 0.5,
      ),
      body: Stack(
        children: <Widget>[
          Image.asset(
            'images/back2.png', alignment: Alignment.center, fit: BoxFit.fill,
            width: double.infinity,),
          Container(
            color: Colors.black.withOpacity(0.2),
            width: double.infinity,
            height: double.infinity,
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 200.0),
              child: Center(
                child: Form(
                    key: _formKey,
                    child: ListView(children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.fromLTRB(
                            14.0, 8.0, 14.0, 8.0),
                        child: Material(
                          borderRadius: BorderRadius.circular(20.0),
                          color: Colors.white.withOpacity(0.8),
                          elevation: 0.0,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 12.0),
                            child: TextFormField(
                              controller: _nameTextController,
                              decoration: InputDecoration(
                                hintText: "Full name ",
                                icon: Icon(Icons.person_outline),
                                border: InputBorder.none,
                              ),
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'The name field cannot be empty';
                                }
                                return null;
                              },
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(
                            10.0, 8.0, 14.0, 8.0),
                        child: new Container(
                          color: Colors.grey.withOpacity(0.4),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                  child: ListTile(
                                    title: Text("male",
                                      textAlign: TextAlign.end,
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    trailing: Radio(value: "male",
                                        groupValue: groupValue,
                                        onChanged: (e) => valueChanged(e)),
                                  )),
                              Expanded(
                                  child: ListTile(
                                    title: Text("female",
                                      textAlign: TextAlign.end,
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    trailing: Radio(value: "female",
                                        groupValue: groupValue,
                                        onChanged: (e) => valueChanged(e)),
                                  )),
                            ],
                          ),),),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(
                          14.0, 8.0, 14.0, 8.0,),
                        child: Material(
                          borderRadius: BorderRadius.circular(20.0),
                          color: Colors.white.withOpacity(0.5),
                          elevation: 0.0,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 12.0),
                            child: TextFormField(
                              controller: _emailTextController,
                              decoration: InputDecoration(
                                hintText: "Email ",
                                icon: Icon(Icons.alternate_email),
                                border: InputBorder.none,
                              ),
                              validator: (value) {
                                if (value.isEmpty) {
                                  Pattern pattern =
                                      r'^(([#<>()[\]\\.i;:\s@\"]+(([#<>()[\]\\.i;:\s@\"]+';
                                  RegExp regex = new RegExp(pattern);
                                  if (!regex.hasMatch(value))
                                    return 'Please make sure your email address is valid';
                                  else
                                    return null;
                                }
                              },
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(
                            14.0, 8.0, 14.0, 8.0),
                        child: Material(
                          borderRadius: BorderRadius.circular(20.0),
                          color: Colors.white.withOpacity(0.8),
                          elevation: 0.0,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 12.0),
                            child: ListTile(
                              title: TextFormField(
                                controller: _passwordsTextController,
                                obscureText: hidePass,
                                decoration: InputDecoration(
                                  hintText: "password ",
                                  icon: Icon(Icons.lock_outline),
                                  border: InputBorder.none,
                                ),
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'The password field cannot be empty';
                                  }
                                  else if (value.length < 6) {
                                    return 'the password has to be at least 6 characters long';
                                  }
                                  return null;
                                },
                              ),
                              trailing: IconButton(
                                  icon: Icon(Icons.remove_red_eye),
                                  onPressed: () {
                                    setState(() {
                                      hidePass = false;
                                    });
                                  }),
                            ),
                          ),),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(
                            14.0, 8.0, 14.0, 8.0),
                        child: Material(
                          borderRadius: BorderRadius.circular(20.0),
                          color: Colors.white.withOpacity(0.8),
                          elevation: 0.0,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 12.0),
                            child: ListTile(
                              title: TextFormField(
                                controller: _confirmPasswordController,
                                obscureText: hidePass,
                                decoration: InputDecoration(
                                  hintText: "Confirm password ",
                                  icon: Icon(Icons.lock_outline),
                                  border: InputBorder.none,
                                ),
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'The password field cannot be empty';
                                  }
                                  else if (value.length < 6) {
                                    return 'the password has to be at least 6 characters long';
                                  }
                                  else
                                  if (_passwordsTextController.text != value) {
                                    return "the passwords do not match";
                                  }
                                  return null;
                                },
                              ),
                              trailing: IconButton(
                                  icon: Icon(Icons.remove_red_eye),
                                  onPressed: () {
                                    setState(() {
                                      hidePass = false;
                                    });
                                  }),
                            ),
                          ),
                        ),),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(
                            14.0, 8.0, 14.0, 8.0),
                        child: Material(
                            borderRadius: BorderRadius.circular(5.0),
                            color: Colors.red.shade700.withOpacity(0.5),
                            elevation: 0.0,
                            child: MaterialButton(onPressed: () async{
                              validateForm();
                            },
                              minWidth: MediaQuery
                                  .of(context)
                                  .size
                                  .width,
                              child: Text(
                                "Sign up ", textAlign: TextAlign.center,
                                style: TextStyle(color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0),),
                            )
                        ),
                      ),
                      Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: InkWell(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Text("Login ", textAlign: TextAlign.center,
                                style: TextStyle(color: Colors.blueGrey),
                              ))
                      ),
                    ],
                    )),
              ),
            ),
          ),


          Visibility(
            visible: loading ?? true,
            child: Center(
              child: Container(
                alignment: Alignment.center,
                color: Colors.white.withOpacity(0.7),
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
                ),
              ),
            ),
          )
        ],
      ),

    );
  }

  valueChanged(e) {
    setState(() {
      if (e == "male") {
        groupValue = e;
        gender = e;
      }
      else if (e == "female") {
        groupValue = e;
        gender = e;
      }
    });
  }

  Future validateForm() async {
    FormState formState = _formKey.currentState;

    if (formState.validate()) {
      formState.reset();
      FirebaseUser firebaseUser = null;
      if (firebaseUser == null) {
        firebaseAuth
            .createUserWithEmailAndPassword(
            email: _emailTextController.text,
            password: _passwordsTextController.text)
            .then((user) => {
          _userServices.createUser(
            firebaseUser.uid.toString(),
              {
                "username": _nameTextController.text,
                "email": _emailTextController.text,
                "userId": firebaseUser.uid,
                "gender": gender,
              }
          )
        }).catchError((err) => {print(err.toString())});
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => HomePage()));
      }
      }
    }
  }




