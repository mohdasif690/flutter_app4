
import 'package:flutter/material.dart';
import 'package:flutter_app4/models/servercall.dart';
import 'package:flutter_app4/utils/constants.dart';
import 'package:provider/provider.dart';
import 'package:flutter_app4/models/authentication.dart';
import 'package:flutter_app4/screens/login_screen.dart';
import 'dart:async';


class HomeScreen extends StatefulWidget {
  static const routeName = '/HomeScreen';
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
        actions: [
          FlatButton(onPressed: (){
            Navigator.of(context).pushReplacementNamed(LoginScreen.routeName);
            //auth.signOut()
          },
           child: Text("LogOut",
            style: TextStyle(fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Colors.tealAccent
          ),))
        ],
      ),
      body: TodosListView()
    );
  }
}
