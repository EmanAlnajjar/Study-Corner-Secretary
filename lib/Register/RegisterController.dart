import 'dart:convert';
import 'dart:ui';

import 'package:get/get.dart';

import '../Service/configService.dart';

import 'package:http/http.dart'as http;

class RegisterController extends GetxController{


  late String firstName;
  late String lastName;
  late int phone;
  //late DateTime birthday;

  late String email ;
  late String password;




  Future<void> register(String email,String f_name,String l_name,int phone,String password, ) async {
    var url = Uri.parse(ServiceConfig.domainName+ServiceConfig.register);
    try {
      var response = await http.post(
        url,
        headers: {
          'Accept': 'application/json'
        },
        body: {
          'email': '${email}',
          'f_name': '${f_name}',
          'l_name': '${l_name}',
          'phone': '${phone}',

          'password': '${password}',
        },
      );
      print(response.body);
      print(response.statusCode);

      if (response.statusCode == 200) {
        var jsonResponse = jsonDecode(response.body);

        print('Rsgister succees');

        Get.offAllNamed('/Login');

      } else if (response.statusCode == 422) {
        var jsonResponse = jsonDecode(response.body);

      } else {
      }
    } catch (e) {
      print('$e');

    }

  }


}


