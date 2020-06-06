import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutUs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueGrey,
          title: Text(
            'ABOUT US',
            style: GoogleFonts.aBeeZee(fontWeight: FontWeight.bold),
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(4.0, 8.0, 0.0, 0.0),
                  child: Text(
                    'Who are we ?',
                    style: GoogleFonts.breeSerif(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                        wordSpacing: 4),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Just a bunch of jobless people "
                    "with nothing to do in real life "
                    "so we make robots,learn to code,"
                    "make apps for robots,maintain our website "
                    "and above all chill😎.              "
                    "                                    "
                    "PS:- Ability to chill in the "
                    "harshest situation is necessary "
                    "to join the club",
                    style: GoogleFonts.quicksand(
                        color: Colors.grey,
                        fontSize: 20,
                        fontWeight: FontWeight.w900),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(4.0, 8.0, 0.0, 0.0),
                  child: Text(
                    'What do we do ?',
                    style: GoogleFonts.breeSerif(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                        wordSpacing: 4),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "We eat,make robots,sleep",
                    style: GoogleFonts.quicksand(
                        color: Colors.grey,
                        fontSize: 20,
                        fontWeight: FontWeight.w900),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(4.0, 8.0, 0.0, 0.0),
                  child: Text(
                    'Why join us ?',
                    style: GoogleFonts.breeSerif(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                        wordSpacing: 4),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "",
                    style: GoogleFonts.quicksand(
                        color: Colors.grey,
                        fontSize: 20,
                        fontWeight: FontWeight.w900),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(4.0, 8.0, 0.0, 0.0),
                  child: Text(
                    'Is robotics fun ?',
                    style: GoogleFonts.breeSerif(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                        wordSpacing: 4),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Only if you are funny.",
                    style: GoogleFonts.quicksand(
                        color: Colors.grey,
                        fontSize: 20,
                        fontWeight: FontWeight.w900),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(4.0, 8.0, 0.0, 0.0),
                  child: Text(
                    'Why stay with us ?',
                    style: GoogleFonts.breeSerif(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                        wordSpacing: 4),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "",
                    style: GoogleFonts.quicksand(
                        color: Colors.grey,
                        fontSize: 20,
                        fontWeight: FontWeight.w900),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(4.0, 8.0, 0.0, 0.0),
                  child: Text(
                    'Placement milega?',
                    style: GoogleFonts.breeSerif(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                        wordSpacing: 4),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Hmlog ko toh mil gaya. "
                    "Tera tm dekh lo",
                    style: GoogleFonts.quicksand(
                        color: Colors.grey,
                        fontSize: 20,
                        fontWeight: FontWeight.w900),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(4.0, 8.0, 0.0, 0.0),
                  child: Text(
                    'I look good should I join ?',
                    style: GoogleFonts.breeSerif(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                        wordSpacing: 4),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Hell No!!! Uninstall the app right Now.",
                    style: GoogleFonts.quicksand(
                        color: Colors.grey,
                        fontSize: 20,
                        fontWeight: FontWeight.w900),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
