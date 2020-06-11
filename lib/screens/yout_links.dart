import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';
import 'package:url_launcher/url_launcher.dart';
import './Posts.dart';
import './insta_links.dart';
import './twitt_links.dart';
import './cool_links.dart';

class YoutLinks extends StatefulWidget {
  @override
  _YoutLinksState createState() => _YoutLinksState();
}

class _YoutLinksState extends State<YoutLinks> {
  List<Posts> lists = [];

  @override
  void initState() {
    DatabaseReference Ref = FirebaseDatabase.instance.reference().child("links");
    Ref.once().then((DataSnapshot snap) {

      var KEYS = snap.value.keys;
      var DATA = snap.value;
       //data in JSON
      lists.clear();
      for (var individualkey in KEYS) {
        Posts post = new Posts(
            DATA[individualkey]['image'],
            DATA[individualkey]['description'],
            DATA[individualkey]['link'],
            DATA[individualkey]['date'],
            DATA[individualkey]['type'],
            DATA[individualkey]['title'],
            DATA[individualkey]['author']);
        
        if(DATA[individualkey]['type']=="youtube"||DATA[individualkey]['type']=="youtube"){
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
        title: new Text('Cool Links: You-Tube Links'),
        backgroundColor: Colors.black,
      ),
      body: new Container(
        child: lists.length == 0
            ? new Text('No Links Available Right Now')
            : new ListView.builder(
                itemCount: lists.length,
                itemBuilder: (context, index) //Taking Particular index Values
                    {
                  return PostsUI(
                      lists[index].image,
                      lists[index].description,
                      lists[index].link,
                      lists[index].date,
                      lists[index].type,
                     lists[index].title,
                      lists[index].author);
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

                icon:  Icon(LineAwesomeIcons.globe, size: 20.0, color: Colors.yellow[700]),

                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CoolLinks()),
                  );
                },
              ),
              IconButton(
                icon:  Icon(LineAwesomeIcons.youtube, size: 20.0, color: Colors.yellow[700]),
                onPressed: () {
                  print('Already on You-tube links page');
                  
                },
              ),
              IconButton(
                icon:  Icon(LineAwesomeIcons.twitter, size: 20.0, color: Colors.yellow[700]),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TwittLinks()),
                  );
                },
              ),
              IconButton(
                icon:  Icon(LineAwesomeIcons.instagram, size: 20.0, color: Colors.yellow[700]),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => InstaLinks()),
                  );
                  
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget PostsUI(String image, String description, String link, String date,String type,
      String title, String author) {
    return new GestureDetector(
      onTap : () => _urlLauncher(link),
      child: new Card(
      elevation: 10.0,
      margin: EdgeInsets.all(15.0),
      child: new Container(
        padding: new EdgeInsets.all(14.0),
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>
          [
            
            Image.network(image, height:150,fit:BoxFit.fill),
            SizedBox(
              height: 10.0,
            ),
            Text(
              title,
              style: Theme.of(context).textTheme.title,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10.0),
            Text(
              description,
              style: Theme.of(context).textTheme.subtitle1,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10.0),
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  date,
                  style: Theme.of(context).textTheme.subtitle2,
                  textAlign: TextAlign.center,
                ),
                Text(
                  author,
                  style: Theme.of(context).textTheme.subtitle2,
                  textAlign: TextAlign.center,
                ),
              ],
            )
          ],
        ),
      ),
    ),
    );
  }

  _urlLauncher(String link) async 
  {
    if (await canLaunch(link)) 
    {
      await launch(link);
    
    }
    else
    {
      throw 'Could\'nt  launch  $link';
    }


  }
}
