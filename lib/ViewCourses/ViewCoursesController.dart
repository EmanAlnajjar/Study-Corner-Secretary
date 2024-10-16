import 'dart:convert';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import '../Service/configService.dart';
import '../models/Coures.dart';
import 'ViewCoursesService.dart';

class ViewCoursesController extends GetxController {
  var courses = <CourseModel>[].obs;
  late TimeOfDay startHoure;
  late TimeOfDay endHoure;

  Rx<TimeOfDay> selectedStatTime = TimeOfDay.now().obs;
  TextEditingController startHoureController = TextEditingController();

  void selectStartTime(TimeOfDay starttime) {
    selectedStatTime.value = starttime;
    final formattedStartTime =
    DateFormat.jm().format(DateTime(0, 1, 1, starttime.hour, starttime.minute));
    startHoureController.text = formattedStartTime;
    this.startHoure = selectedStatTime.value;
  }

  Rx<TimeOfDay> selectedEndTime = TimeOfDay.now().obs;
  TextEditingController endHoureController = TextEditingController();

  void selectEndTime(TimeOfDay endtime) {
    selectedEndTime.value = endtime;
    final formattedEndTime =
    DateFormat.jm().format(DateTime(0, 1, 1, endtime.hour, endtime.minute));
    endHoureController.text = formattedEndTime;
    this.endHoure = selectedEndTime.value;
  }

  @override
  void onInit() {
    super.onInit();
    fetchCourses();
  }

  Future<void> fetchCourses() async {
    try {
      final apiService = ApiService();
      final fetchedCourses = await apiService.fetchCoursesFromServer();
      courses.value = fetchedCourses;
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> deleteItem(int itemId, String userToken) async {
    var apiUrl = Uri.parse(ServiceConfig.domainName+'/api/courses/$itemId');
    try {
      final response = await http.delete(apiUrl,
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $userToken',
          }
      );

      if (response.statusCode == 200) {
        // Item deleted successfully, update your state
        // Remove the item from the list
        courses.removeWhere((item) => item.id == itemId);
      } else {
        // Handle error if deletion fails
        print('Deletion failed');
      }
    } catch (error) {
      // Handle exception or network error
      print('Error: $error');
    }
  }

  Future<void> updateItem(int itemId, String userToken, TimeOfDay startHour, TimeOfDay endHour) async {
    var apiUrl = Uri.parse(ServiceConfig.domainName+'/api/courses/$itemId');
    try {
      // Convert TimeOfDay values to formatted strings (HH:mm)
      String formattedStartHour = '${startHour.hour.toString().padLeft(2, '0')}:${startHour.minute.toString().padLeft(2, '0')}';
      String formattedEndHour = '${endHour.hour.toString().padLeft(2, '0')}:${endHour.minute.toString().padLeft(2, '0')}';

      // Send PUT request to update the course
      final response = await http.post(
        apiUrl,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $userToken',
        },
        body: jsonEncode({
          'start_hour': formattedStartHour,
          'end_hour': formattedEndHour,

        }),
      );
      print(response.body);

      if (response.statusCode == 200) {

        final index = courses.indexWhere((course) => course.id == itemId);
        if (index != -1) {

          courses[index].start_hour = formattedStartHour;
          courses[index].end_hour = formattedEndHour;
        }
      } else {

        print('Update failed');
      }
    } catch (error) {

      print('Error: $error');
    }
  }
}
