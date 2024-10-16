import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart'as http;
import '../models/UserInCourse.dart';
import '../userInformation.dart';
import '../Service/configService.dart';

class ViewAndDeleteStudentInCourseController extends GetxController {
  String userToken = UserInformation.userToken;

  late int ddd = 0;


  var userInCoures = <UserInCourse>[].obs;

  Future<void> deleteItem(int itemId,int coursid, String userToken) async {
    var apiUrl = Uri.parse(ServiceConfig.domainName+'/api/courses/user/$itemId/$coursid');
    try {
      // Send delete request to the server
      final response = await http.delete(apiUrl,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $userToken',
        },
      );
      print(response.body);

      if (response.statusCode == 200) {
        // Item deleted successfully, update your state
        // Remove the item from the list
        userInCoures.removeWhere((item) => item.id == itemId);
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
