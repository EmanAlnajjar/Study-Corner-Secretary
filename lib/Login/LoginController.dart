import 'dart:convert';
import 'dart:ui';

import 'package:get/get.dart';

import '../Home/Home.dart';
import '../Service/configService.dart';

import 'package:http/http.dart'as http;

import '../userInformation.dart';

class LoginController extends GetxController{


  var email ;
  var password;
  var message;
  var singupstatus = false;

  var token;


  Future <void> login (String email , String password )async {
    var url = Uri.parse(ServiceConfig.domainName+ServiceConfig.login);
    try{
      var response = await http.post(
          url ,
          headers: {},
          
          body: {
            'email 1111':'${email}',
            'password':'${password}',
          }
      );
      print(response.body);
      print(response.statusCode);


      if (response.statusCode == 200){
        Get.offAndToNamed('/Home');
        var jsonRespons = jsonDecode(response.body);
       // message =jsonRespons ['msg'];
      //  token = jsonRespons ['token'];
        UserInformation.userToken = token;
        Get.offAndToNamed('/Home');



      }
      else if(response.statusCode == 422){
        var jsonRespons = jsonDecode(response.body);
        message =jsonRespons['error'];


      }else {

      } }catch (e) {

      print('$e');

    }
  }

}