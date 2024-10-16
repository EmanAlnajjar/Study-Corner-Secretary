import 'dart:convert';
import 'package:http/http.dart' as http;


import '../Service/configService.dart';



import '../models/DailyHallReserve.dart';
import '../userInformation.dart';
String userToken = UserInformation.userToken;

class DailyHallReservationService {
  Future<List<DailyHallReserve>> fetchDailyHallReservationFromServer(String userToken ) async {
    var apiUrl = Uri.parse(ServiceConfig.domainName+ServiceConfig.getDailyHallReservation);

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
        final dailyHall = jsonData
            .map((dailyHallJson) => DailyHallReserve.fromJson(dailyHallJson))
            .toList();

        return dailyHall;
      } else {
        throw Exception('Failed to fetch Reserved Hall from server');
      }
    } catch (e) {
      throw Exception('Failed to connect to server');
    }
  }
}