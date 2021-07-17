import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_networking_api/Learn_2/PostDataApi.dart';
import 'package:flutter_networking_api/model/modelPost.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: postDataApi(),
    );
  }
}

class Home extends StatefulWidget {
//  How to get and display data
  Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var url = Uri.parse('https://jsonplaceholder.typicode.com/posts/1');

//  Change its location for ease of access and ease of handling
  late Future<Post> postData;

  @override
  void initState() {
    super.initState();
//    getPostById();
    postData = getPostById();
  }

//  Get and display data
  Future<Post> getPostById() async {
    http.Response futurePost = await http.get(url);
    if (futurePost.statusCode == 200) {
//      print(futurePost.body);
      return Post.fromJson(json.decode(futurePost.body));
    } else {
      throw Exception('Eroor 404');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('API'),
      ),
      body: Center(
        child: FutureBuilder<Post>(
//          future :It is the location or access to the data
          future: postData,
//          builder :It is used to build the container itself and has several parameters
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Text(snapshot.data!.title);
            } else if (snapshot.hasError) {
              return Text('${snapshot.hasError}');
            }

            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
