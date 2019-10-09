import 'package:flutter/material.dart';



class generate extends StatefulWidget {
  final bool isEditing;

  generateState createState() => generateState();

  generate({this.isEditing = false});
}

class generateState extends State<generate> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.isEditing ? 'Edit Post' : 'Post'),
          centerTitle: false,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.done),
              onPressed: _onSave,
            )
          ],
        ),
        body: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: _onBlur,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    getTitleFormField(),
                    getBodyFormField(),
                  ],
                ),
              ),
            ),
          ),
        ));
  }

  Padding getTitleFormField() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 24, 0, 8),
      child: TextFormField(
//        initialValue: widget.review != null ? widget.review.title : null,
        decoration: InputDecoration(
            alignLabelWithHint: true,
            labelText: 'Title',
            border: OutlineInputBorder()),
        validator: (value) {
          if (value.isEmpty) {
            return '내용을 입력해주세요.';
          }
        },
        onSaved: (val) =>
            setState(() {
//              widget.review.title = val;
            }),
      ),
    );
  }

  Padding getBodyFormField() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
//        initialValue: widget.review != null ? widget.review.body : null,
        decoration: InputDecoration(
          alignLabelWithHint: true,
          labelText: 'Content',
          border: OutlineInputBorder(),
        ),
        maxLines: 10,
        validator: (value) {
          if (value.isEmpty) {
            return '내용을 입력해주세요.';
          }
        },
        onSaved: (val) =>
            setState(() {
//              widget.review.body = val;
            }),
      ),
    );
  }

  _onBlur() {
    FocusScope.of(context).unfocus();
  }

  _onSave() async {
    final form = _formKey.currentState;
    if (!form.validate()) {
      return;
    }
  }
}
