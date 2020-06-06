import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutIrc extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('ABOUT IRC'),
          backgroundColor: Colors.black,
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Text(
              "THE NEED FOR A TECHNICAL CLUB WHICH WOULD"
              " INCORPORATE THE PRINCIPLES OF ALL ENGINEERING"
              " BRANCHES ONTO A COMMON PLATFORM WAS FELT BY "
              "THE DYNAMIC STUDENTS OF THE COLLEGE, AS A RESULT"
              " OF WHICH THE ITER ROBOTICS CLUB WAS INITIATED IN"
              " THE YEAR 2007.IT IS AN OPEN CLUB, CO-ORDINATED BY"
              " THE STUDENTS, FUNCTIONING IN THE INTEREST OF STUDENTS"
              " OF THE INSTITUTION WISHING TO HAVE A PRACTICAL APPLICATION"
              " OF THEIR KNOWLEDGE BASE, GAINED FROM THE CLASSROOMS.WE AT"
              " ITER ROBOTICS CLUB CONSTANTLY HAVE BEEN WORKING FOR THE"
              "SPREADING OF TECHNICAL AWARENESS IN THE FIELD OF ROBOTICS."
              "WE BELIEVE IN CREATING LOCAL HOTSPOTS OF TECHNICAL KNOWLEDGE"
              "FOR THE PROPER ACCESS TO TECHNOLOGY TO THE ENGINEERING "
              "FRATERNITY. WE BELIEVE IN PUTTING THEORIES INTO PRACTICE"
              "IN DAY TO DAY LIFE MAKING PROCESS EASIER FOR HUMANS"
              "THE WORLDWIDE DEVELOPMENTS IN THE FIELD OF ROBOTICS"
              "TODAY HAS OBVIOUSLY ENCOURAGED WHOOPING NUMBER OF "
              "STUDENTS TAKING ‘ROBOTICS’ INTO SOMETHING MORE THAN JUST A HOBBY.",
              style: GoogleFonts.quicksand(
                  color: Colors.grey,
                  fontSize: 20,
                  fontWeight: FontWeight.w900),
            ),
          ),
        ),
      ),
    );
  }
}
