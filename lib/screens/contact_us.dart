import 'package:appforclub/widgets/appBar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactUs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: appBarhead('Contact Us'),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'FACULTY IN-CHARGE',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),
            ),
            CircleAvatar(
              backgroundImage: AssetImage('images/shaktijeet_sir.png'),
              radius: 60,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Shaktijeet Mahapatra',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                IconButton(
                  icon: Icon(Icons.phone),
                  onPressed: () => _makePhoneCall('tel:9937190396'),
                ),
              ],
            ),
            Text(
              'Associate Professor\n'
              'Room No.221,E-block\n'
              'Department of ECE,ITER\n'
              'Bhubaneswar,Odisha-751030',
              textAlign: TextAlign.center,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'OVERALL CO-ORDINATORS',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
            CircleAvatar(
              backgroundImage: AssetImage('images/khitish.png'),
              radius: 60,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('Khitish Kumar Rout\n'
                    'Mech.  4th Year'),
                IconButton(
                  icon: Icon(Icons.phone),
                  onPressed: () => _makePhoneCall('tel:9777619991'),
                ),
              ],
            ),
            CircleAvatar(
              backgroundImage: AssetImage('images/ankit.png'),
              radius: 60,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('Ankit Pattanayak\n'
                    'EE  4th Year'),
                IconButton(
                  icon: Icon(Icons.phone),
                  onPressed: () => _makePhoneCall('tel:7008942992'),
                ),
              ],
            ),
            CircleAvatar(
              backgroundImage: AssetImage('images/binny.png'),
              radius: 60,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('Binny Kumari\n'
                    'ECE 4th Year'),
                IconButton(
                  icon: Icon(Icons.phone),
                  onPressed: () => _makePhoneCall('tel:8093396217'),
                ),
              ],
            ),
            CircleAvatar(
              backgroundImage: AssetImage('images/tashmin.png'),
              radius: 60,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('Tashmin Mishra\n'
                    'ECE  4th Year'),
                IconButton(
                  icon: Icon(Icons.phone),
                  onPressed: () => _makePhoneCall('tel:9668829114'),
                ),
              ],
            ),
            CircleAvatar(
              backgroundImage: AssetImage('images/mukund.png'),
              radius: 60,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('Mukund Mourya\n'
                    'ECE 4th Year'),
                IconButton(
                  icon: Icon(Icons.phone),
                  onPressed: () => _makePhoneCall('tel:7008197552'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _makePhoneCall(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
