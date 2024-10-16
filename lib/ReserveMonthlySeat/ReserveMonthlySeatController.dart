import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:untitled5/userInformation.dart';
import '../Service/configService.dart';

import 'package:http/http.dart' as http;

class ReserveMonthlySeatController extends GetxController {
  late String firstName;
  late String lastName;
  var selectedDate = DateTime.now().obs;
  String userToken = UserInformation.userToken;


  bool isValidDate() {
    return selectedDate.value != null;
  }

  String formattedDate(DateTime date) {

    return DateFormat('yyyy/MM/dd').format(date);
  }

  Future<void> confirmSeatMonthlyReservation(String firstName ,String lastName, DateTime date, ) async {
    var url = Uri.parse(ServiceConfig.domainName+ServiceConfig.reserveSeatMonthly);
    final formattedDateValue = formattedDate(date);
    // final userToken = getUserToken();
    print(' jjjj ${formattedDateValue}');

    final response = await http.post(
      url,
      body: jsonEncode({
        'f_name': '${firstName}',
        'l_name': '${lastName}',
        'date':formattedDateValue,
      //  'user_id':'${14}',
      }),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $userToken',
      //  Include the user token as a header
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






//   Rx<DateTime> selectedDate = DateTime.now().obs;
//   TextEditingController dateController = TextEditingController();
//
//   void selectDate(DateTime date) {
//
//     selectedDate.value = date;
//     dateController.text = DateFormat('yyyy-MM-dd').format(selectedDate.value);
//     String formattedDate = DateFormat('d-M-yyyy').format(selectedDate.value);
//     DateTime parsedDate = DateFormat('d-M-yyyy').parse(formattedDate);
//     DateTime dateWithoutTime = DateTime(parsedDate.year, parsedDate.month, parsedDate.day);
//
//     this.date = dateWithoutTime;
//
//
//     //this.date = selectedDate.value;
//
//
// // DateTime selectedDate = DateTime.now();
// // String formattedDate = DateFormat('d-M-yyyy').format(selectedDate);
// // print(formattedDate); // Output: 16-8-2023
// //
// // // Convert the formatted date back to DateTime with default time values
// // DateTime parsedDate = DateFormat('d-M-yyyy').parse(formattedDate);
// // DateTime dateWithoutTime = DateTime(parsedDate.year, parsedDate.month, parsedDate.day);
// // print(dateWithoutTime); // Output: 2023-08-16 00:00:00.000
// // this.date = dateWithoutTime;
//
//
//
//
//
//   ReserveMonthlySeatService service = ReserveMonthlySeatService();
//
//   Future<void> ReserveMonthlySeatOnClick() async {
//     Seat seat = Seat(
//       firstName: firstName,
//       lastName: lastName,
//       date: selectedDate.value,
//     );
//
//     service.reserveMonthlySeat(seat);
//     reservemonthlystatus = await service.reserveMonthlySeat(seat);
//     message = service.message;
//
//     if (message is List) {
//       String temp = '';
//       for (String s in message) temp += s + '\n';
//       message = temp;
//     }
//   }
// }
//
}