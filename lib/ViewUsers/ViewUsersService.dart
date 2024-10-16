import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/Coures.dart';
import '../Service/configService.dart';

import '../models/User.dart';
import '../userInformation.dart';
String userToken = UserInformation.userToken;

class ViewUsersService {
  Future<List<AllUser>> fetchUsersFromServer(String userToken ) async {
    var apiUrl = Uri.parse(ServiceConfig.domainName+ServiceConfig.getAllUsers);

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
        final user = jsonData
            .map((userJson) => AllUser.fromJson(userJson))
            .toList();

        return user;
      } else {
        throw Exception('Failed to fetch Reserved Seat from server');
      }
    } catch (e) {
      throw Exception('Failed to connect to server');
    }
  }
}