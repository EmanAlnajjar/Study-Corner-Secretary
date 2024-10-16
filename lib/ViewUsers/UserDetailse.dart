import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constans.dart';
import '../models/User.dart';


class UserDetails extends StatelessWidget {
  final AllUser user ;
  UserDetails(this.user);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: Builder(
        builder: (context) =>
            IconButton(
                icon: Icon(Icons.arrow_back),
                color: Colors.black,
                onPressed: () {
                  Get.back();
                }

            ),
      ),
          title: Text('View User Details',
        style: TextStyle(
          fontSize: 20.0,
          fontFamily: 'Quicksand',
          color: mycolor2,),),
          backgroundColor:Colors.white),
      body:Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,

          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height*0.1,
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  Expanded(child:  Text('${user.f_name} ${user.l_name} ',
                      style:  TextStyle(
                          fontSize: 25.0,
                          fontFamily: 'Quicksand')
                  ),
                  ),


                ]
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.1,
            ),
            Expanded(child:  Text('Email : ${user.email}',
                style:  TextStyle(
                    fontSize: 20.0,
                    fontFamily: 'Quicksand')
            ),),
            Expanded(child:  Text('PhoneNummber : ${user.phone}',
                style:  TextStyle(
                    fontSize: 20.0,
                    fontFamily: 'Quicksand')
            ),),
            Expanded(child:  Text('Birthday : ${user.birthdate}',
                style:  TextStyle(
                    fontSize: 20.0,
                    fontFamily: 'Quicksand')
            ),),
            Expanded(child:  Text('Education : ${user.education}',
                style:  TextStyle(
                    fontSize: 20.0,
                    fontFamily: 'Quicksand')
            ),),

          ],),
      ),
    );


  }
}
