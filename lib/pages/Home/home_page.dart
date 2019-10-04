import 'package:flutter/material.dart';
import 'package:flutter_schooldev/services/authentication.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';
import 'package:flutter_schooldev/pages/Home/slideshow.dart';
import 'package:flutter_schooldev/pages/Post/testpage.dart';
import 'package:flutter_schooldev/pages/Home/buttoneffect/animated_child.dart';
import 'package:flutter_schooldev/pages/Home/buttoneffect/animated_floating_button.dart';
import 'package:flutter_schooldev/pages/Home/buttoneffect/background_overlay.dart';
import 'package:flutter_schooldev/pages/Home/buttoneffect/speed_dial.dart';
import 'package:flutter_schooldev/pages/Home/buttoneffect/speed_dial_child.dart';
import 'package:flutter_schooldev/pages/meal/mealview.dart';

class UnicornOrientation {
  static const HORIZONTAL = 0;
  static const VERTICAL = 1;
}

class HomePage extends StatefulWidget {
  HomePage({Key key, this.auth, this.userId, this.onSignedOut})
      : super(key: key);

  final BaseAuth auth;
  final VoidCallback onSignedOut;
  final String userId;

  final PageController ctrl = PageController();

  @override
  State<StatefulWidget> createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {


  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final _textEditingController = TextEditingController();
  bool _isEmailVerified = false;

  @override
  void initState() {
    super.initState();

    _checkEmailVerification();

      }
  void _checkEmailVerification() async {
    _isEmailVerified = await widget.auth.isEmailVerified();
    if (!_isEmailVerified) {
      _showVerifyEmailDialog();
    }
  }
  void _resentVerifyEmail(){
    widget.auth.sendEmailVerification();
    _showVerifyEmailSentDialog();
  }
  void _showVerifyEmailDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Verify your account"),
          content: new Text("Please verify account in the link sent to email"),
          actions: <Widget>[
            new FlatButton(
              child: new Text("Resent link"),
              onPressed: () {
                Navigator.of(context).pop();
                _resentVerifyEmail();
              },
            ),
            new FlatButton(
              child: new Text("Dismiss"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
  void _showVerifyEmailSentDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Verify your account"),
          content: new Text("Link to verify account has been sent to your email"),
          actions: <Widget>[
            new FlatButton(
              child: new Text("Dismiss"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
  @override
  _signOut() async {
    try {
      await widget.auth.signOut();
      widget.onSignedOut();
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    bool selected = false;
    Size size = MediaQuery.of(context).size;

    Color bgColor = Colors.green;
    Color textColor = Colors.black;

    return Scaffold(
      appBar: AppBar(
        title: Text('SchoolDev'),
        actions: <Widget>[
          new FlatButton(
              child: new Text('Logout',
                  style: new TextStyle(fontSize: 17.0, color: Colors.white)),
              onPressed: _signOut)
        ],
      ),
//      body: MyStatefulWidget(),
      body: Slideshow(),
      floatingActionButton: SpeedDial(
        // both default to 16
        marginRight: 18,
        marginBottom: 20,
        animatedIcon: AnimatedIcons.menu_close,
        animatedIconTheme: IconThemeData(size: 22.0),
        // this is ignored if animatedIcon is non null
//         child: Icon(Icons.add),
//        visible: dialVisible,
        // If true user is forced to close dial manually
        // by tapping main button and overlay is not rendered.
        closeManually: false,
        curve: Curves.bounceIn,
        overlayColor: Colors.black,
        overlayOpacity: 0.5,
        onOpen: () => print('OPENING DIAL'),
        onClose: () => print('DIAL CLOSED'),
        tooltip: 'Speed Dial',
        heroTag: 'speed-dial-hero-tag',
        backgroundColor: Colors.lightGreen,
        foregroundColor: Colors.black,
        elevation: 8.0,
        shape: CircleBorder(),
        children: [
          SpeedDialChild(
              child: Icon(Icons.person),
              backgroundColor: Colors.green,
              label: 'Profile',
              labelStyle: TextStyle(fontSize: 18.0),
              onTap: () => {
                print('First Child'),

              }
          ),
          SpeedDialChild(
            child: Icon(Icons.restaurant_menu),
            backgroundColor: Colors.deepOrange,
            label: 'Second',
            labelStyle: TextStyle(fontSize: 18.0),
            onTap: () => {
              print('SECOND CHILD'),
              Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => Mealview()))
            }
          ),
        ],
      ),

    );

  }

}

