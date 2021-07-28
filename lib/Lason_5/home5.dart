import 'package:flutter/material.dart';
import 'package:flutter_networking_api/Lason_5/AddAuthor.dart';
import 'package:flutter_networking_api/Lason_5/UpdateAuthor.dart';
import 'package:flutter_networking_api/Lason_5/model_getData5.dart';
import 'package:flutter_networking_api/NetWork/api.dart';


//التعديل على josn
//UpdateAuthor
//UpdateAuthor
//UpdateAuthor

class Home5 extends StatefulWidget {
  @override
  _HomeState5 createState() => _HomeState5();
}

class _HomeState5 extends State<Home5> {
  late Future<List<Author5>> authors;
  @override
  void initState() {
    super.initState();
    setState(() {
      authors = API.getAutherList5();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Networking lesson 2'),
      ),
      body: Center(
        child: FutureBuilder<List<Author5>>(
          future: authors,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, i) {
                    return Dismissible(
                      key: ObjectKey(snapshot.data![i].id),
                      onDismissed: (direction) {
                        //print(direction.index);
                        API.deletAuther(snapshot.data![i].id);
                      },
                      child: Card(
                        child: ListTile(
                          title: Text(
                              '${snapshot.data![i].id} - ${snapshot.data![i].name}'),
                          subtitle: Row(
                            children: <Widget>[
//                              Text(snapshot.data![i].bio),
                              SizedBox(
                                width: 50,
                              ),
                              Text('${snapshot.data![i].age}'),
                            ],
                          ),
                          onTap: () async {
                            await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    UpdateAuthor(snapshot.data![i]),
                              ),
                            );
                            setState(() {
                              authors = API.getAutherList5();
                            });
                          },
                        ),
                      ),
                    );
                  });
            } else if (snapshot.hasError) {
              return Text('Sorry there is an error');
            }
            return CircularProgressIndicator();
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddAuthor(),
            ),
          );
          setState(() {
            authors = API.getAutherList5();
          });
        },
      ),
    );
  }
}
