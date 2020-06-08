import 'package:appforclub/MyHomePage.dart';
import 'package:appforclub/screens/intro.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: Launch(),
      theme: ThemeData(
        accentColor: Colors.blueGrey,
        backgroundColor: Colors.blueGrey,
        textTheme: Theme.of(context).textTheme.apply(
              fontFamily: 'BreeSerif',
            ),
      ),
    );
  }
}

class Launch extends StatefulWidget {
  @override
  LaunchState createState() => new LaunchState();
}

class LaunchState extends State<Launch> {
  Future checkFirstSeen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool _seen = (prefs.getBool('seen') ?? false);

    if (_seen) {
      //Check if logged in , if not go to login.dart
      //otherwise
      Navigator.of(context).pushReplacement(
          new MaterialPageRoute(builder: (context) => new MyHomePage()));
    } else {
      await prefs.setBool('seen', true);
      Navigator.of(context).pushReplacement(
          new MaterialPageRoute(builder: (context) => new IntroScreen()));
    }
  }

  @override
  void initState() {
    super.initState();
    checkFirstSeen();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Center(
        child: new Text('Loading...'),
      ),
    );
  }
}
