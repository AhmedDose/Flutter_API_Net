import 'package:flutter/material.dart';

class addAuther extends StatefulWidget {
  @override
  _addAutherState createState() => _addAutherState();
}

class _addAutherState extends State<addAuther> {
  var AutherName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(
                    labelText: 'Auther name', hintText: 'enter auther name'),
                onChanged: (vale) {
                  setState(() {
                    AutherName = vale;
                  });
                },
              ),
              RaisedButton(
                onPressed: () {
                  // send data
                },
                child: Text('Save'),
              )
            ],
          ),
        ),
      ),
      appBar: AppBar(
        title: Text('New Auther'),
      ),
    );
  }
}
