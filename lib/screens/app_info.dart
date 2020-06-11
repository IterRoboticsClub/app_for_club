import 'package:appforclub/widgets/appBar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:package_info/package_info.dart';

class AppInfo extends StatefulWidget {
  @override
  _AppInfoState createState() => _AppInfoState();
}

class _AppInfoState extends State<AppInfo> {
  Future<void> _initPackageInfo() async {
    final PackageInfo info = await PackageInfo.fromPlatform();
    setState(() {
      _packageInfo = info;
    });
  }

  PackageInfo _packageInfo = PackageInfo(
    appName: 'Unknown',
    packageName: 'Unknown',
    version: 'Unknown',
    buildNumber: 'Unknown',
  );

  @override
  void initState() {
    super.initState();
    _initPackageInfo();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: appBarhead('App Info'),
      body: Column(
        children: <Widget>[
          Spacer(),
          Image.asset(
            'images/irc_logo.png',
            height: 200,
            width: 200,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 16.0, 0.0, 16.0),
            child: Center(
              child: new Text(
                _packageInfo.appName,
                style: TextStyle(
                    fontSize: 24,
                    fontFamily: "BreeSerif-Regular",
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: new Text('Version ' + _packageInfo.version),
            ),
          ),
          Spacer(),
        ],
      ),
    );
  }
}
