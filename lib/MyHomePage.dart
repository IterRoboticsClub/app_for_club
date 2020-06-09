import 'package:appforclub/screens/app_info.dart';
import 'package:appforclub/screens/contact_us.dart';
import 'package:appforclub/screens/cool_links.dart';
import 'package:appforclub/screens/home.dart';
import 'package:appforclub/screens/irc_tree.dart';
import 'package:appforclub/screens/profile_view.dart';
import 'package:appforclub/screens/settings.dart';
import 'package:appforclub/widgets/appBar.dart';
import 'package:flutter/material.dart';

import 'screens/about_irc.dart';
import 'screens/about_us.dart';
import 'screens/contributors.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarhead('IRC'),
      drawer: widgetDrawer(context),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Center(
                child: Text(
                  'WELCOME TO ITER ROBOTICS CLUB',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget widgetDrawer(context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            AppBar(
              backgroundColor: Colors.black,
              title: Text(
                'IRC',
                softWrap: true,
              ),
              elevation: 15,
              centerTitle: true,
              automaticallyImplyLeading: true,
              leading: IconButton(
                  icon: Icon(Icons.arrow_back_ios),
                  onPressed: () => Navigator.pop(context, false)),
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () => Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Home())),
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.assignment_ind),
              title: Text('Profile'),
              onTap: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ProfileView())),
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.web),
              title: Text('Cool Links'),
              onTap: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => CoolLinks())),
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.verified_user),
              title: Text('Contributors'),
              onTap: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Contributors())),
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.contacts),
              title: Text('Contact Us'),
              onTap: () =>
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ContactUs())),
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: () =>
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Settings())),
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.info),
              title: Text('About Us'),
              onTap: () => Navigator.push(
                  context, MaterialPageRoute(builder: (context) => AboutUs())),
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.people),
              title: Text('Our Alumni'),
              onTap: null,
              //  () => Navigator.push(context,
              //     MaterialPageRoute(builder: (context) => Page_Name())),
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.nature),
              title: Text('IRC TREE'),
              onTap: () =>
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => IrcTree())),
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.info_outline),
              title: Text('ABOUT IRC'),
              onTap: () => Navigator.push(
                  context, MaterialPageRoute(builder: (context) => AboutIrc())),
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.apps),
              title: Text('App Info'),
              onTap: () =>
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AppInfo())),
            ),
          ],
        ),
      ),
    );
  }
}
