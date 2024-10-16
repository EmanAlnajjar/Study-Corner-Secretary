import 'dart:convert';
import 'package:http/http.dart' as http;


import '../Service/configService.dart';
import '../models/Hall.dart';

import '../userInformation.dart';
String userToken = UserInformation.userToken;

class RservedHallsService {
  Future<List<Hall>> fetchReservedHallFromServer(String userToken ) async {
    var apiUrl = Uri.parse(ServiceConfig.domainName+ServiceConfig.getReservedHall);

    try {
      final response = await http.get(apiUrl,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $userToken',
          // Include the user token as a header
        },);
          print(response.body);

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body) as List<dynamic>;
        final hall = jsonData
            .map((hallJson) => Hall.fromJson(hallJson))
            .toList();

        return hall;
      } else {
        throw Exception('Failed to fetch Reserved Seat from server');
      }
    } catch (e) {
      throw Exception('Failed to connect to server');
    }
  }
}