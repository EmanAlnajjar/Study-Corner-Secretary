import 'dart:convert';

import 'package:get/get.dart';

import '../Service/configService.dart';
import 'package:http/http.dart'as http;
class ReserveCourseController extends GetxController {

 late int id ;
late String firstName;
 late String lasttName;


  var checkBoxState = false.obs;
  void ChangeBoxState(){
    checkBoxState (!(checkBoxState.value));
  }

  Future<void> addStudentTocourse(int course_id, String userToken ,String f_name , String l_name ,bool is_paid) async {
    var apiUrl = Uri.parse(ServiceConfig.domainName+'/api/reservationsOfCourse/byAdmin');
    try {
      // Send delete request to the server
      final response = await http.post(apiUrl,
        body:jsonEncode({

          'f_name':'${f_name}',
          'l_name':'${l_name}',
           'is_paid':'${is_paid}',
          'course_id':'${course_id}',

        }),


        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $userToken',
        },
      );
      print(response.body);
      print(response.statusCode);
      if (response.statusCode == 201) {

      } else {
        // Handle error if deletion fails
        print('Deletion failed');
      }
    } catch (error) {
      // Handle exception or network error
      print('Error: $error');
    }
  }




}