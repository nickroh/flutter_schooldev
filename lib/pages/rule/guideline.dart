import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class GuideLine extends StatefulWidget {
  @override
  GuideLine({
    Key key,
  }):super(key : key);
  _GuideLineState createState() => _GuideLineState();
}

class _GuideLineState extends State<GuideLine>{

  Widget lorem_widget(){
    return Container(
      padding: EdgeInsets.fromLTRB(4,14,4,14),
//      decoration: BoxDecoration(
//          color: Color.fromRGBO(241, 241, 241, 0.8),
//          borderRadius: new BorderRadius.only(
//              topLeft: const Radius.circular(10.0),
//              topRight: const Radius.circular(10.0),
//              bottomRight: const Radius.circular(10.0),
//              bottomLeft:const Radius.circular(10.0)
//          )),
      child: Align(
          alignment: Alignment.center,
//      padding: EdgeInsets.all(20.0),
          child: Text(
            '1. 싸우지 말것\n'
            '2. 욕하지 말것\n'
            '3. 착하게 살것\n'
            ,
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: 23.0,
              color: Colors.black,
            ),
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text('Community Guideline'),
      ),
      body: SingleChildScrollView(
          child: Container(
//            height: ,
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.all(30.0),
//            decoration: BoxDecoration(
//              gradient: LinearGradient(colors: [
//                Colors.white,
//                Colors.lightGreenAccent,
//              ]),
//            ),
            child: Column(
              children: <Widget>[ lorem_widget()],
            ),
          )
      ),
    );
  }
}