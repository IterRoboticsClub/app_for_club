import 'dart:async';

import 'package:appforclub/MyHomePage.dart';
import 'package:flutter/material.dart';
// import 'package:appforclub/screens/about_us.dart';
// import 'package:appforclub/screens/intro.dart';
// import 'package:shared_preferences/shared_preferences.dart';
import 'package:splashscreen/splashscreen.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'IRC',
      debugShowCheckedModeBanner: false,
      home: SplashScreen(
        seconds: 5,
        navigateAfterSeconds: new MyHomePage(),
        title: new Text(
          'IRC\nITER Robotics Club',
          textAlign: TextAlign.center,
          style: new TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25.0,
            color: Colors.white70,
          ),
        ),
        image: Image.asset('images/irc_logo.png'),
        photoSize: 100,
        backgroundColor: Colors.black,
        styleTextUnderTheLoader: new TextStyle(),
        loaderColor: Colors.white,
        loadingText: Text(
          'LOADING...',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 16, color: Colors.white60),
        ),
      ),
      theme: ThemeData(
        accentColor: Colors.blueGrey,
        backgroundColor: Colors.blueGrey,
        textTheme: Theme.of(context).textTheme.apply(
              fontFamily: 'BreeSerif',
              // bodyColor: Colors.white,
              // displayColor: Colors.white
            ),
      ),
    );
  }
}

// class Launch extends StatefulWidget {
//   @override
//   LaunchState createState() => new LaunchState();
// }

// class LaunchState extends State<Launch> {
//   Future checkFirstSeen() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     bool _seen = (prefs.getBool('seen') ?? false);

//     if (_seen) {
//       //Check if logged in , if not go to login.dart
//       //otherwise
//       Navigator.of(context).pushReplacement(
//           new MaterialPageRoute(builder: (context) => new AboutUs()));
//     } else {
//       await prefs.setBool('seen', true);
//       Navigator.of(context).pushReplacement(
//           new MaterialPageRoute(builder: (context) => new IntroScreen()));
//     }
//   }

//   @override
//   void initState() {
//     super.initState();
//     checkFirstSeen();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return new Scaffold(
//       body: new Center(
//         child: new Text('Loading...'),
//       ),
//     );
//   }
// }
