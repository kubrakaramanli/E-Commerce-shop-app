import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shopapp/pages/signup.dart';
import 'home.dart';
import 'package:shopapp/pages/login.dart';

class FirebaseUser extends StatefulWidget {
  get uid => null;
  get get => null;
  get displayName => null;
  get photoUrl => null;

  @override
  _FirebaseUserState createState() => _FirebaseUserState();
}

class _FirebaseUserState extends State<FirebaseUser> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}


class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final _formKey =GlobalKey<FormState>();
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _passworsTextController = TextEditingController();
  FirebaseUser firebaseUser = new FirebaseUser();
  SharedPreferences preferences;
  bool loading = false;
  bool isLogedin = false;

  get documents => null;
  get regex => null;

  @override
  void initState() {
    super.initState();
    isSignedIn();

  }

  void isSignedIn() async {
    setState(() {
      loading = true;
    });


    if (isLogedin) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomePage()));
    }
    setState(() {
      loading = false;
    });
  }
 // Future handleSignIn() async {
// preferences = await SharedPreferences.getInstance();
//setState(() {
// loading = true;
//});
//}
  final FirebaseAuth auth = FirebaseAuth.instance;
  void _signInWithEmailAndPassword() async {
    final User user = (await auth.signInWithEmailAndPassword(
      email: _emailTextController.text,
      password: _passworsTextController.text,
    ))
        .user;

    if (user != null) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomePage()));

      setState(() {
        isLogedin = true;
        //us = user.email;
      });
    } else {
      setState(() {
        isLogedin = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:new AppBar(
        backgroundColor: Colors.red,
        centerTitle: true,
        title: new Text("Login", style: TextStyle(color: Colors.white),),
        elevation: 0.5,
      ),
      body: Stack(
        children: <Widget>[
          Image.asset('images/back2.png', alignment: Alignment.center,fit : BoxFit.fill,
            width: double.infinity,),
          Container(
            color: Colors.black.withOpacity(0.2),
            width: double.infinity,
            height: double.infinity,
          ),
       Center(
       child:  Padding(
          padding : const EdgeInsets.only(top: 200.0),
        child:  Center(
              child: Form(
                key: _formKey,
                child: ListView(children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
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
                  ),
                      validator: (value){
                        if (value.isEmpty){
                          Pattern pattern =
                              r'^(([#<>()[\]\\.i;:\s@\"]+(([#<>()[\]\\.i;:\s@\"]+';
                          RegExp regex = new RegExp(pattern);
                          if(!regex.hasMatch(value))
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
                    padding: const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
                    child: Material(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Colors.white.withOpacity(0.8),
                      elevation: 0.0,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 12.0),
                        child: TextFormField(
                          controller: _passworsTextController,
                          decoration: InputDecoration(
                            hintText: "password ",
                            icon: Icon(Icons.lock_outline),
                          ),
                          validator: (value){
                            if (value.isEmpty){
                              return 'The password field cannot be empty';
                           }
                            else if(value.length <6){
                              return 'the password has to be at least 6 characters long';
                           }
                            return null;
                          },
                        ),
                      ),
                    ),
                  ),
                   Padding(
                    padding: const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
                    child: Material(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Colors.red.shade900.withOpacity(0.5),
                      elevation: 0.0,
                      child: MaterialButton(onPressed: ()

    async {
    await _signInWithEmailAndPassword();

    },
                      minWidth: MediaQuery.of(context).size.width,
                        child: Text("Login ", textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20.0),),
                      )
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.all(8.0),
                  child: Text("Forgot password", textAlign: TextAlign.center, style: TextStyle(color: Colors.blueGrey, fontWeight: FontWeight.w400),),),

                  Padding(
                      padding:const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) =>SignUp()));
                      },
                    child: Text("Sign up",textAlign: TextAlign.center,style: TextStyle(color: Colors.red),
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

}
