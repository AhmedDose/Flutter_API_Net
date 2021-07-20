import 'dart:convert';

import 'package:http/http.dart';

class API {
  static const String _Base_Url = 'https://jsonplaceholder.typicode.com';

  static Future<Response> creatAuther(String name) async {
    final Response response = await post(Uri.parse('$_Base_Url/posts'),
        headers: <String, String>{
//          data encoding type

          'Content-Type': 'application/json;charset=UTF-8'

//     Here we select the type of data we want to send
        },
        body: jsonEncode(<String, String>{"name": name}));

    if (response.statusCode == 200) {
      print(response.body);
    } else {
      print('Eroor');
    }
    return response;
  }
}
