import 'package:flutter/material.dart';
import './Posts.dart';
import 'package:firebase_database/firebase_database.dart';
import './cool_links.dart';
import './twitt_links.dart';
import './yout_links.dart';

class InstaLinks extends StatefulWidget {
  @override
  _InstaLinksState createState() => _InstaLinksState();
}

class _InstaLinksState extends State<InstaLinks> {
  List<Posts> Weblinks = [];

  @override
  void initState() {
    DatabaseReference ref = FirebaseDatabase.instance.reference();
    ref.child('webpage').once().then((DataSnapshot snap) {
      var keys = snap.value.keys;
      var data = snap.value;
       //data in JSON
      Weblinks.clear();
      for (var key in keys) {
        Posts p = new Posts(
            data[key]['image'],
            data[key]['description'],
            data[key]['title'],
            data[key]['date'],
            data[key]['link'],
            data[key]['author']);
        Weblinks.add(p);
      }

      setState(() {
        print('Length : ${Weblinks.length}');
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text('Firebase Data'),
      ),
      body: new Container(
        child: Weblinks.length == 0
            ? new Text('No Links Available Right Now')
            : new ListView.builder(
                itemCount: Weblinks.length,
                itemBuilder: (_, index) //Taking Particular index Values
                    {
                  return PostsUI(
                      Weblinks[index].image,
                      Weblinks[index].description,
                      Weblinks[index].link,
                      Weblinks[index].date,
                      Weblinks[index].title,
                      Weblinks[index].author);
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
                icon: new Icon(Icons.web),
                iconSize: 25,
                color: Colors.white,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CoolLinks()),
                  );
                },
              ),
              IconButton(
                icon: new Icon(Icons.web),
                iconSize: 25,
                color: Colors.white,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => YoutLinks()),
                  );
                },
              ),
              IconButton(
                icon: new Icon(Icons.web),
                iconSize: 25,
                color: Colors.white,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TwittLinks()),
                  );
                },
              ),
              IconButton(
                icon: new Icon(Icons.web),
                iconSize: 25,
                color: Colors.white,
                onPressed: () {
                  print('Already On Coollinks page');
                  
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget PostsUI(String image, String description, String link, String date,
      String title, String author) {
    return new Card(
      elevation: 10.0,
      margin: EdgeInsets.all(15.0),
      child: new Container(
        padding: new EdgeInsets.all(14.0),
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Image.network(image, fit: BoxFit.cover),
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
    );
  }
}
