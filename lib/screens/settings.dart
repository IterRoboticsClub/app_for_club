import 'package:appforclub/widgets/appBar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: appBarhead('Settings'),
      body: new Center(
        child: new Text('This is the settings page'),
      ),
    );
  }
}
