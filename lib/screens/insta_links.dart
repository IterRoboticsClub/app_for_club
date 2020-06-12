import 'package:flutter/material.dart';

import 'package:firebase_database/firebase_database.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/src/rendering/sliver_multi_box_adaptor.dart';
import './Posts.dart';
import './cool_links.dart';
import './twitt_links.dart';
import './yout_links.dart';

class InstaLinks extends StatefulWidget {
  @override
  _InstaLinksState createState() => _InstaLinksState();
}

class _InstaLinksState extends State<InstaLinks> {
  List<Posts> lists = [];

  @override
  void initState() {
    DatabaseReference Ref =
        FirebaseDatabase.instance.reference().child("links");
    Ref.once().then((DataSnapshot snap) {
      var KEYS = snap.value.keys;
      var DATA = snap.value;
      //data in JSON
      lists.clear();
      for (var individualkey in KEYS) {
        Posts post = new Posts(
          DATA[individualkey]['link'],
          DATA[individualkey]['type'],
          DATA[individualkey]['title'],
        );

        if (DATA[individualkey]['type'] == "instagram" ||
            DATA[individualkey]['type'] == "Instagram") {
          lists.add(post);
        }
      }

      setState(() {
        print('Length : ${lists.length}');
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text('Cool Links:Instagram Links'),
        backgroundColor: Colors.black,
      ),
      body: new Container(
        child: lists.length == 0
            ? new Text('No Links Available Right Now')
            : new ListView.builder(
                itemCount: lists.length,
                itemBuilder: (context, index) //Taking Particular index Values
                    {
                  return linkDisplay(
                    lists[index].link,
                    lists[index].type,
                    lists[index].title,
                  );
                },
              ),
      ),
      bottomNavigationBar: new BottomAppBar(
        color: Colors.black,
        child: new Container(
          margin: const EdgeInsets.only(left: 70.0, right: 70.0),
          child: new Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              IconButton(
                icon: Icon(LineAwesomeIcons.globe,
                    size: 20.0, color: Colors.yellow[700]),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CoolLinks()),
                  );
                },
              ),
              IconButton(
                icon: Icon(LineAwesomeIcons.youtube,
                    size: 20.0, color: Colors.yellow[700]),
                onPressed: () {
                  onPressed:
                  () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => YoutLinks()),
                    );
                  };
                },
              ),
              IconButton(
                icon: Icon(LineAwesomeIcons.twitter,
                    size: 20.0, color: Colors.yellow[700]),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TwittLinks()),
                  );
                },
              ),
              IconButton(
                icon: Icon(LineAwesomeIcons.instagram,
                    size: 20.0, color: Colors.yellow[700]),
                onPressed: () {
                  print("You are already on instagram links page");
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget linkDisplay(String link, String type, String title) {
     return new GestureDetector(
      onTap : () => _urlLauncher(link),
      child: new Card(
      elevation: 7.0,
      margin: EdgeInsets.all(15.0),
      child: new Container(
        padding: new EdgeInsets.all(14.0),
        child: new Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>
          [
            
             Icon(LineAwesomeIcons.instagram,
                    size: 50.0, color: Colors.pink[300]),
            SizedBox(
              width: 20.0,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:<Widget>[
            Text(
              title,
              overflow: TextOverflow.ellipsis,
    maxLines: 2,
              style: TextStyle(fontSize: 18.0,
              ),
            ),
            
            Text(
              link,
              overflow: TextOverflow.ellipsis,
    maxLines: 3,
              style: TextStyle(color:Colors.blue[900],
              fontSize: 13.0,)
            ),
            
              ],
            ),
          ],
        )
        
      ),
    ),
    );
  }

  _urlLauncher(String link) async {
    if (await canLaunch(link)) {
      await launch(link);
    } else {
      throw 'Could\'nt  launch  $link';
    }
  }
}
