

class AllUser {
  var id;
  var f_name;
  var l_name;
  var education;
  var birthdate;
  var phone;
  var email;


  AllUser({
    this.f_name,
    this.l_name,
    this.id,
    this.phone,
    this.email,
    this.education,
    this.birthdate,

  });
  factory AllUser.fromJson(Map<String, dynamic> json) {
    return AllUser(
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