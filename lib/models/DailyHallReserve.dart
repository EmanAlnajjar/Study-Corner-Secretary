import 'package:get/get.dart';


class DailyHallReserve{
  var id;
  var user_id;
  var f_name;
  var l_name;
  var start_hour;
  var end_hour;


  //var isSelected = false.obs;

  DailyHallReserve({
    this.id,
    this.user_id,
    this.f_name,
    this.l_name,
    this.start_hour,
    this.end_hour,
    // required this.isSelected,



  });
  factory DailyHallReserve.fromJson(Map<String, dynamic> json) {
    return DailyHallReserve(
      f_name: json['f_name'] ?? '',
      l_name: json['l_name'] ?? '',
      id: json['id'] ?? '',
      user_id: json['user_id'] ?? '',
      start_hour: json['start_hour'] ?? '',
      end_hour: json['end_hour'] ?? '',

    );
  }




}