class MainUser {
  String uid;
  String name = 'User';
  String email;

  // is the user a student or alumni
  bool isStudent;
  bool isAnon = false;

  //info for student
  int phone;
  int whatsapp;
  int regdNo;
  String branch;

  //links
  String imgurl;
  String github;
  String instagram;
  String facebook;
  String website;

  MainUser({this.uid, this.name, this.email, this.isAnon, this.imgurl});

  void studentDetails(bool isStudent,
      {int regd, int ph, int whatsappPh, String branch}) {
    this.isStudent = isStudent;
    this.regdNo = regd;
    this.phone = ph;
    this.whatsapp = whatsappPh;
    this.branch = branch;
  }

  void setImgUrl(String imgurl) {
    this.imgurl = imgurl;
  }

  void links({String github, String insta, String fb, String website}) {
    this.github = github;
    this.facebook = fb;
    this.instagram = insta;
    this.website = website;
  }
}
