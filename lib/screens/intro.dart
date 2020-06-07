import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:appforclub/screens/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:appforclub/screens/login.dart';

class IntroScreen extends StatefulWidget {
  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen>
    with TickerProviderStateMixin {
  AnimationController _controller;

  final Tween<double> turnsTween = Tween<double>(
    begin: 1,
    end: 2,
  );

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10),
    );
    _controller.addListener(() {
      setState(() {});
    });
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Navigator.of(context).pushReplacement(
            new MaterialPageRoute(builder: (context) => new LoginPage()));
      }
    });
    _controller.forward().orCancel;
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Spacer(
              flex: 2,
            ),
            Center(
              child: Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  RotationTransition(
                    turns: turnsTween.animate(_controller),
                    child: Image.asset(
                      'images/irc_logo_gear.png',
                      width: 190,
                      height: 190,
                    ),
                  ),
                  Image.asset(
                    'images/irc_logo_foreground.png',
                    width: 146,
                    height: 146,
                  ),
                ],
              ),
            ),
            Spacer(
              flex: 2,
            ),
            TypewriterAnimatedTextKit(
              text: ["We Learn,We Build,We Share"],
              textStyle: TextStyle(
                  fontFamily: "BreeSerif",
                  fontSize: 24.0,
                  color: CupertinoColors.systemGrey),
              textAlign: TextAlign.start,
              alignment: AlignmentDirectional.topStart,
              isRepeatingAnimation: false,
              speed: Duration(milliseconds: 300),
            ),
            Spacer(
              flex: 1,
            )
          ],
        ),
      ),
    );
  }
}
