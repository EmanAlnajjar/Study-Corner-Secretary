import 'dart:convert';
import 'package:http/http.dart' as http;


import '../Service/configService.dart';
import '../models/AllHall.dart';

import '../userInformation.dart';
String userToken = UserInformation.userToken;

class ViewAllHallsService {
  Future<List<AllHall>> fetchAllHallFromServer(String userToken ) async {
    var apiUrl = Uri.parse(ServiceConfig.domainName+ServiceConfig.getAllHalls);

    try {
      final response = await http.get(
        apiUrl,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $userToken',
          // Include the user token as a header
        },);
      print(response.body);
      print(response.statusCode);
      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body) as List<dynamic>;
        final allhall = jsonData
            .map((allhall) => AllHall.fromJson(allhall))
            .toList();

        return allhall;
      } else {
        throw Exception('Failed to fetch Hall from server');
      }
    } catch (e) {
      throw Exception('Failed to connect to server');
    }
  }
}