import 'package:appforclub/MyHomePage.dart';
import 'package:appforclub/widgets/appBar.dart';
import 'package:flutter/material.dart';

class ProfileEdit extends StatefulWidget {
  @override
  _ProfileEditState createState() => _ProfileEditState();
}

class _ProfileEditState extends State<ProfileEdit> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarhead('Edit Profile'),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              CheckboxListTile(
                title: Text('Student'),
                value: mainuser.isStudent,
                onChanged: (value) {
                  setState(() {
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
                                mainuser.regdNo = int.parse(str);
                              });
                            },
                            decoration: InputDecoration(
                                hintText: '1941010000',
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
                                mainuser.phone = int.parse(str);
                              });
                            },
                            decoration: InputDecoration(
                                hintText: 'Enter only 10 digit',
                                contentPadding:
                                    EdgeInsets.symmetric(horizontal: 5)),
                          ),
                        ),
                        ListTile(
                          leading: Text('Whatsapp No.'),
                          trailing: Checkbox(
                            value: mainuser.whatsapp == mainuser.phone &&
                                    mainuser.phone != null
                                ? true
                                : false,
                            onChanged: (value) {
                              setState(() {
                                if (value)
                                  mainuser.whatsapp = mainuser.phone;
                                else
                                  mainuser.whatsapp = null;
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
                              mainuser.phone = int.parse(str);
                            },
                            enabled: mainuser.whatsapp != mainuser.phone
                                ? true
                                : false,
                            decoration: InputDecoration(
                                hintText: mainuser.whatsapp == null
                                    ? 'Enter only 10 digits'
                                    : '${mainuser.whatsapp}',
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
                                mainuser.year = int.parse(str);
                              });
                            },
                            decoration: InputDecoration(
                                hintText: '1, 2, 3, 4',
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
                                mainuser.year = int.parse(str);
                              });
                            },
                            decoration: InputDecoration(
                                hintText: '2018, 2019, etc.',
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
                      mainuser.branch = str;
                    });
                  },
                  decoration: InputDecoration(
                      hintText: 'CSE,CSIT,CE,ME,EE,etc',
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
                      mainuser.github = str;
                    });
                  },
                  decoration: InputDecoration(
                      hintText: 'Paste Url Here',
                      contentPadding: EdgeInsets.symmetric(horizontal: 5)),
                ),
              ),
              ListTile(
                leading: Text('Instagram Link'),
                title: TextFormField(
                  keyboardType: TextInputType.url,
                  onChanged: (String str) {
                    setState(() {
                      mainuser.instagram = str;
                    });
                  },
                  decoration: InputDecoration(
                      hintText: 'Paste Url Here',
                      contentPadding: EdgeInsets.symmetric(horizontal: 5)),
                ),
              ),
              ListTile(
                leading: Text('Facebook Link'),
                title: TextFormField(
                  keyboardType: TextInputType.url,
                  onChanged: (String str) {
                    setState(() {
                      mainuser.facebook = str;
                    });
                  },
                  decoration: InputDecoration(
                      hintText: 'Paste Url Here',
                      contentPadding: EdgeInsets.symmetric(horizontal: 5)),
                ),
              ),
              ListTile(
                leading: Text('LinkedIn Link'),
                title: TextFormField(
                  keyboardType: TextInputType.url,
                  onChanged: (String str) {
                    setState(() {
                      mainuser.linkedin = str;
                    });
                  },
                  decoration: InputDecoration(
                      hintText: 'Paste Url Here',
                      contentPadding: EdgeInsets.symmetric(horizontal: 5)),
                ),
              ),
              ListTile(
                leading: Text('Your Website Link'),
                title: TextFormField(
                  keyboardType: TextInputType.url,
                  onChanged: (String str) {
                    setState(() {
                      mainuser.website = str;
                    });
                  },
                  decoration: InputDecoration(
                      hintText: 'Paste Url Here',
                      contentPadding: EdgeInsets.symmetric(horizontal: 5)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Widget editPlace(
  //   String title,
  //   bool isNumber,
  //   var data,
  // ) {
  //   return Container(
  //     child: Row(
  //       children: <Widget>[
  //         Text(
  //           title,
  //           style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
  //         ),
  //         TextFormField(
  //           keyboardType: isNumber ? TextInputType.number : TextInputType.text,
  //           // textInputAction: TextInputAction.continueAction,
  //           autofocus: false,
  //           initialValue: null,
  //           onChanged: (String str) {
  //             if (isNumber)
  //               data = int.parse(str);
  //             else
  //               data = str;
  //           },
  //           decoration: InputDecoration(
  //               hintText: title,
  //               contentPadding: EdgeInsets.symmetric(horizontal: 5)),
  //         ),
  //       ],
  //     ),
  //   );
  // }
}
