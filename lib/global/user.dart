class MainUser {
  String uid;
  String name = 'User';
  String email;

  // is the user a student or alumni
  bool isStudent = false;
  bool isAnon = false;

  //info for student
  int phone;
  int whatsapp;
  int regdNo;
  String branch;
  int year;

  int passingYear;
  String imgurl;
  String github;
  String instagram;
  String facebook;
  String linkedin;
  String website;

  MainUser({this.uid, this.name, this.email, this.isAnon, this.imgurl}) {
    isStudent = false;
    isAnon = false;
  }

  void studentDetails(
      {bool isStudent,
      int regd,
      int ph,
      int whatsappPh,
      String branch,
      int year}) {
    if (isStudent != null) this.isStudent = isStudent;
    this.year = year;
    this.regdNo = regd;
    this.phone = ph;
    this.whatsapp = whatsappPh;
    this.branch = branch;
  }

  void setImgUrl(String imgurl) {
    this.imgurl = imgurl;
  }

  void links(
      {String github,
      String insta,
      String fb,
      String website,
      String linkedin}) {
    this.github = github;
    this.linkedin = linkedin;
    this.facebook = fb;
    this.instagram = insta;
    this.website = website;
  }
}
