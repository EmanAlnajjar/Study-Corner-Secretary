import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart'as http;
import '../Service/configService.dart';
import '../userInformation.dart';



class AddCourseController extends GetxController{
  late String couresName;
  late String hallName;
  late String category;
  late String teacherName;
  late int houre;
  late int price;
  late TimeOfDay startHoure;
  late TimeOfDay endHoure;
  var selectedDate = DateTime.now().obs;
 // var selectedendDate = DateTime.now().obs;
  RxBool monday = false.obs;
  RxBool tuesday = false.obs;
  RxBool wednesday = false.obs;
  RxBool thursday = false.obs;
  RxBool friday = false.obs;
  RxBool saturday = false.obs;
  RxBool sunday = false.obs;

  String userToken = UserInformation.userToken;


  bool isValidDate() {
    return selectedDate.value != null;
  }

  String formattedDate(DateTime date) {

    return DateFormat('yyyy/MM/dd').format(date);
  }


//__________________________________________________________________________________
  Rx<TimeOfDay> selectedStatTime = TimeOfDay.now().obs;
  TextEditingController startHoureController = TextEditingController();

  void selectStartTime(TimeOfDay satrttime) {
    selectedStatTime.value = satrttime;
    final formattedstartTime = DateFormat.jm().format(DateTime(0, 1, 1, satrttime.hour, satrttime.minute));
    startHoureController.text = formattedstartTime;

    this.startHoure = selectedStatTime.value;

  }
  //__________________________________________________________________________________

  Rx<TimeOfDay> selectedEndTime = TimeOfDay.now().obs;
  TextEditingController endHoureController = TextEditingController();

  void selectEndTime(TimeOfDay endtime) {
    selectedEndTime.value= endtime;
    final formattedendTime = DateFormat.jm().format(DateTime(0, 1, 1, endtime.hour, endtime.minute));
    endHoureController.text = formattedendTime;

    this.endHoure = selectedEndTime.value;

  }
  //_____________________________________________________________
  String formattedHour(TimeOfDay time) {
    final period = time.period == DayPeriod.am ? 'AM' : 'PM';
    final hour = time.hourOfPeriod == 0 ? 12 : time.hourOfPeriod;
    final minute = time.minute.toString().padLeft(2, '0');

    return '$hour:$minute $period';
  }


  // Future<void> addCourse(String name,String hall_name ,String category,int price ,String teacher_name,int hours ,
  //     DateTime start_date,DateTime end_date,TimeOfDay start_hour,TimeOfDay end_hour,
  //     bool monday,  bool tuesday, bool wednesday, bool thursday, bool friday, bool saturday,bool sunday, ) async {
  //   final apiUrl = Uri.parse(ServiceConfig.domainName+ServiceConfig.addCourse);
  //   final formattedStartDateValue = formattedDate(start_date);
  //   final formattedEndDateValue = formattedDate(end_date);
  //
  //   final response = await http.post(
  //       apiUrl,
  //       body: jsonEncode({
  //         'name': '${name}',
  //         'hall_name': '${hall_name}',
  //         'category':' ${category}',
  //         'price': '${price}',
  //         'teacher_name': '${teacher_name}',
  //         'hours': ' ${hours}',
  //         'start_date':formattedStartDateValue,
  //         'end_date':formattedEndDateValue,
  //         'start_hour':'${start_hour}',
  //         'end_hour':'${end_hour}',
  //         'monday': monday.toString(),
  //         'tuesday': tuesday.toString(),
  //         'wednesday': wednesday.toString(),
  //         'thursday': thursday.toString(),
  //         'friday': friday.toString(),
  //         'saturday': saturday.toString(),
  //         'sunday': sunday.toString(),
  //       }),
  //
  //       headers: {
  //         'Content-Type': 'application/json',
  //         'Authorization': 'Bearer $userToken',
  //         // Include the user token as a header
  //       });
  //          print(response.body);
  //
  //   if (response.statusCode == 200) {
  //     Get.snackbar('Success', 'Course added successfully');
  //
  //   } else {
  //     Get.snackbar('Error', 'Failed to add course');
  //   }
  // }
  //

  Future<void> addCourse(
      String name, String hall_name, String category, int price, String teacher_name, int hours,
      DateTime startdate,DateTime enddate,  TimeOfDay start_hour, TimeOfDay end_hour,
      bool monday, bool tuesday, bool wednesday, bool thursday, bool friday, bool saturday, bool sunday,
      ) async {
    final apiUrl = Uri.parse(ServiceConfig.domainName + ServiceConfig.addCourse);
    final formattedSatrtDateValue = formattedDate(startdate);
     final formattedEndDateValue = formattedDate(enddate);

    final formattedStartHourValue = formattedHour(start_hour);
    final formattedEndHourValue = formattedHour(end_hour);

    final requestBody = jsonEncode({
      'name': name,
      'hall_name': hall_name,
      'category': category,
      'price': price,
      'teacher_name': teacher_name,
      'hours': hours,
      'start_date': formattedSatrtDateValue,
     'end_date': formattedEndDateValue,
      'start_hour': formattedStartHourValue,
      'end_hour': formattedEndHourValue,
      'monday': monday.toString(),
      'tuesday': tuesday.toString(),
      'wednesday': wednesday.toString(),
      'thursday': thursday.toString(),
      'friday': friday.toString(),
      'saturday': saturday.toString(),
      'sunday': sunday.toString(),
    });

    final response = await http.post(
      apiUrl,
      body: requestBody,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $userToken',
        // Include the user token as a header
      },
    );

    print(response.body);

    if (response.statusCode == 200) {
      Get.snackbar('Success', 'Course added successfully');
    } else {
      Get.snackbar('Error', 'Failed to add course');
    }
  }

  }





