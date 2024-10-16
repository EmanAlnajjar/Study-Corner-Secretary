import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'ReserveDailySeat/ReserveDailySeat.dart';
import 'ReserveHourlySeat/ReserveHourlySeat.dart';
import 'ReserveMonthlySeat/ReserveMonthlySeat.dart';
import 'ReserveWeeklySeat/ReserveWeeklySeat.dart';
import 'constans.dart';

class TypeReserveSeat extends StatelessWidget {
  const TypeReserveSeat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      home: Scaffold(
      appBar: AppBar(
          leading: Builder(
            builder: (context) =>
                IconButton(
                    icon: Icon(Icons.arrow_back),
                    color: Colors.black,
                    onPressed: () {
                      Get.back();
                    }

                ),
          ),

          title: Text('Rservation Type',
      style: TextStyle(
        fontSize: 20.0,
        fontFamily: 'Quicksand',
        color: mycolor2,),),
        elevation: 0.0,
        backgroundColor:Colors.white),

        body:SingleChildScrollView(
        child: Center(child: Column(

            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height*0.25,
              ),
              //Hourlu
              InkWell(
                onTap: () {
                  Get.to(ReserveHourlySeat());

                },
                child: Container(
                  width:MediaQuery.of(context).size.width*0.5,
                  height:MediaQuery.of(context).size.height*0.05,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: mycolor2,
                  ),
                  child: Center(
                    child: Text(
                      'Hourly',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height*0.01,
              ),
              //Daily
              InkWell(
                onTap: () {
                  Get.to(ReserveDailySeat());

                },
                child: Container(
                  width:MediaQuery.of(context).size.width*0.5,
                  height:MediaQuery.of(context).size.height*0.05,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: mycolor2,
                  ),
                  child: Center(
                    child: Text(
                      'Daily',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height*0.01,
              ),
              //weekly
              InkWell(
                onTap: () {
                  Get.to(ReserveWeeklySeat());

                },
                child: Container(
                  width:MediaQuery.of(context).size.width*0.5,
                  height:MediaQuery.of(context).size.height*0.05,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: mycolor2,
                  ),
                  child: Center(
                    child: Text(
                      'Weekly',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height*0.01,
              ),
              //monthly
              InkWell(
                onTap: () {
                  Get.to(ReserveMonthlySeat());

                },
                child: Container(
                  width:MediaQuery.of(context).size.width*0.5,
                  height:MediaQuery.of(context).size.height*0.05,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: mycolor2,
                  ),
                  child: Center(
                    child: Text(
                      'Monthly',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height*0.01,
              ),


            ]),),
    )
      )
    );
  }
}
