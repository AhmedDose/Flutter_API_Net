import 'package:flutter/material.dart';
import 'package:flutter_networking_api/Lason%203/addAuther3.dart';
import 'package:flutter_networking_api/NetWork/api.dart';
import 'package:flutter_networking_api/model/auther4.dart';

class Home4 extends StatefulWidget {
  @override
  _HomeState4 createState() => _HomeState4();
}

class _HomeState4 extends State<Home4> {
  late Future<List<Auther4>> authors;
  @override
  void initState() {
    super.initState();
    setState(() {
      authors = API.getAutherList();
    });

    print(authors.hashCode);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('get Data Api'),
      ),
      body: FutureBuilder<List<Auther4>>(
        future: authors,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, i) {
                  return Card(
                    child: ListTile(
                      title: Text(snapshot.data![i].title),
                      subtitle: Row(
                        children: <Widget>[
                          Text(snapshot.data![i].body.toString()),
                          SizedBox(
                            width: 100,
                          ),
                          Text('${snapshot.data![i].id}'),
                        ],
                      ),
                    ),
                  );
                });
          } else if (snapshot.hasError) {
            Text('Sorry there is an error');
          }
          return CircularProgressIndicator();
        },
      ),
      // من اجل عملية التنقل والاضافة وعدم القيام بالرجوع حتى تتم عملية الاضافة
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => addAuther3(),
            ),
          );
          setState(() {
            authors = API.getAutherList();
          });
        },
      ),
    );
  }
}
