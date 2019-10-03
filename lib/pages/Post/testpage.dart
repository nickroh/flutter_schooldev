import 'package:flutter/material.dart';

import 'package:flutter_markdown/flutter_markdown.dart';

class testpage extends StatefulWidget{

  @override
  State<StatefulWidget> createState() => new _testpagestate();
}

class _testpagestate extends State<testpage>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('SchoolDev'),
      ),
      body: new Markdown(data:'')
    );
  }
}