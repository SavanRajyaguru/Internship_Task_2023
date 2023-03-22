import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class RemotePostService{
  final client = http.Client();

  // POST
  void postProductInfo(String title, String body, String userId) async {
    var response = await client.post(
      Uri.parse('https://jsonplaceholder.typicode.com/posts'),
      body: {
        'title': title,
        'body': body,
        'userId': userId,
      },
    );

    if(response.statusCode == 201){
      if(kDebugMode) {
        print(response.body);
      }
    } else {
      //error msg
    }
  }

  //PUT
  void putProductInfo(String title, String body, String userId) async {
    var response = await client.put(
      Uri.parse('https://jsonplaceholder.typicode.com/posts/1'),
      body: {
        'title': title,
        'body': body,
        'userId': userId,
      },
    );

    if(response.statusCode == 200){
      if(kDebugMode) {
        print(response.body);
      }
    } else {
      // error
    }
  }

  //PATCH
  void patchProductInfo(String title, String? body, String? userId) async {
    var response = await client.put(
      Uri.parse('https://jsonplaceholder.typicode.com/posts/1'),
      body: {
        'title': title,
        // 'body': body,
        // 'userId': userId,
      },
    );

    if(response.statusCode == 200){
      if(kDebugMode) {
        print(response.body);
      }
    } else {
      //error msg
    }
  }
}