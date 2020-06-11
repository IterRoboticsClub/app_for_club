// import 'dart:html';

import 'package:appforclub/MyHomePage.dart';
import 'package:appforclub/screens/profile_edit.dart';
import 'package:appforclub/widgets/appBar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfileView extends StatefulWidget {
  @override
  _ProfileViewState createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: appBarhead('Profile'),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
            context, MaterialPageRoute(builder: (context) => ProfileEdit())),
        child: Icon(Icons.edit),
        mini: true,
      ),
      body: new Center(
        child: SingleChildScrollView(
            child: new Column(
          children: <Widget>[
            Center(
              child: mainuser.imgurl == null //&& imgpath == null
                  ? Icon(
                      Icons.account_circle,
                      size: 70,
                    )
                  : Image.network(
                      mainuser.imgurl,
                      fit: BoxFit.fill,
                    ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              mainuser.name,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              mainuser.email,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 15,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                if (mainuser.github != null)
                  IconButton(
                      tooltip: 'Github',
                      icon: Icon(
                        LineAwesomeIcons.github,
                        size: 40,
                      ),
                      onPressed: () => launchURL(mainuser.github)),
                if (mainuser.facebook != null)
                  IconButton(
                      tooltip: 'Facebook',
                      icon: Icon(
                        LineAwesomeIcons.facebook,
                        size: 40,
                      ),
                      onPressed: () => launchURL(mainuser.facebook)),
                if (mainuser.instagram != null)
                  IconButton(
                      tooltip: 'Instagram',
                      icon: Icon(
                        LineAwesomeIcons.instagram,
                        size: 40,
                      ),
                      onPressed: () => launchURL(mainuser.instagram)),
                if (mainuser.linkedin != null)
                  IconButton(
                      tooltip: 'LinkedIn',
                      icon: Icon(
                        LineAwesomeIcons.linkedin,
                        size: 40,
                      ),
                      onPressed: () => launchURL(mainuser.linkedin)),
                if (mainuser.website != null)
                  IconButton(
                      tooltip: 'Website',
                      icon: Icon(
                        LineAwesomeIcons.wordpress,
                        size: 40,
                      ),
                      onPressed: () => launchURL(mainuser.website)),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            mainuser.isStudent
                ? Column(
                    children: <Widget>[
                      if (mainuser.regdNo != null)
                        ListTile(
                          leading: Text('Regd No.:'),
                          trailing: Text('${mainuser.regdNo}'),
                        ),
                      if (mainuser.phone != null)
                        ListTile(
                          leading: Text('Phone No.:'),
                          trailing: Text('${mainuser.phone}'),
                        ),
                      if (mainuser.whatsapp != null)
                        ListTile(
                          leading: Text('Whatsapp No.:'),
                          trailing: Text('${mainuser.whatsapp}'),
                        ),
                      if (mainuser.year != null)
                        ListTile(
                          leading: Text('Year:'),
                          trailing: Text('${mainuser.year}'),
                        ),
                      if (mainuser.branch != null)
                        ListTile(
                          leading: Text('Branch:'),
                          trailing: Text('${mainuser.branch.toUpperCase()}'),
                        ),
                    ],
                  )
                : Column(
                    children: <Widget>[
                      if (mainuser.passingYear != null)
                        ListTile(
                          leading: Text('Passing Year:'),
                          trailing: Text('${mainuser.passingYear}'),
                        ),
                      if (mainuser.branch != null)
                        ListTile(
                          leading: Text('Branch:'),
                          trailing: Text('${mainuser.branch.toUpperCase()}'),
                        ),
                    ],
                  ),
            SizedBox(
              height: 50,
            ),
          ],
        )),
      ),
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
