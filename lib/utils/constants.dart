//import 'dart:js';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;


class Todo{
  var userId;
  var id;
  final String title;
  var completed;

  Todo({this.userId,this.id,this.title,this.completed});

  factory Todo.fromJson(Map<String,dynamic> json){
    return Todo(
        userId: json['userId'],
        id: json['id'],
        title: json['title'],
        completed: json['completed']
    );
  }
}
class TodosListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Todo>> (
      future: _fetchTodos(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<Todo> data = snapshot.data;
          return _todosListView(data);
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }
        return CircularProgressIndicator();
      },
    );

  }

  Future<List<Todo>> _fetchTodos() async{
    final todosListAPIUrl ='https://jsonplaceholder.typicode.com/todos';
    final response = await http.get(todosListAPIUrl);

    if(response.statusCode == 200){
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((todo) => new Todo.fromJson(todo)).toList();
    }else {
      throw Exception('Failed to load todo from API');
    }
  }
  ListView _todosListView(data){
    return ListView.builder(itemCount: data.length,
    itemBuilder: (context, index){
      return _tile(data[index].title);
    });
  }
  ListTile _tile(String title) => ListTile(
    title: Text(title,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
    subtitle: Text(''),
  );
}
