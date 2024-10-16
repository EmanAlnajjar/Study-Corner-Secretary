import 'package:get/get.dart';

import '../Service/configService.dart';
import '../models/DaliySeatReserve.dart';
import '../userInformation.dart';
import 'DailySeatReservationsService.dart';
import 'package:http/http.dart'as http;

class DailyReservationsController extends GetxController{

  // var checkBoxState = false.obs;
  // void ChangeBoxState(){
  //   checkBoxState (!(checkBoxState.value));
  // }
  String userToken = UserInformation.userToken;
  late int id ;
  var dailySeat = <DailySeatReserve>[].obs;
  @override
  void onInit() {
    super.onInit();
    fetchDailySeatReservation();
  }
  Future<void> fetchDailySeatReservation() async {
    try {
      final apiService = DailySeatReservationService();

      final fetchedSeatResrve = await apiService.fetchDailySeatReservationFromServer(userToken);
      dailySeat.value = fetchedSeatResrve;
    } catch (e) {

      print(e.toString());
    }
  }

  Future<void> deleteItem(int itemId, String userToken) async {
    var apiUrl = Uri.parse(ServiceConfig.domainName+'/api/Seat_CancelReserve/$itemId');
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
        dailySeat.removeWhere((item) => item.id == itemId);
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
    var apiUrl = Uri.parse(ServiceConfig.domainName+'/api/Seat_checkin/$itemId');
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
    var apiUrl = Uri.parse(ServiceConfig.domainName+'/api/Seat_checkout_hourly/$itemId');
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