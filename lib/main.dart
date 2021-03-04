import 'package:flutter/material.dart';
import 'package:flutter_app4/models/authentication.dart';
import 'package:flutter_app4/screens/home_screen.dart';
import 'package:flutter_app4/screens/login_screen.dart';
import 'package:flutter_app4/screens/sign_up.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: Authentication())
      ],
      child: MaterialApp(
        title: 'Flutter App',
        theme: ThemeData(
          primaryColor: Colors.blue
        ),
        home: LoginScreen(),
        routes: {
          SignUp.routeName: (ctx)=> SignUp(),
          LoginScreen.routeName: (ctx)=> LoginScreen(),
          HomeScreen.routeName: (ctx)=> HomeScreen()
        },
      ),
    );
  }
}

