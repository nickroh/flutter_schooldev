import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_schooldev/setup/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_schooldev/setup/pages/sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SignupPage extends StatefulWidget {
  @override
  _LoginPageState createState() => new _LoginPageState();
}

class _LoginPageState extends State<SignupPage> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _email, _password;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(),
      body: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                validator: (input) {
                  if(input.isEmpty){
                    return 'Provide an email';
                  }
                },
                decoration: InputDecoration(
                    labelText: 'Email'
                ),
                onSaved: (input) => _email = input,
              ),
              TextFormField(
                validator: (input) {
                  if(input.length < 6){
                    return 'Longer password please';
                  }
                },
                decoration: InputDecoration(
                    labelText: 'Password'
                ),
                onSaved: (input) => _password = input,
                obscureText: true,
              ),
              RaisedButton(
                onPressed: signUp,
                child: Text('Sign Up'),
              ),
            ],
          )
      ),
    );
  }

  void signUp() async {
    if(_formKey.currentState.validate()){
      _formKey.currentState.save();
      try{
        await FirebaseAuth.instance.createUserWithEmailAndPassword(email: _email, password: _password);

        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage()));
      }catch(e){
        print(e.message);
      }
    }
  }
}