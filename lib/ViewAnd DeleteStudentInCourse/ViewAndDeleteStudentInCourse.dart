import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:get/get.dart';


import '../Service/configService.dart';
import '../constans.dart';

import '../models/UserInCourse.dart';
import '../userInformation.dart';
import 'ViewAndDeleteStudentInCourseController.dart';
import 'package:http/http.dart'as http;

class ViewAndDeleteStudentInCourse extends StatelessWidget {
  final int courseId;
  ViewAndDeleteStudentInCourse(this.courseId);
  ViewAndDeleteStudentInCourseController controller = Get.put(ViewAndDeleteStudentInCourseController());
  String userToken = UserInformation.userToken;

  @override
  Widget build(BuildContext context) {

    print('${courseId}');
    return Scaffold(
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
                title:
    Text('View Student In Course',
        style: TextStyle(
          fontSize: 20.0,
          fontFamily: 'Quicksand',
          color: mycolor2,),),
          elevation: 0.0,
          backgroundColor:Colors.white),

        body: Container(
          child: Obx(() => ListView.builder(
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) {
              final item = controller.userInCoures[index];
              return  InkWell(
                onTap: (){
               //   Get.to(UserDetails(controller.myuser[index]));

                },
                child: Padding(
                  padding: EdgeInsets.all(5.0,),

                  child: Container(
                    height: 60.0,
                    width: double.infinity,

                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color:mycolor1,
                    ),
                    child: Row(
                      children: [

                        //detalis


                       Expanded(child:  Text('${controller.userInCoures[index].f_name} ${controller.userInCoures[index].l_name} ',

                          style: TextStyle(fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic,
                            fontFamily: 'Quicksand',
                          ),
                        )),



                        IconButton(onPressed: (){
                          print('${controller.userInCoures[index].id}');
                          print('${courseId}');
                          controller.deleteItem(controller.userInCoures[index].id,courseId, userToken);

                        }, icon: Icon(Icons.delete,))
                        // icons



                      ],
                    ),

                  ),
                ),
              );
            },



            itemCount:controller.userInCoures.length,

          ),),



        )




    );
  }


}









