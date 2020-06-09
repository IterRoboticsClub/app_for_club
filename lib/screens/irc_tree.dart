import 'package:appforclub/widgets/appBar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IrcTree extends StatefulWidget {
  @override
  _IrcTreeState createState() => _IrcTreeState();
}

class _IrcTreeState extends State<IrcTree> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: appBarhead('IRC TREE'),
      body: new Center(
        child: new Text('This is the irc tree page'),
      ),
    );
  }
}
