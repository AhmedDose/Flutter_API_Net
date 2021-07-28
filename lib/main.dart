import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_networking_api/Lason%203/postDataApi3.dart';
import 'package:flutter_networking_api/Lason%204/getListData.dart';
import 'package:flutter_networking_api/Lason_5/home5.dart';

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
      home: Home5(),
    );
  }
}
