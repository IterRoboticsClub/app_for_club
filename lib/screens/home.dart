import 'package:appforclub/widgets/appBar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: appBarhead('home'),
      body: new Center(
        child: new Text('This is the home page'),
      ),
    );
  }
}
