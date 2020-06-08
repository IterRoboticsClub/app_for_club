import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget appBarhead(String title) {
  return AppBar(
    backgroundColor: Colors.black,
    title: Text(
      title,
      style: GoogleFonts.aBeeZee(fontWeight: FontWeight.bold),
    ),
    centerTitle: true,
    elevation: 15,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(25), bottomRight: Radius.circular(25))),
  );
}
