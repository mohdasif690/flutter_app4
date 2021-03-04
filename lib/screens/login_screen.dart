import 'package:flutter/material.dart';
import 'package:flutter_app4/models/authentication.dart';
import 'package:flutter_app4/screens/home_screen.dart';
import 'package:flutter_app4/screens/sign_up.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = '/login';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  Map<String, String> _authData = {
    'email' : '',
    'password' : ''
  };

  void _showErrorDialog(String msg)
  {
    showDialog(context: context,
    builder: (ctx)=> AlertDialog(
      title: Text('An Error Occured'),
      content: Text(msg),
      actions: [
        FlatButton(onPressed: () {
          Navigator.of(ctx).pop();
        },
            child: Text('Okay') )
      ],
    ));
  }
  Future<void> _submit() async
  {
    if(!_formKey.currentState.validate())
      {
        return;
      }
    _formKey.currentState.save();

    try{
      await Provider.of<Authentication>(context, listen: false).logIn(
          _authData['email'],
          _authData['password']);
      Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);

    }catch (error)
    {
      var errorMessage = 'Authentication Failed. Please try again later';
      _showErrorDialog(errorMessage);

    }

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
        actions: <Widget>[
          FlatButton(onPressed: (){
            Navigator.of(context).pushReplacementNamed(SignUp.routeName);
          },
              child: Row(
                children: [
                  Text('SignUp'),
                  Icon(Icons.person_add)
                ],
              ),
            textColor: Colors.white,
          )
        ],
      ),
      body: Stack(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.lightGreenAccent,
                  Colors.blue,
                ]
              )
            ),
          ),
          Center(
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Container(
                height: 260,
                width: 300,
                padding: EdgeInsets.all(16),
                child: Form(
                  key: _formKey,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        TextFormField(
                          decoration: InputDecoration(labelText: 'Email'),
                          keyboardType: TextInputType.emailAddress,
                          validator: (value)
                          {
                            if(value.isEmpty || !value.contains('@'))
                              {
                                return 'invalid email';
                              }
                            return null;
                          },
                          onSaved: (value)
                            {
                              _authData['email'] = value;

                            },
                        ),
                        TextFormField(
                          decoration: InputDecoration(labelText: 'Password'),
                          obscureText: true,
                          validator: (value)
                            {
                              if(value.isEmpty || value.length<=5)
                                {
                                  return 'invalid password';
                                }
                              return null;
                            },
                          onSaved: (value)
                            {
                              _authData['password'] = value;

                            }
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        RaisedButton(
                          child: Text(
                            'Submit'
                          ),
                          onPressed: ()
                          {
                            _submit();
                          },
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          color: Colors.blue,
                          textColor: Colors.white,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
