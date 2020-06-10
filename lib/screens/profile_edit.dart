import 'package:appforclub/MyHomePage.dart';
import 'package:appforclub/screens/profile_view.dart';
import 'package:appforclub/widgets/appBar.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';

class ProfileEdit extends StatefulWidget {
  @override
  _ProfileEditState createState() => _ProfileEditState();
}

class _ProfileEditState extends State<ProfileEdit> {
  int regdNo, phone, whatsapp, year;
  int passingYear;
  String branch, github, facebook, instagram, linkedin, website;
  String imgurl;
  bool isStudent = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarhead('Edit Profile'),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            mainuser.branch = branch;
            mainuser.phone = phone;
            mainuser.regdNo = regdNo;
            mainuser.whatsapp = whatsapp;
            mainuser.year = year;
            mainuser.links(
                fb: facebook,
                github: github,
                insta: instagram,
                website: website,
                linkedin: linkedin);
            mainuser.passingYear = passingYear;
            if (imgurl != null) mainuser.setImgUrl(imgurl);
          });
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => ProfileView()));
        },
        child: Icon(
          LineAwesomeIcons.save,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              ListTile(
                leading: Text('Profile Img URL:'),
                title: TextFormField(
                  keyboardType: TextInputType.url,
                  onChanged: (String str) {
                    setState(() {
                      imgurl = str;
                    });
                  },
                  decoration: InputDecoration(
                      hintText: mainuser.imgurl != null
                          ? mainuser.imgurl
                          : 'Paste Url Here',
                      contentPadding: EdgeInsets.symmetric(horizontal: 5)),
                ),
              ),
              CheckboxListTile(
                title: Text('Student'),
                value: mainuser.isStudent,
                onChanged: (value) {
                  setState(() {
                    // isStudent = value;
                    mainuser.isStudent = value;
                  });
                },
              ),
              mainuser.isStudent
                  ? Column(
                      children: <Widget>[
                        ListTile(
                          leading: Text('Regd No.'),
                          title: TextFormField(
                            keyboardType: TextInputType.number,
                            onChanged: (String str) {
                              setState(() {
                                regdNo = int.parse(str);
                              });
                            },
                            decoration: InputDecoration(
                                hintText: mainuser.regdNo != null
                                    ? mainuser.regdNo.toString()
                                    : '1941010000',
                                contentPadding:
                                    EdgeInsets.symmetric(horizontal: 5)),
                          ),
                        ),
                        ListTile(
                          leading: Text('Phone No.'),
                          title: TextFormField(
                            keyboardType: TextInputType.number,
                            onChanged: (String str) {
                              setState(() {
                                phone = int.parse(str);
                              });
                            },
                            decoration: InputDecoration(
                                hintText: mainuser.phone != null
                                    ? mainuser.phone.toString()
                                    : 'Enter only 10 digit',
                                contentPadding:
                                    EdgeInsets.symmetric(horizontal: 5)),
                          ),
                        ),
                        ListTile(
                          leading: Text('Whatsapp No.'),
                          trailing: Checkbox(
                            value: whatsapp == phone && phone != null
                                ? true
                                : false,
                            onChanged: (value) {
                              setState(() {
                                if (value)
                                  whatsapp = phone;
                                else
                                  whatsapp = null;
                              });
                            },
                          ),
                          subtitle: Text(
                            'Check the box if your phone no. is same as Whatsapp no.',
                            style: TextStyle(fontSize: 10),
                          ),
                          title: TextFormField(
                            keyboardType: TextInputType.number,
                            onChanged: (String str) {
                              phone = int.parse(str);
                            },
                            enabled: whatsapp != phone ? true : false,
                            decoration: InputDecoration(
                                hintText: whatsapp == null
                                    ? 'Enter only 10 digits'
                                    : '$whatsapp',
                                contentPadding:
                                    EdgeInsets.symmetric(horizontal: 5)),
                          ),
                        ),
                        ListTile(
                          leading: Text('Year'),
                          title: TextFormField(
                            keyboardType: TextInputType.number,
                            onChanged: (String str) {
                              setState(() {
                                year = int.parse(str);
                              });
                            },
                            decoration: InputDecoration(
                                hintText: mainuser.year != null
                                    ? mainuser.year.toString()
                                    : '1, 2, 3, 4',
                                contentPadding:
                                    EdgeInsets.symmetric(horizontal: 5)),
                          ),
                        ),
                      ],
                    )
                  : Column(
                      children: <Widget>[
                        ListTile(
                          leading: Text('Passing Year'),
                          title: TextFormField(
                            keyboardType: TextInputType.number,
                            onChanged: (String str) {
                              setState(() {
                                passingYear = int.parse(str);
                              });
                            },
                            decoration: InputDecoration(
                                hintText: mainuser.passingYear != null
                                    ? mainuser.passingYear.toString()
                                    : '2018, 2019, etc.',
                                contentPadding:
                                    EdgeInsets.symmetric(horizontal: 5)),
                          ),
                        ),
                      ],
                    ),
              ListTile(
                leading: Text('Branch'),
                title: TextFormField(
                  keyboardType: TextInputType.text,
                  onChanged: (String str) {
                    setState(() {
                      branch = str;
                    });
                  },
                  decoration: InputDecoration(
                      hintText: mainuser.branch != null
                          ? mainuser.branch
                          : 'CS,CSIT,CE,ME,EE,etc',
                      contentPadding: EdgeInsets.symmetric(horizontal: 5)),
                ),
              ),
//links edit
              ListTile(
                leading: Text('Github Link'),
                title: TextFormField(
                  keyboardType: TextInputType.url,
                  onChanged: (String str) {
                    setState(() {
                      github = str;
                    });
                  },
                  decoration: InputDecoration(
                      hintText: mainuser.github != null
                          ? mainuser.github
                          : 'Paste Url Here',
                      contentPadding: EdgeInsets.symmetric(horizontal: 5)),
                ),
              ),
              ListTile(
                leading: Text('Instagram Link'),
                title: TextFormField(
                  keyboardType: TextInputType.url,
                  onChanged: (String str) {
                    setState(() {
                      instagram = str;
                    });
                  },
                  decoration: InputDecoration(
                      hintText: mainuser.instagram != null
                          ? mainuser.instagram
                          : 'Paste Url Here',
                      contentPadding: EdgeInsets.symmetric(horizontal: 5)),
                ),
              ),
              ListTile(
                leading: Text('Facebook Link'),
                title: TextFormField(
                  keyboardType: TextInputType.url,
                  onChanged: (String str) {
                    setState(() {
                      facebook = str;
                    });
                  },
                  decoration: InputDecoration(
                      hintText: mainuser.facebook != null
                          ? mainuser.facebook
                          : 'Paste Url Here',
                      contentPadding: EdgeInsets.symmetric(horizontal: 5)),
                ),
              ),
              ListTile(
                leading: Text('LinkedIn Link'),
                title: TextFormField(
                  keyboardType: TextInputType.url,
                  onChanged: (String str) {
                    setState(() {
                      linkedin = str;
                    });
                  },
                  decoration: InputDecoration(
                      hintText: mainuser.linkedin != null
                          ? mainuser.linkedin
                          : 'Paste Url Here',
                      contentPadding: EdgeInsets.symmetric(horizontal: 5)),
                ),
              ),
              ListTile(
                leading: Text('Your Website Link'),
                title: TextFormField(
                  keyboardType: TextInputType.url,
                  onChanged: (String str) {
                    setState(() {
                      website = str;
                    });
                  },
                  decoration: InputDecoration(
                      hintText: mainuser.website != null
                          ? mainuser.website
                          : 'Paste Url Here',
                      contentPadding: EdgeInsets.symmetric(horizontal: 5)),
                ),
              ),
              SizedBox(
                height: 100,
              ),
              // RaisedButton(onPressed: () {
              //   branch = null, facebook=null,
              // },)
            ],
          ),
        ),
      ),
    );
  }
}
