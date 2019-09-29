import 'package:flutter_schooldev/setup/pages/sign_in.dart';
import 'package:flutter_schooldev/setup/pages/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth_buttons/flutter_auth_buttons.dart';


class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('School Dev'),
      ),
      backgroundColor: Color.fromARGB(0xFF, 0xF0, 0xF0, 0xF0),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 25.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  GoogleSignInButton(onPressed: () {}),
                  FacebookSignInButton(onPressed: () {}),
                  RaisedButton(
                    onPressed: navigateToSignIn,
                    child: Text('Sign In With Email'),
                    color: Color.fromARGB(0xFF, 0xF0, 0xF0, 0xF0),
                  ),
                ],
              ),
            ),
            SizedBox(height: 25.0,),
            RaisedButton(
              onPressed: navigateToSignUp,
              child: Text('Sign Up'),
              color: Color.fromARGB(0xFF, 0xF0, 0xF0, 0xF0),
            )
          ],
        ),
      )

    );
  }

  void navigateToSignIn(){
    Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage(), fullscreenDialog: true));
  }

  void navigateToSignUp(){
    Navigator.push(context, MaterialPageRoute(builder: (context) => SignupPage(), fullscreenDialog: true));
  }
}