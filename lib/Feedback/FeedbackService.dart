import 'dart:convert';
import 'package:http/http.dart' as http;


import '../Service/configService.dart';
import '../models/Feedback.dart';
import '../userInformation.dart';
String userToken = UserInformation.userToken;

class FeedbacksService {
  Future<List<Feedbacks>> fetchFeedbacksFromServer(String userToken ) async {
    var apiUrl = Uri.parse(ServiceConfig.domainName+ServiceConfig.getAllFeedbacks);

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
        final allFeedbacks = jsonData
            .map((allFeedbacksJson) => Feedbacks.fromJson(allFeedbacksJson))
            .toList();

        return allFeedbacks;
      } else {
        throw Exception('Failed to fetch Reserved Hall from server');
      }
    } catch (e) {
      throw Exception('Failed to connect to server');
    }
  }
}