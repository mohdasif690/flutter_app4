// import 'dart:convert' as convert;
//
// import 'package:flutter_app4/utils/constants.dart';
// import 'package:http/http.dart' as http;
//
// String url = 'https://jsonplaceholder.typicode.com/todos';
//
// class ServerCall{
//   static Future<http.Response> callServer(String url) {
//     return http.get(url);
//   }
//   static Future<List<Todo>> convertResponseIntoTodo(String url) async{
//     http.Response response = await callServer(url);
//     String json = response.body;
//     dynamic map = convert.jsonDecode(json);
//     List<dynamic> todoList = map['todos'];
//     List<Todo> todos = todoList.map((todo) => Todo(todo['userId'], todo['id'],todo['title'],todo['completed'] )).toList();
//     print(todos);
//     return todos;
//   }
//
// }
