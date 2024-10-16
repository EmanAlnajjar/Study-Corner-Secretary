import 'dart:convert';
import 'package:http/http.dart' as http;

import '../Service/configService.dart';

import '../models/Coures.dart';
import '../userInformation.dart';
String userToken = UserInformation.userToken;

class ApiService {
  Future<List<CourseModel>> fetchCoursesFromServer() async {
    final apiUrl =  Uri.parse(ServiceConfig.domainName+ServiceConfig.getAllCourese); // استبدله بعنوان URL الصحيح للخادم الخاص بك

    try {
      final response = await http.get(apiUrl,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $userToken',
          // Include the user token as a header
        },
      );

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body) as List<dynamic>;
        final courses = jsonData
            .map((courseJson) => CourseModel.fromJson(courseJson))
            .toList();

        return courses;
      } else {
        throw Exception('Failed to fetch courses from server');
      }
    } catch (e) {
      throw Exception('Failed to connect to server');
    }
  }
}