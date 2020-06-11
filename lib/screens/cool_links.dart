import 'package:flutter/material.dart';

import 'package:firebase_database/firebase_database.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';
import 'package:url_launcher/url_launcher.dart';
import './insta_links.dart';
import './twitt_links.dart';
import './yout_links.dart';
import './Posts.dart';

class CoolLinks extends StatefulWidget {
  @override
  _CoolLinksState createState() => _CoolLinksState();
}

class _CoolLinksState extends State<CoolLinks> 
{
  List<Posts> lists = [];

  @override
  void initState()
  {
    DatabaseReference Ref = FirebaseDatabase.instance.reference().child("links");

    Ref.once()
    .then((DataSnapshot snapshot)
    {
      print('+++++++++++++++++++++++++++++++++');
      
      var KEYS = snapshot.value.keys;
      var DATA = snapshot.value;
      print(DATA);
      lists.clear();

      print('The fetched keys are: ${KEYS}');
      print('----------------------------------------------------------------------------');
      print('THE FETCHED DATA IS: ${DATA}');
      for (var individualkey in KEYS)
      {
        Posts post = new Posts
        (
            DATA[individualkey]['image'],
            DATA[individualkey]['description'],
            DATA[individualkey]['link'],
            DATA[individualkey]['date'],
            DATA[individualkey]['type'],
            DATA[individualkey]['title'],
            DATA[individualkey]['author']

            );

        print("Data has  been added for the key : $individualkey");
        print("--------------------------------------------------");
        if(DATA[individualkey]['type']=="websites"||DATA[individualkey]['type']=="Websites"){
        lists.add(post);
        print("Data added to the list");
        }

      }

    

    setState(() {
        print('Length : ${lists.length}');

      });
    
    });
  }

  @override
  Widget build(BuildContext context) 
  {
    return Scaffold(
      appBar: AppBar(
        title: new Text('Cool Links: Website Links'),
        backgroundColor: Colors.black,
      ),
      body: new Container(
        child: lists.length == 0
            ? new Text('No Links Available Right Now')
            : new ListView.builder
            (

                itemCount: lists.length,

                itemBuilder: (context, indexID)
                    {
                  return linkDisplay (
                      lists[indexID].image,
                      lists[indexID].description,
                      lists[indexID].link,
                      lists[indexID].date,
                      lists[indexID].type,
                      lists[indexID].title,
                      lists[indexID].author
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

                icon:  Icon(LineAwesomeIcons.globe, size: 20.0, color: Colors.yellow[700]),
                
                onPressed: () {
                  print('Already On Coollinks page');
                },
              ),
              IconButton(
                icon:  Icon(LineAwesomeIcons.youtube, size: 20.0, color: Colors.yellow[700]),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => YoutLinks()),
                  );
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

  Widget linkDisplay(String image, String description, String link, String date, String type,
      String title, String author) 
    {
    
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
