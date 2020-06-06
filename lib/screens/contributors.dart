import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

List<User> parseUser(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<User>((json) => User.fromJson(json)).toList();
}

Future<List<User>> fetchData() async {
  final response = await http.get(
      'https://api.github.com/repos/IterRoboticsClub/app_for_club/contributors');

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return compute(parseUser, response.body);
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load data');
  }
}

class User {
  final String userId;
  final String profileAvatar;
  final String gitUrl;
  final int contributions;

  User({this.contributions, this.gitUrl, this.profileAvatar, this.userId});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      userId: json['login'] as String,
      profileAvatar: json['avatar_url'] as String,
      gitUrl: json['html_url'] as String,
      contributions: json['contributions'] as int,
    );
  }
}

class Contributors extends StatefulWidget {
  Contributors({Key key}) : super(key: key);

  @override
  _ContributorsState createState() => _ContributorsState();
}

class _ContributorsState extends State<Contributors> {
  Future<User> futureData;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'CONTRIBUTORS',
            style: GoogleFonts.metalMania(),
          ),
          backgroundColor: Colors.black,
        ),
        backgroundColor: Colors.white24,
        body: FutureBuilder<List<User>>(
          future: fetchData(),
          builder: (context, snapshot) {
            if (snapshot.hasError) print(snapshot.error);

            return snapshot.hasData
                ? UserList(users: snapshot.data)
                : Center(
                    child: CircularProgressIndicator(),
                  );
          },
        ),
      ),
    );
  }
}

class UserList extends StatelessWidget {
  final List<User> users;

  UserList({this.users});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemCount: users.length,
      itemBuilder: (context, index) {
        return Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: CircleAvatar(
                backgroundImage: NetworkImage(users[index].profileAvatar),
                minRadius: 60,
                maxRadius: 60,
              ),
            ),
            FlatButton(
              child: Text(
                users[index].userId,
                style: GoogleFonts.breeSerif(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onPressed: () => launchURL(users[index].gitUrl),
            ),
          ],
        );
      },
    );
  }

  launchURL(String gitUrl) async {
    if (await canLaunch(gitUrl)) {
      await launch(gitUrl);
    } else {
      throw "Could not launch $gitUrl";
    }
  }
}
