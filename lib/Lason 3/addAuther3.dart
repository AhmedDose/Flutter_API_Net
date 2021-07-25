import 'package:flutter/material.dart';
import 'package:flutter_networking_api/NetWork/api.dart';
import 'package:flutter_networking_api/model/auther.dart';
import 'package:flutter_networking_api/model/auther3.dart';

class addAuther3 extends StatefulWidget {
  @override
  _addAutherState3 createState() => _addAutherState3();
}

class _addAutherState3 extends State<addAuther3> {
  late String name3;
  late String bio;
  late String age;

  // addAutherkey == هوا عبارة عن اي دي لشاشة معينة
  final addAuther3 = GlobalKey<ScaffoldState>();
  TextEditingController Acontroll = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: addAuther3,
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
                    name3 = vale;
                  });
                },
              ),
              TextField(
                decoration: InputDecoration(
                    labelText: 'Auther bio', hintText: 'enter auther bio'),
                onChanged: (vale) {
                  setState(() {
                    bio = vale;
                  });
                },
              ),
              TextField(
                decoration: InputDecoration(
                    labelText: 'Auther age', hintText: 'enter auther age'),
                onChanged: (vale) {
                  setState(() {
                    age = vale;
                  });
                },
              ),
              RaisedButton(
                onPressed: () {
                  // send data
                  // عندما يكون من الصعب تصحيح الخطا ,,,,.. تفقد الكود القبله فانه احتمال يكون الخطى منه
                  API
                      .creatAuther3(Author3(
                    name: name3,
                    age: age,
                    bio: bio,
                    id: 103,
                  ))
                      .then((author) {
                    // show snikbar
                    //لعرض النتيجة
                    addAuther3.currentState!.showSnackBar(
                        SnackBar(content: Text('add ${author.id}')));
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
