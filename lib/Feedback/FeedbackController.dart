import 'dart:convert';

import 'package:get/get.dart';
import 'package:untitled5/Feedback/FeedbackService.dart';

import '../Service/configService.dart';
import '../models/Feedback.dart';
import '../userInformation.dart';
import 'package:http/http.dart'as http;
class FeedbacksController extends GetxController{
   String userToken = UserInformation.userToken;
   late int id ;
   late String rseponse;

   var feed = <Feedbacks>[].obs;
   @override
   void onInit() {
      super.onInit();
      fetchFeedbacks();
   }
   Future<void> fetchFeedbacks() async {
      try {
         final apiService = FeedbacksService();

         final fetchedFeedbacks = await apiService.fetchFeedbacksFromServer(userToken);
         feed.value = fetchedFeedbacks;
      } catch (e) {

         print(e.toString());
      }
   }

   Future<void> sendResponse(int itemId, String userToken,String myresponse) async {
      var apiUrl = Uri.parse(ServiceConfig.domainName+'/api/feedbacks/$itemId');
      try {
         final response = await http.post(apiUrl,
            body: jsonEncode({

               'response':'${myresponse}'
            }),


            headers: {
               'Content-Type': 'application/json',
               'Authorization': 'Bearer $userToken',
            },
         );
            print(response.statusCode);
         print(response.body);

         if (response.statusCode == 200) {


         } else {

         }
      } catch (error) {

      }
   }

}