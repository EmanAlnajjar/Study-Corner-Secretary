import 'package:get/get.dart';

class UserInCourse {
  int id;
  var f_name;
  var l_name;
  var email;
  var education;
  var phone ;
  var birthdate ;



  UserInCourse({
  required this.id,
    this.f_name,
    this.l_name,
    this.email,
    this.phone,
    this.education,
    this.birthdate,

  });

  factory UserInCourse.fromJson(Map<String, dynamic> json) {
    return UserInCourse(
      f_name: json['f_name'] ?? '',
      l_name: json['l_name'] ?? '',
      id: json['id'] ?? '',
      phone: json['phone'] ?? '',
      email: json['email'] ?? '',
      education: json['education'] ?? '',
      birthdate: json['birthdate'] ?? '',

    );
  }
}