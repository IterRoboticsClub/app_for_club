import 'package:appforclub/MyHomePage.dart';
import 'package:appforclub/screens/sign_in.dart';
import 'package:flutter/material.dart';

import 'package:google_sign_in/google_sign_in.dart';
import './home.dart';
import './about_us.dart';
class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isLoggedIn= false;

  GoogleSignIn _googleSignIn= GoogleSignIn(scopes: ['email']);
  _login() async {
    try{
      await _googleSignIn.signIn();
      setState(() {
        _isLoggedIn=true;
      })
      ;
    }catch(err){
      print(err);
    }
  }


  _logout() {
    setState(() {
      _isLoggedIn = false;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // FlutterLogo(size: 150),
              SizedBox(height: 50),
              _signInButton(),
             _skipText(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _signInButton() {
    return OutlineButton(
      splashColor: Colors.grey,
      onPressed: () {
        signInWithGoogle().whenComplete(() {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) {return MyHomePage(); },
            ),
          );
        });
      },
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
      highlightElevation: 0,
      borderSide: BorderSide(color: Colors.grey),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image(image: AssetImage("images/logo_google.png"), height: 35.0),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                'Sign in with Google',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.grey,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _skipText(){
    return RaisedButton(
          onPressed: () {
            // Navigate back to first route when tapped.
            Navigator.push(context,MaterialPageRoute(builder:(context)=>AboutUs()),);
          },
          color:Colors.blue,
          child: Text('skip login'));
  }
}

      
 