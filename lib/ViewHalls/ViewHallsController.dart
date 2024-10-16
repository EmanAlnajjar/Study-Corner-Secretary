

import 'package:get/get.dart';

import '../models/AllHall.dart';
import '../userInformation.dart';
import 'ViewHallsService.dart';

String userToken = UserInformation.userToken;
class ViewHallsController extends GetxController{
  var myallhall = <AllHall>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchHall();
  }
  Future<void> fetchHall() async {
    try {
      final apiService = ViewAllHallsService();
      final fetchedAllHall = await apiService.fetchAllHallFromServer(userToken);
      myallhall.value = fetchedAllHall;
    } catch (e) {
      print(e.toString());
    }
  }




}