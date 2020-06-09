import 'package:appforclub/widgets/appBar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CoolLinks extends StatefulWidget {
  @override
  _CoolLinksState createState() => _CoolLinksState();
}

class _CoolLinksState extends State<CoolLinks> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: appBarhead('COOL LINKS'),
      body: new Center(
        child: new Text('This is the cool links page'),
      ),
    );
  }
}
