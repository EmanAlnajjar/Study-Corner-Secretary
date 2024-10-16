import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:untitled5/DailyHallReservations/DailyHallReservationsService.dart';
import 'package:untitled5/StydentReservationsInCourse/StydentReservationsInCourseController.dart';
import 'package:untitled5/ViewAnd%20DeleteStudentInCourse/ViewAndDeleteStudentInCourse.dart';
import 'package:untitled5/ViewAnd%20DeleteStudentInCourse/ViewAndDeleteStudentInCourseController.dart';


import '../ReserveCourse/ReserveCourse.dart';

import '../ReserveCourse/ReserveCourseController.dart';
import '../Service/configService.dart';
import '../StydentReservationsInCourse/StydentReservationsInCourse.dart';

import '../constans.dart';
import '../models/Coures.dart';
import '../models/UserInCourse.dart';
import 'package:http/http.dart'as http;



class CourseDetails extends StatelessWidget {
  String getActiveDays(CourseModel course) {
   List<String> activeDays = [];
    if (course.monday == 1) activeDays.add('Monday');
    if (course.tuesday == 1) activeDays.add('Tuesday');
    if (course.wednesday == 1) activeDays.add('Wednesday');
    if (course.thursday == 1) activeDays.add('Thursday');
    if (course.friday == 1) activeDays.add('Friday');
    if (course.saturday == 1) activeDays.add('Saturday');
    if (course.sunday == 1) activeDays.add('Sunday');
    return activeDays.join(', ');
  }

  ReserveCourseController reserveCourseController = Get.put(ReserveCourseController());
  ViewAndDeleteStudentInCourseController viewAndDeleteStudentInCourseController = Get.put(ViewAndDeleteStudentInCourseController());
  StydentReservationsInCourseController stydentReservationsInCourseController = Get.put(StydentReservationsInCourseController());
  final CourseModel cours;
  final int corsid;
  CourseDetails(this.cours,
      this.corsid);


  Future<void> fetchUserInCourse(int mycourseId) async {
    try {
      final fetchedUsers = await fetchUserIcourseFromServer(userToken, mycourseId); // انتقل من ddd إلى mycourseId
      viewAndDeleteStudentInCourseController.userInCoures.value = fetchedUsers;
    } catch (e) {
      print(e.toString());
    }
  }

  Future<List<UserInCourse>> fetchUserIcourseFromServer(String userToken, int courseId) async {
    var apiUrl = Uri.parse(ServiceConfig.domainName + '/api/courses/user/$courseId');

    try {
      final response = await http.get(
        apiUrl,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $userToken',
        },
      );
      // print('bbbb ${courseId}');
      print(response.statusCode);
      print(response.body);
      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body) as List<dynamic>;
        final userInCourseList = jsonData.map((userJson) => UserInCourse.fromJson(userJson)).toList();
        return userInCourseList;
      } else {
        throw Exception('Failed to fetch user in course from server');
      }
    } catch (e) {
      throw Exception('Failed to connect to server');
    }
  }
  //____________________________________________

  Future<void> fetchUserReservaInCourse(int mycourseId) async {
    try {
      final fetchedUsersReserv = await fetchUserReservIcourseFromServer(userToken, mycourseId); // انتقل من ddd إلى mycourseId
      stydentReservationsInCourseController.userReserveInCoures.value = fetchedUsersReserv;
    } catch (e) {
      print(e.toString());
    }
  }

  Future<List<UserInCourse>> fetchUserReservIcourseFromServer(String userToken, int courseId) async {
    var apiUrl = Uri.parse(ServiceConfig.domainName + '/api/courses/user/notPaid/$courseId');

    try {
      final response = await http.get(
        apiUrl,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $userToken',
        },
      );
      // print('bbbb ${courseId}');
      print(response.statusCode);
      print(response.body);

      if (response.statusCode == 201)
      {
        final jsonData = json.decode(response.body) as List<dynamic>;
        final userReservInCourseList = jsonData.map((userReservJson) => UserInCourse.fromJson(userReservJson)).toList();
        return userReservInCourseList;
      } else {
        throw Exception('Failed to fetch user in course from server');
      }
    } catch (e) {
      throw Exception('Failed to connect to server');
    }
  }


  @override
  Widget build(BuildContext context) {

    print('${corsid}');

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
            title:Text('View Course Details',
          style: TextStyle(
            fontSize: 20.0,
            fontFamily: 'Quicksand',
            color:mycolor2),),
            elevation: 0.0,
            backgroundColor:Colors.white),
        body:SingleChildScrollView(child:
       Padding(
         padding: EdgeInsets.all(15.0),
         child:  Column(

           crossAxisAlignment:CrossAxisAlignment.start ,
           children: [
             SizedBox(height:MediaQuery.of(context).size.height*0.03),
             //name
             Text('Course Name : ${cours.name} ',
               style: TextStyle(
                 fontSize: 20.0,
                 fontFamily: 'Quicksand',

               ),
             ),
             SizedBox(height:MediaQuery.of(context).size.height*0.02),
             //categore
             Text('Ctegory: ${cours.category}',
               style: TextStyle(
                 fontSize: 20.0,
                 fontFamily: 'Quicksand',
               ),
             ),
             SizedBox(height:MediaQuery.of(context).size.height*0.02),
             //price
             Text('Price: ${cours.price} PS',
               style: TextStyle(
                 fontSize: 20.0,
                 fontFamily: 'Quicksand',
               ),
             ),
             SizedBox(height:MediaQuery.of(context).size.height*0.02),
             //teacher name
             Text('Teacher Name:${cours.teacher_name}',
               style: TextStyle(
                 fontSize: 20.0,
                 fontFamily: 'Quicksand',
               ),
             ),
             SizedBox(height:MediaQuery.of(context).size.height*0.02),
             //how hours
             Text('Nember Of Hours: ${cours.hours}',
               style: TextStyle(
                 fontSize: 20.0,
                 fontFamily: 'Quicksand',
               ),
             ),
             SizedBox(height:MediaQuery.of(context).size.height*0.02),
             //startdate
             Text('Satrt Date: ${cours.start_date}',
               style: TextStyle(
                 fontSize: 20.0,
                 fontFamily: 'Quicksand',
               ),
             ),
             SizedBox(height:MediaQuery.of(context).size.height*0.02),
             //enddate
             Text('End Date: ${cours.end_date}',
               style: TextStyle(
                 fontSize: 20.0,
                 fontFamily: 'Quicksand',
               ),
             ),
             SizedBox(height:MediaQuery.of(context).size.height*0.02),
             //Days
             Text('Days: ${getActiveDays(cours)}',
               style: TextStyle(
                 fontSize: 20.0,
                 fontFamily: 'Quicksand',
               ),
             ),
             SizedBox(height:MediaQuery.of(context).size.height*0.02),
             //starthour
             Text('Start Hour: ${cours.start_hour}',
               style: TextStyle(
                 fontSize: 20.0,
                 fontFamily: 'Quicksand',
               ),
             ),
             SizedBox(height: MediaQuery.of(context).size.height * 0.02),
             // End Hours
             Text('End Hour: ${cours.end_hour}',
               style: TextStyle(
                 fontSize: 20.0,
                 fontFamily: 'Quicksand',
               ),
             ),
             SizedBox(height:MediaQuery.of(context).size.height*0.03),
             //buttoms_____________________________

             Row(
               mainAxisAlignment: MainAxisAlignment.center,
               children: [

                 InkWell(
                   onTap: () {

                    Get.to(ViewAndDeleteStudentInCourse(corsid));

                     fetchUserInCourse(corsid);
                       },
                   child: Container(
                     width:MediaQuery.of(context).size.width*0.4,
                     height:MediaQuery.of(context).size.height*0.05,
                     decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(25),
                       color: mycolor2,
                     ),
                     child: Center(
                       child: Text(
                         'View Student',
                         style: TextStyle(
                           color: Colors.white,
                           fontSize: 18,
                           fontFamily: 'Quicksand',
                         ),
                       ),
                     ),
                   ),
                 ),
                 SizedBox(
                   width: MediaQuery.of(context).size.width*0.01,
                 ),
                 InkWell(
                   onTap: () {

                     Get.to(ReserveCourse(corsid));

                   },
                   child: Container(
                     width:MediaQuery.of(context).size.width*0.4,
                     height:MediaQuery.of(context).size.height*0.05,
                     decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(25),
                       color: mycolor2,
                     ),
                     child: Center(
                       child: Text(
                         'Add Student',
                         style: TextStyle(
                           color: Colors.white,
                           fontSize: 18,
                           fontFamily: 'Quicksand',
                         ),
                       ),
                     ),
                   ),
                 ),],),
                 SizedBox(
                   height: MediaQuery.of(context).size.height*0.01,
                 ),
                 Center(child: InkWell(
                   onTap: () {
                    fetchUserReservaInCourse(corsid);
                    Get.to(StydentReservationsInCourse(corsid));



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
                         'View Reservations',
                         style: TextStyle(
                           color: Colors.white,
                           fontSize: 18,
                           fontFamily: 'Quicksand',

                         ),
                       ),
                     ),
                   ),
                 ),),
                 SizedBox(
                   height: MediaQuery.of(context).size.height*0.01,
                 ),


           ],
         ),
       ),

        )
        ),



    );
  }
}
