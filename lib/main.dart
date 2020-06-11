import 'package:appforclub/MyHomePage.dart';
import 'package:appforclub/screens/intro.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import  'package:firebase_messaging/firebase_messaging.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';
import 'dart:io';

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
      body: MessageHandler(),
      // new Center(
      //   child: new Text('Loading...'),
      
    );
  }
}

class MessageHandler extends StatefulWidget {
  @override
  _MessageHandlerState createState() => _MessageHandlerState();
}

class _MessageHandlerState extends State<MessageHandler> {

final Firestore _db= Firestore.instance;
final FirebaseMessaging _fcm= FirebaseMessaging();

StreamSubscription iosSubscription;
  @override
  void initState(){
    super.initState();

    if(Platform.isIOS){
      iosSubscription = _fcm.onIosSettingsRegistered.listen((data){
        _saveDeviceToken();
      });

      _fcm.requestNotificationPermissions(IosNotificationSettings(
        sound: true,
      badge: true,
      alert: true
      ));
    } else {
      _saveDeviceToken();
    }

    
    
    _fcm.configure(
      onMessage:(Map<String, dynamic> message) async{
        print("onMessage: $message");

        // final snackbar= SnackBar(content: Text(message['notification']['title']),
        // action: SnackBarAction(
        //   label: 'Go', 
        //   onPressed: () => null,
        //   ),
        // );
        // print('showing Snackbar');
        // Scaffold.of(context).showSnackBar(snackbar);

        showDialog(
          context: context,
          builder: (BuildContext context){
            return AlertDialog(
              title: Text("message['notification']['title']"),
              content: Text("message['notification']['body']"),
              actions: <Widget>[
                FlatButton(child: Text("Close"),
                onPressed: (){
                  Navigator.of(context).pop();
                },
                ),
              ],
            );
          },
        );
      },
      onResume: (Map<String, dynamic> message) async {
        print("onLaunch: $message");

      },
      onLaunch: (Map<String, dynamic> message) async {
        print("onLaunch: $message");
      }
    );

  }
  @override
  Widget build(BuildContext context) {
    return null;
  }

  _saveDeviceToken() async {
    
    String uid='jeddf23';

    String fcmToken= await _fcm.getToken();

    print('The Token is: $fcmToken');

    if(fcmToken != null)
    {
      var tokenRef= _db
      .collection('users')
      .document(uid)
      .collection('tokens')
      .document(fcmToken);

     await tokenRef.setData({
       'token': fcmToken,
       'createdAt': FieldValue.serverTimestamp(),
        'platform': Platform.operatingSystem
     });
    }
  }

  
}

// onMessage
// onResume
// onLaunch

