// import 'dart:html';

import 'package:appforclub/MyHomePage.dart';
import 'package:appforclub/widgets/appBar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileView extends StatefulWidget {
  @override
  _ProfileViewState createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: appBarhead('Profile'),
      floatingActionButton: FloatingActionButton(
        onPressed: null,
        child: Icon(Icons.edit),
      ),
      body: new Center(
        child: SingleChildScrollView(
            child: new Column(
          children: <Widget>[
            Center(
              child: mainuser.imgurl == null
                  ? Icon(
                      Icons.account_circle,
                      size: 15,
                    )
                  : Image.network(
                      mainuser.imgurl,
                      fit: BoxFit.contain,
                    ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              mainuser.name,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              mainuser.email,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 15,
              ),
            ),
          ],
        )),
      ),
    );
  }
}
