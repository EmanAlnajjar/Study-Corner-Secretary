
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';


import 'AddCourse/AddCourse.dart';
import 'AddStudentToCourse/AddStudentToCourse.dart';
import 'DailyHallReservations/DailyHallReservations.dart';
import 'DailyReservations.dart';
import 'DailySeatResevations/DailySeatReservations.dart';
import 'Feedback/Feedback.dart';
import 'Home/Home.dart';
import 'Login/Login.dart';
import 'Register/Register.dart';
import 'ReserveCourse/ReserveCourse.dart';
import 'ReserveDailySeat/ReserveDailySeat.dart';
import 'ReserveHall/ReserveHall.dart';
import 'ReserveHourlySeat/ReserveHourlySeat.dart';

import 'ReserveMonthlySeat/ReserveMonthlySeat.dart';
import 'ReserveWeeklySeat/ReserveWeeklySeat.dart';
import 'TypeReserveSeat.dart';
import 'StydentReservationsInCourse/StydentReservationsInCourse.dart';
import 'ViewAnd DeleteStudentInCourse/ViewAndDeleteStudentInCourse.dart';



import 'ViewCourses/ViewCourses.dart';
import 'ViewHalls/ViewHalls.dart';
import 'ViewReservedHall/ViewReservedHalls.dart';
import 'ViewReservedSeats/ViewReservedSeats.dart';
import 'ViewUsers/ViewUsers.dart';


void main() {

  runApp(

      GetMaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: '/Register',
          getPages: [


            GetPage(name: '/Register', page:()=> Resgister()),
            GetPage(name: '/Login', page:()=> Login()),
            GetPage(name: '/Home', page:()=> Home()),
            GetPage(name: '/ReserveHourlySeat', page:()=> ReserveHourlySeat()),
            //GetPage(name: '/lll', page:()=>),
            GetPage(name: '/ReserveDailySeat', page:()=> ReserveDailySeat()),
            GetPage(name: '/ReserveWeeklySeat', page:()=> ReserveWeeklySeat()),
            GetPage(name: '/ReserveMonthlySeat', page:()=> ReserveMonthlySeat()),
           // GetPage(name: '/ReserveHall', page:()=> ReserveHall()),
            //GetPage(name: '/ReserveCourse', page:()=> ReserveCourse()),
            GetPage(name: '/ViewHalls', page:()=> ViewHalls()),
            GetPage(name: '/DailyReservations', page:()=> DailyReservations()),
            GetPage(name: '/DailySeatReservations', page:()=> DailySeatReservations()),
            GetPage(name: '/DailyHallReservations', page:()=> DailyHallReservations()),
            GetPage(name: '/TypeReserveSeat', page:()=> TypeReserveSeat()),
           // GetPage(name: '/StydentReservationsInCourse', page:()=> StydentReservationsInCourse()),
            GetPage(name: '/ViewUsers', page:()=> ViewUsers()),
            GetPage(name: '/ViewCourses', page:()=> ViewCourses()),
            GetPage(name: '/ViewReservedSeats', page:()=> ViewReservedSeats()),
           // GetPage(name: '/ViewReservedHalls', page:()=> ViewReservedHalls()),
            GetPage(name: '/AddCourse', page:()=> AddCourse()),
            GetPage(name: '/AddStudentToCourse', page:()=> AddStudentToCourse()),
           // GetPage(name: '/ViewAndDeleteStudentInCourse', page:()=>ViewAndDeleteStudentInCourse()),
            GetPage(name: '/Feedback', page:()=>Feedbacks()),

          ],
        //  builder: EasyLoading.init(),
      )

  );
}





