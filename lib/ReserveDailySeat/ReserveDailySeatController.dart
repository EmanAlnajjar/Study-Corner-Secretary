import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;

import '../Service/configService.dart';
import '../userInformation.dart';



class ReserveDailySeatController extends GetxController{
  late String firstName;
  late String lastName;
  late TimeOfDay startHoure;
  late TimeOfDay endHoure;
  var selectedDate = DateTime.now().obs;
  String uerToken = UserInformation.userToken;


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
  //____________________________________________________________________________


  Future<void> confirmSeatDailyReservation(String firstName ,String lastName, DateTime date,TimeOfDay startHoure,TimeOfDay endHoure ) async {
    var url = Uri.parse(ServiceConfig.domainName+ServiceConfig.reserveSeatHourly);
    final formattedDateValue = formattedDate(date);
    // final userToken = getUserToken();


    final response = await http.post(
      url,
      body: jsonEncode({
        'f_name': '${firstName}',
        'l_name': '${lastName}',
        'date':formattedDateValue,
        'start_hour':'${startHoure}',
        'end_hour':'${ endHoure}',
       // 'user_id':'${8}',
      }),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $uerToken',
        // Include the user token as a header
      },
    );

    print('${response.body}');
    print('${response.statusCode}');


    if (response.statusCode == 200) {
      print('Reservation confirmed successfully');
    } else {
      print('Error confirming reservation: ${response.reasonPhrase}');
    }

  }



}






