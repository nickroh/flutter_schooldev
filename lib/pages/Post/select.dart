import 'package:dynamic_list_view/DynamicListView.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';


class select extends StatefulWidget {
  @override
  _selectState createState() => _selectState();
  final String title = 'Beta,,';

}

class _selectState extends State<select> {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body:ListPage(),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // Add your onPressed code here!
        },
        label: Text('new'),
        icon: Icon(Icons.add_circle),
        backgroundColor: Colors.lightGreen,
      ),
    );
  }
}

class ListPage extends StatefulWidget{

  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage>{

  Future _data;

  Future getPost() async {
    var firestore = Firestore.instance;

    QuerySnapshot qn = await firestore.collection('post').getDocuments();

    return qn.documents;
  }
  
  navigateToDetail(DocumentSnapshot post){
    Navigator.push(context, MaterialPageRoute(builder: (context) => DetailPage(post: post,)));
  }

  @override
  void initState(){
    super.initState();

    _data = getPost();

  }

  @override
  Widget build(BuildContext context){
    return Container(
      child: FutureBuilder(
        future: _data,
        builder: (_, snapshot){

          if(snapshot.connectionState == ConnectionState.waiting){
            return _buildWaitingScreen();
          } else{

            return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (_, index){

                  return ListTile(
                    title: Text(snapshot.data[index].data['title']),
                    onTap: () => navigateToDetail(snapshot.data[index]),
                  );
                });
          }
        }),
    );
  }

  Widget _buildWaitingScreen() {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: CircularProgressIndicator(),
      ),
    );
  }


}

class DetailPage extends StatefulWidget{

  final DocumentSnapshot post;

  DetailPage({this.post});

  @override
  _DatailPageState createState() => _DatailPageState();
}

class _DatailPageState extends State<DetailPage>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.post.data['title'])
      ),
      body: Container(
        child: Card(
          child: ListTile(
            title: Text(widget.post.data['title']),
            subtitle: Text(widget.post.data['content']),
          ),
        ),
      ),

    );
  }

}