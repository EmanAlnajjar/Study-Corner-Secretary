import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../Service/configService.dart';
import '../userInformation.dart';
import 'package:http/http.dart'as http;

class ReserveHallController extends GetxController {

  late String firstName;
  late String lastName;
  late TimeOfDay startHoure;
  late TimeOfDay endHoure;
  var selectedDate = DateTime.now().obs;
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

  void selectStartTime(TimeOfDay startTime) {
    selectedStatTime.value = startTime;
    final formattedStartTime = DateFormat('HH:mm:ss').format(
      DateTime(0, 1, 1, startTime.hour, startTime.minute),
    );
    startHoureController.text = formattedStartTime;
    this.startHoure = startTime;
  }

// ...
  Rx<TimeOfDay> selectedEndTime = TimeOfDay.now().obs;
  TextEditingController endHoureController = TextEditingController();

  void selectEndTime(TimeOfDay endTime) {
    selectedEndTime.value = endTime;
    final formattedEndTime = DateFormat('HH:mm:ss').format(
      DateTime(0, 1, 1, endTime.hour, endTime.minute),
    );
    endHoureController.text = formattedEndTime;
    this.endHoure = endTime;
  }
  //____________________________________________________________________________


  Future<void> confirmHallReservation(String firstName ,String lastName, DateTime date,TimeOfDay startHoure,TimeOfDay endHoure ,int hallId ) async {
    var url = Uri.parse(ServiceConfig.domainName+ServiceConfig.reserveHall);
    final formattedDateValue = formattedDate(date);
    final formattedStartHoure = '${startHoure.hour.toString().padLeft(2, '0')}:${startHoure.minute.toString().padLeft(2, '0')}:00';
    final formattedEndHoure = '${endHoure.hour.toString().padLeft(2, '0')}:${endHoure.minute.toString().padLeft(2, '0')}:00';



    final response = await http.post(
      url,
      body: jsonEncode({
        'f_name': '${firstName}',
        'l_name': '${lastName}',
        'date':formattedDateValue,
        'start_hour':formattedStartHoure,
        'end_hour':formattedEndHoure,
        'hall_id':hallId,

      }),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $userToken',
        // Include the user token as a header
      },
    );

    print(response.body);
    print('${response.statusCode}');


    if (response.statusCode == 200) {
      print('Reservation confirmed successfully');
    } else {
      print('Error confirming reservation: ${response.reasonPhrase}');
    }

  }
}