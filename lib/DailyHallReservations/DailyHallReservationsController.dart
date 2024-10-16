import 'package:get/get.dart';

import '../Service/configService.dart';
import '../models/DailyHallReserve.dart';
import '../userInformation.dart';
import 'DailyHallReservationsService.dart';
import 'package:http/http.dart'as http;



class DailyHallReservationsController extends GetxController{

  // var checkBoxState = false.obs;
  // void ChangeBoxState(){
  //   checkBoxState (!(checkBoxState.value));
  // }

  String userToken = UserInformation.userToken;
  late int id ;
  var dailyhall = <DailyHallReserve>[].obs;
  @override
  void onInit() {
    super.onInit();
    fetchDailyHallReservation();
  }
  Future<void> fetchDailyHallReservation() async {
    try {
      final apiService = DailyHallReservationService();

      final fetchedSeatResrve = await apiService.fetchDailyHallReservationFromServer(userToken);
      dailyhall.value = fetchedSeatResrve;
    } catch (e) {

      print(e.toString());
    }
  }

  Future<void> deleteItem(int itemId, String userToken) async {
    var apiUrl = Uri.parse(ServiceConfig.domainName+'/api/Hall_CancelReserve/$itemId');
    try {
      // Send delete request to the server
      final response = await http.delete(apiUrl,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $userToken',
        },
      );
      print(response.body);

      if (response.statusCode == 200) {
        // Item deleted successfully, update your state
        // Remove the item from the list
        dailyhall.removeWhere((item) => item.id == itemId);
      } else {
        // Handle error if deletion fails
        print('Deletion failed');
      }
    } catch (error) {
      // Handle exception or network error
      print('Error: $error');
    }
  }

  Future<void> chickInSeat(int itemId, String userToken) async {
    var apiUrl = Uri.parse(ServiceConfig.domainName+'/api/Hall_checkin/$itemId');
    try {
      // Send delete request to the server
      final response = await http.post(apiUrl,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $userToken',
        },
      );
      print(response.body);

      if (response.statusCode == 200) {

      } else {
        // Handle error if deletion fails
        print('Deletion failed');
      }
    } catch (error) {
      // Handle exception or network error
      print('Error: $error');
    }
  }

  Future<String> chickOutSeat(int itemId, String userToken) async {
    var apiUrl = Uri.parse(ServiceConfig.domainName+'/api/Hall_checkout/$itemId');
    try {
      final response = await http.post(apiUrl,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $userToken',
        },
      );

      if (response.statusCode == 200) {

        return response.body;
      } else {
        return 'Deletion failed';
      }
    } catch (error) {
      return 'Error: $error';
    }
  }

}