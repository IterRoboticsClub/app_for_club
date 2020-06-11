import  'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class PushNotificationsManager {

  PushNotificationsManager._();

  factory PushNotificationsManager() => _instance;

  static final PushNotificationsManager _instance= PushNotificationsManager._();

  final FirebaseMessaging _firebaseMessaging= FirebaseMessaging();
  bool _initialized= false;

  Future<void> init() async {
    if(!_initialized){
      //For ios request
      _firebaseMessaging.requestNotificationPermissions();
      _firebaseMessaging.configure();

      
      String token= await _firebaseMessaging.getToken();

      print("FirebaseMessaging token: $token");


      _initialized=true;

    }
  }
} 