import 'package:flutter/material.dart';
import 'package:flutter_networking_api/Lason%203/addAuther3.dart';
import 'package:flutter_networking_api/Learn_2/addAuther.dart';

class postDataApi3 extends StatefulWidget {
  @override
  _postDataApiState3 createState() => _postDataApiState3();
}

class _postDataApiState3 extends State<postDataApi3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: null,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => addAuther3()));
        },
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        title: Text('Networl Learn 3'),
      ),
    );
  }
}
