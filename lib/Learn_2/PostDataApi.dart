import 'package:flutter/material.dart';
import 'package:flutter_networking_api/Learn_2/addAuther.dart';

class postDataApi extends StatefulWidget {
  @override
  _postDataApiState createState() => _postDataApiState();
}

class _postDataApiState extends State<postDataApi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: null,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => addAuther()));
        },
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        title: Text('Networl Learn 2'),
      ),
    );
  }
}
