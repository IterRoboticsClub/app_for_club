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
      body: new Center(
        child: new Text('This is the Profile page'),
      ),
    );
  }
}
