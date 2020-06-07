import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IntroScreen extends StatefulWidget {
  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
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
              child: Container(
                width: 200,
                height: 200,
                child: FlareActor(
                  "assets/rotating_gear_irc.flr",
                  alignment: Alignment.center,
                  fit: BoxFit.fill,
                  animation: "rotate_gear",
                ),
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
