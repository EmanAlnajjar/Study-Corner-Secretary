import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/Coures.dart';
import '../Service/configService.dart';
import '../models/Seat.dart';
import '../userInformation.dart';
String userToken = UserInformation.userToken;

class RservedSeatsService {
  Future<List<Seat>> fetchReservedSeatFromServer(String userToken ) async {
    var apiUrl = Uri.parse(ServiceConfig.domainName+ServiceConfig.getReservedSeat);

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
        final seat = jsonData
            .map((courseJson) => Seat.fromJson(courseJson))
            .toList();

        return seat;
      } else {
        throw Exception('Failed to fetch Reserved Seat from server');
      }
    } catch (e) {
      throw Exception('Failed to connect to server');
    }
  }
}