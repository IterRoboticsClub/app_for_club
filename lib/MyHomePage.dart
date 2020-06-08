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
                  'Welocme to ITER Robotics Club',
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
              leading: Icon(Icons.assignment_ind),
              title: Text('Profile'),
              onTap: null,
              //  () => Navigator.push(context,
              //     MaterialPageRoute(builder: (context) => Page_Name())),
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.settings_power),
              title: Text('LogOut/LogIn'),
              onTap: null,
              //  () => Navigator.push(context,
              //     MaterialPageRoute(builder: (context) => Page_Name())),
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.verified_user),
              title: Text('Contibutors'),
              onTap: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Contributors())),
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.contacts),
              title: Text('Contact Us'),
              onTap: null,
              //  () => Navigator.push(context,
              //     MaterialPageRoute(builder: (context) => Page_Name())),
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.settings_input_component),
              title: Text('Settings'),
              onTap: null,
              //  () => Navigator.push(context,
              //     MaterialPageRoute(builder: (context) => Page_Name())),
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
              leading: Icon(Icons.info_outline),
              title: Text('About IRC'),
              onTap: () => Navigator.push(
                  context, MaterialPageRoute(builder: (context) => AboutIrc())),
            ),
          ],
        ),
      ),
    );
  }
}
