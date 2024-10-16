import 'package:get/get.dart';
import 'package:http/http.dart'as http;
import 'package:untitled5/Service/configService.dart';
import '../models/User.dart';
import '../userInformation.dart';
import 'ViewUsersService.dart';

class ViewUsersController extends GetxController{
  String userToken = UserInformation.userToken;
  late int id ;
  var myuser = <AllUser>[].obs;
  @override
  void onInit() {
    super.onInit();
    fetchUser();
  }
  Future<void> fetchUser() async {
    try {
      final apiService = ViewUsersService();

      final fetchedSeatResrve = await apiService.fetchUsersFromServer(userToken);
      myuser.value = fetchedSeatResrve;
    } catch (e) {

      print(e.toString());
    }
  }

  Future<void> deleteItem(int itemId, String userToken) async {
    var apiUrl = Uri.parse(ServiceConfig.domainName+'/api/users/$itemId');
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
        myuser.removeWhere((item) => item.id == itemId);
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
