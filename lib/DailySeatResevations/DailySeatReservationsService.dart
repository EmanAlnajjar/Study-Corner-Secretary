import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/Coures.dart';
import '../Service/configService.dart';


import '../models/DaliySeatReserve.dart';
import '../userInformation.dart';
String userToken = UserInformation.userToken;

class DailySeatReservationService {
  Future<List<DailySeatReserve>> fetchDailySeatReservationFromServer(String userToken ) async {
    var apiUrl = Uri.parse(ServiceConfig.domainName+ServiceConfig.getDailySeatReservation);

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
        final dailySeat = jsonData
            .map((dailySeatJson) => DailySeatReserve.fromJson(dailySeatJson))
            .toList();

        return dailySeat;
      } else {
        throw Exception('Failed to fetch Reserved Seat from server');
      }
    } catch (e) {
      throw Exception('Failed to connect to server');
    }
  }
}