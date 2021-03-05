import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_app4/models/http_exception.dart';
import 'package:http/http.dart' as http;
class Authentication with ChangeNotifier
{
  Future<void> signup(String email, String password) async
  {
    const url = 'https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=AIzaSyDXNFI4AdF3_KPASNg6unxKXKaBbcDdajg';
    try{
      final response = await http.post(url, body: json.encode(
          {
            'email' : email,
            'password' : password,
            'returnSecureToken' : true,
          }
      ));
      final responseData = json.decode(response.body);
      if(responseData['error'] != null)
      {
        throw HttpException(responseData['error']['message']);
      }
      //print(responseData);

    }catch (error)
    {
      throw error;

    }


  }


  Future<void> logIn(String email, String password) async
  {
    const url = 'https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=AIzaSyDXNFI4AdF3_KPASNg6unxKXKaBbcDdajg';

    try{
      final response = await http.post(url, body: json.encode(
          {
            'email' : email,
            'password' : password,
            'returnSecureToken' : true,
          }
      ));
      final responseData = json.decode(response.body);
      if(responseData['error'] != null)
        {
          throw HttpException(responseData['error']['message']);
        }
      //print(responseData);

    } catch(error)
    {
      throw error;
    }


  }
}