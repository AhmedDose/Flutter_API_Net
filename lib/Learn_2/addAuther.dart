import 'package:flutter/material.dart';
import 'package:flutter_networking_api/NetWork/api.dart';
import 'package:flutter_networking_api/model/auther.dart';

class addAuther extends StatefulWidget {
  @override
  _addAutherState createState() => _addAutherState();
}

class _addAutherState extends State<addAuther> {
  var AutherName;
  // addAutherkey == هوا عبارة عن اي دي لشاشة معينة
  final addAuther = GlobalKey<ScaffoldState>();
  TextEditingController Acontroll = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    AutherName = Acontroll.text;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: addAuther,
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

                  API.creatAuther(AutherName).then((Auther) {
                    // show snikbar
                    //لعرض النتيجة
                    addAuther.currentState!.showSnackBar(
                        SnackBar(content: Text('add ${Auther.id}')));
                  });
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
