

class Hall {
 late int id;
  var f_name;
  var l_name;
  var date;
  var start_hour;
  var end_hour;


  Hall({

    this.f_name,
    this.l_name,
    this.date,
    this.end_hour,
    this.start_hour,
   required this.id,
  });
  factory Hall.fromJson(Map<String, dynamic> json) {
    return Hall(
      f_name: json['f_name'] ?? '',
      l_name: json['l_name'] ?? '',
      date: json['date'] ?? '',
      start_hour: json['start_hour'] ?? '',
      end_hour: json['end_hour'] ?? '',
      id:json['id'] ?? '',
    );
  }





}