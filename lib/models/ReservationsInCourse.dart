import 'package:get/get.dart';

class ReservationInCourse {
  int id;
  var f_name;
  var l_name;
  var email;
  var education;
  var phone ;
  var birthdate ;



  ReservationInCourse({
    required this.id,
    this.f_name,
    this.l_name,
    this.email,
    this.phone,
    this.education,
    this.birthdate,

  });

  factory ReservationInCourse.fromJson(Map<String, dynamic> json) {
    return ReservationInCourse(
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