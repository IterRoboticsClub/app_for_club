import 'package:appforclub/widgets/appBar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ContactUs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: appBarhead('Contact Us'),
      body: new Center(
        child: new Text('This is the Contact Us page'),
      ),
    );
  }
}
