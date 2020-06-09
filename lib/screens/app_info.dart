import 'package:appforclub/widgets/appBar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: appBarhead('App Info'),
      body: new Center(
        child: new Text('This is the app info page'),
      ),
    );
  }
}
