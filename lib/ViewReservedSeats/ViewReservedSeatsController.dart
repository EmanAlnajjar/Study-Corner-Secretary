import 'package:get/get.dart';
import 'package:untitled5/Service/configService.dart';
import '../models/Seat.dart';
import '../userInformation.dart';
import 'ViewReservedSeatsService.dart';
import 'package:http/http.dart' as http;



String userToken = UserInformation.userToken;
class  ViewReservedSeatsController extends GetxController {
  late int id ;
  var seat = <Seat>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchResrevedSeat();
  }
  Future<void> fetchResrevedSeat() async {
    try {
      final apiService = RservedSeatsService();
      final fetchedSeatResrve = await apiService.fetchReservedSeatFromServer(userToken);
      seat.value = fetchedSeatResrve;
    } catch (e) {
      // يمكنك التعامل مع الأخطاء هنا
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
        seat.removeWhere((item) => item.id == itemId);
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
