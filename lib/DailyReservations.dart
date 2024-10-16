import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'DailyHallReservations/DailyHallReservations.dart';
import 'DailySeatResevations/DailySeatReservations.dart';
import 'constans.dart';

class DailyReservations extends StatelessWidget {
  const DailyReservations({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,

        home: Scaffold(
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
                title:Text('Daily Rservation',
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
                    //seat
                    InkWell(
                      onTap: () {
                        Get.to(DailySeatReservations());

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
                            'Seats Resrvation',
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
                    //hall
                    InkWell(
                      onTap: () {
                        Get.to(DailyHallReservations());

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
                            'Halls Resrvation',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                    ),

                  ]),),
            )
        )
    );
  }
}
