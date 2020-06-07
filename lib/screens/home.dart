import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'sign_in.dart';
import  'package:appforclub/screens/Login.dart';
class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Hello'),
      ),
     
      body: Container(
        color: Colors.white,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("This is the Home Page"),
              _logout(context),
              
            ],
          ),
        ),
      ),
    );
  }
    Widget _logout(BuildContext context){
      return  RaisedButton(onPressed: (){
        Navigator.push(context,MaterialPageRoute(builder:(context)=>LoginPage()),);
      },color:Colors.blue,
          child: Text('Logout'));
    }
  
}
