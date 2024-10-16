import 'package:get/get.dart';
import 'package:untitled5/Service/configService.dart';

import '../userInformation.dart';

import 'package:http/http.dart' as http;

import 'ViewReservedHallsService.dart';

import '../models/Hall.dart';

String userToken = UserInformation.userToken;
class  ViewReservedHallsController extends GetxController {
  late int id ;
  var hall = <Hall>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchResrevedHall();
  }
  Future<void> fetchResrevedHall() async {
    try {
      final apiService = RservedHallsService();
      final fetchedHallResrve = await apiService.fetchReservedHallFromServer(userToken);
      hall.value = fetchedHallResrve;
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
        hall.removeWhere((item) => item.id == itemId);
      } else {
        // Handle error if deletion fails
        print('Deletion failed');
      }
    } catch (error) {
      // Handle exception or network error
      print('Error: $error');
    }
  }

}
