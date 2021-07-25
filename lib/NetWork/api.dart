import 'dart:convert';

import 'package:flutter_networking_api/model/auther.dart';
import 'package:flutter_networking_api/model/auther3.dart';
import 'package:flutter_networking_api/model/auther4.dart';
import 'package:http/http.dart';

class API {
  static const String _Base_Url = 'https://jsonplaceholder.typicode.com';

// من اجل جلب البيانات فقط وطباعتها
// static Future<Response> creatAuther(String name) async

// من اجل جلب البيانات وعرضها
  static Future<Auther> creatAuther(String name) async {
    final Response response = await post(Uri.parse('$_Base_Url/posts'),
        headers: <String, String>{
//          data encoding type
          'Content-Type': 'application/json;charset=UTF-8'
//     Here we select the type of data we want to send
        },
        body: jsonEncode(<String, String>{"name": name}));
    if (response.statusCode == 201) {
      // هنا لطباعة البيانات
      // print(response.body);
      return Auther.fromJson(json.decode(response.body));
    } else {
      throw Exception('Eroooooor');
      // print('Eroor');
    }
    // return response;
  }

// من اجل ارسال مصفوفة او مجموعة من البانات
  static Future<Author3> creatAuther3(Author3 auther3) async {
    final Response response = await post(Uri.parse('$_Base_Url/posts'),
        headers: <String, String>{
//          data encoding type
          'Content-Type': 'application/json;charset=UTF-8'
//     Here we select the type of data we want to send
        },
        body: jsonEncode(auther3.toJson()));
    if (response.statusCode == 201) {
      // هنا لطباعة البيانات
      // print(response.body);

      return Author3.fromJson(json.decode(response.body));
    } else {
      throw Exception('Cant load author');
      // print('Eroor');
    }
    // return response;
  }

// دالة من اجل جلب مصفوفة من البيانات
  static Future<List<Auther4>> getAutherList() async {
    final Response response = await get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    if (response.statusCode == 200) {
      // هنا لطباعة البيانات
      print(response.body);

      final parsed = json.decode(response.body).cast<Map<String, dynamic>>();
      return parsed.map<Auther4>((item) => Auther4.fromJson(item)).toList();
      
      // return Author3.fromJson(json.decode(response.body));
    } else {
      throw Exception('Cant load author');
      // print('Eroor');
    }
    // return response;
  }
}
