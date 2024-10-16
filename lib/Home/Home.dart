import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled5/AddCourse/AddCourse.dart';
import 'package:untitled5/TypeReserveSeat.dart';
import 'package:untitled5/ViewCourses/ViewCourses.dart';
import 'package:untitled5/ViewHalls/ViewHalls.dart';
//import 'package:untitled5/ViewSeats/ViewSeats.dart';
import 'package:untitled5/ViewUsers/ViewUsers.dart';

import '../DailyReservations.dart';
import '../Feedback/Feedback.dart';

import '../ViewReservedHall/ViewReservedHalls.dart';
import '../constans.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

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
                title: Text('Home',
              style: TextStyle(
                fontSize: 20.0,
                fontFamily: 'Quicksand',
                color: mycolor2,),),
                elevation: 0.0,
                backgroundColor:Colors.white),

        body:SingleChildScrollView(
          child: Column(
            children: [


           //view hall & reserved seat & user
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Column(
                      children: [
                        //view halls
                        InkWell(
                          onTap: () {
                            Get.toNamed('/ViewHalls');

                          },

                            child: Container(
                                height: MediaQuery.of(context).size.height*0.15,
                                width: MediaQuery.of(context).size.width*0.45,
                                decoration: BoxDecoration(
                                  border: Border.all (width:4,color: mycolor2),
                                  borderRadius: BorderRadius.circular(20.0),
                                  color: Colors.white,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),

                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        child:Text(
                                                  'View Halls',
                                              style: TextStyle(fontSize: 20.0,fontFamily: 'Quicksand',),
                                            ),


                                      ),
                                      Expanded(

                                          child: Image.asset(
                                            'assets/images/hall.png',

                                      ),
                                      ) ]
                                  ),
                                )),
                          ),

                        SizedBox(
                          height: MediaQuery.of(context).size.height*0.01,
                        ),
                        //view Seats
                        InkWell(
                          onTap: () {
                            Get.toNamed('/ViewReservedSeats');
                          },

                            child: Container(
                                height: MediaQuery.of(context).size.height*0.15,
                                width: MediaQuery.of(context).size.width*0.45,
                                decoration: BoxDecoration(
                                  border: Border.all (width:4,color: mycolor4),
                                  borderRadius: BorderRadius.circular(20.0),
                                  color: Colors.white,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),

                                  child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Expanded(
                                          child:Text(
                                            'View\nReserve\nSeats',
                                            style: TextStyle(fontSize: 20.0,fontFamily: 'Quicksand'),
                                          ),


                                        ),
                                        Expanded(

                                          child: Image.asset(
                                            'assets/images/seat.png',

                                          ),
                                        ) ]
                                  ),
                                )),
                          ),

                      ],
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width*0.03,
                    ),
                    // view users
                    InkWell(
                      onTap: () {
                        Get.toNamed('/ViewUsers');
                      },

                        child: Container(
                            height: MediaQuery.of(context).size.height*0.3,
                            width: MediaQuery.of(context).size.width*0.45,
                            decoration: BoxDecoration(
                              border: Border.all (width:4,color: mycolor1),
                              borderRadius: BorderRadius.circular(20.0),
                              color: Colors.white,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),

                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                  Text(
                                        'View Users',
                                        style: TextStyle(fontSize: 20.0,fontFamily: 'Quicksand'),
                                      ),



                                    Expanded(

                                      child: Image.asset(
                                        'assets/images/viewusers.png',

                                      ),
                                    ) ]
                              ),
                            )),
                      ),

                  ],
                ),
              ),
              //_____________________________
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Get.to(TypeReserveSeat());
                      },

                      child: Container(
                          height: MediaQuery.of(context).size.height*0.3,
                          width: MediaQuery.of(context).size.width*0.45,
                          decoration: BoxDecoration(
                            border: Border.all (width:4,color: mycolor1),
                            borderRadius: BorderRadius.circular(20.0),
                            color: Colors.white,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),

                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    'Reserve Seat',
                                    style: TextStyle(fontSize: 20.0,fontFamily: 'Quicksand'),
                                  ),



                                  Expanded(

                                    child: Image.asset(
                                      'assets/images/viewusers.png',

                                    ),
                                  ) ]
                            ),
                          )),
                    ),

                    SizedBox(
                      width: MediaQuery.of(context).size.width*0.03,
                    ),

                    Column(
                      children: [
                        //view Courses
                        InkWell(
                          onTap: () {
                            Get.toNamed('/ViewCourses');

                          },

                          child: Container(
                              height: MediaQuery.of(context).size.height*0.15,
                              width: MediaQuery.of(context).size.width*0.45,
                              decoration: BoxDecoration(
                                border: Border.all (width:4,color: mycolor1),
                                borderRadius: BorderRadius.circular(20.0),
                                color: Colors.white,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),

                                child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        'View\nCourese',
                                        style: TextStyle(fontSize: 20.0,fontFamily: 'Quicksand',),
                                      ),


                                      Image.asset(
                                        'assets/images/hall.png',
                                        width: 70,


                                      ) ]
                                ),
                              )),
                        ),


                        SizedBox(
                          height: MediaQuery.of(context).size.height*0.01,
                        ),

                        //add course
                        InkWell(
                          onTap: () {
                            Get.to(AddCourse());
                          },

                          child: Container(
                              height: MediaQuery.of(context).size.height*0.15,
                              width: MediaQuery.of(context).size.width*0.45,
                              decoration: BoxDecoration(
                                border: Border.all (width:4,color: mycolor3),
                                borderRadius: BorderRadius.circular(20.0),
                                color: Colors.white,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),

                                child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Add\nCourse',
                                        style: TextStyle(fontSize: 20.0,fontFamily: 'Quicksand'),
                                      ),


                                      Image.asset(
                                        'assets/images/seat.png',
                                        width: 70,

                                      ),
                                    ]
                                ),
                              )),
                        ),
                      ],
                    ),

                  ],
                ),
              ),
              //__________________________________
              //view reserved halls
              Padding(
                padding: const EdgeInsets.all(8.0),
                child:

                InkWell(
                  onTap: () {
                    Get.to(ViewReservedHalls());

                  },

                  child: Container(
                    height: MediaQuery.of(context).size.height*0.14,
                  width: MediaQuery.of(context).size.width*0.95,
                  decoration: BoxDecoration(
                    border: Border.all (width:4,color: mycolor4),
                    borderRadius: BorderRadius.circular(20.0),
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),

                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                      Text(
                                  'View Reserve Halls',
                                  style: TextStyle(fontSize: 20.0,fontFamily: 'Quicksand',),
                                ),



                              Expanded(

                                child: Image.asset(
                                  'assets/images/hall.png',

                                ),
                              ) ]
                        ),
                      )),
                ),
              ),
              //___________________________________
              // daily rservation
              Padding(
                padding: const EdgeInsets.all(8.0),
                child:
                    //feed back
                    InkWell(
                      onTap: () {
                        Get.to(DailyReservations());
                      },

                        child: Container(
                            height: MediaQuery.of(context).size.height*0.14,
                            width: MediaQuery.of(context).size.width*0.95,
                            decoration: BoxDecoration(
                              border: Border.all (width:4,color: mycolor2),
                              borderRadius: BorderRadius.circular(20.0),
                              color: Colors.white,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),

                              child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                 Expanded(child:  Text(
                                   'Daily Resrvations',
                                   style: TextStyle(fontSize: 20.0,fontFamily: 'Quicksand'),
                                 ),),



                                   Expanded(child: Image.asset(
                                     'assets/images/seat.png',


                                   )) , ]
                              ),
                            )),
                      ),
                    ),
              //____________________________________
              //feedback
              Padding(
                padding: const EdgeInsets.all(8.0),
                child:
                //feed back
                InkWell(
                  onTap: () {
                    Get.to(Feedbacks());
                  },

                    child: Container(
                        height: MediaQuery.of(context).size.height*0.14,
                        width: MediaQuery.of(context).size.width*0.95,
                        decoration: BoxDecoration(
                          border: Border.all (width:4,color: mycolor1),
                          borderRadius: BorderRadius.circular(20.0),
                          color: Colors.white,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),

                          child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                          Expanded(child: Text(
                            '       Feedback',
                            style: TextStyle(fontSize: 20.0,fontFamily: 'Quicksand'),
                          ))  ,


                            Expanded(child:  Image.asset(
                              'assets/images/seat.png',

                            )) ,
                                ]
                          ),
                        )),
                  ),
                ),











            ],
          ),
        ),
      )
    );

  }
}
