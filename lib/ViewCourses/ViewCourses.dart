

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import 'package:get/get.dart';



import '../ReserveCourse/ReserveCourse.dart';
import '../StydentReservationsInCourse/StydentReservationsInCourse.dart';
import '../ViewAnd DeleteStudentInCourse/ViewAndDeleteStudentInCourse.dart';
import '../constans.dart';
import '../userInformation.dart';
import 'CourseDetails.dart';
import 'ViewCoursesController.dart';


class ViewCourses extends StatelessWidget {

  String userToken = UserInformation.userToken;
  ViewCoursesController controller = Get.put(ViewCoursesController());

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
          title: Text('View Courses',
        style: TextStyle(
          fontSize: 20.0,
          fontFamily: 'Quicksand',
          color: mycolor2,),),
          elevation: 0.0,
          backgroundColor: Colors.white),
      body: Column(
        children: [

          Expanded(child: Obx(() =>
              ListView.builder(
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  final item = controller.courses[index];
                  return Slidable(
                    //delete
                    endActionPane: ActionPane(motion: const ScrollMotion(),
                      key: Key('$controller.courses[index]'),
                      children: [
                        SlidableAction(onPressed: (context) {
                          controller.deleteItem(item.id, userToken);
                        },
                          backgroundColor: Colors.red,
                          icon: Icons.delete,
                        )
                      ],


                    ),
                    //update
                    startActionPane: ActionPane(motion: const ScrollMotion(),
                      key: Key('${controller.courses[index]}'),
                      children: [
                        SlidableAction(onPressed: (context) {
                          showDialog(context: context, builder: (context) =>
                              AlertDialog(
                                title: Text('Update Course', style: TextStyle(
                                  color: mycolor4,
                                  fontFamily: 'Quicksand',
                                  fontSize: 18,
                                ),),
                                content: Container(
                                  width: MediaQuery
                                      .of(context)
                                      .size
                                      .width,
                                  margin: EdgeInsets.all(10),
                                  child: Column(
                                    children: [
                                      //start houre
                                      Container(
                                        margin: EdgeInsets.all(10),
                                        child: TextFormField(
                                          decoration: InputDecoration(
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(color:mycolor2),
                                              borderRadius: BorderRadius.circular(45),
                                            ),
                                            labelText: "Start Hours",
                                            labelStyle:
                                            TextStyle(fontSize: 20, color: Colors.black87,fontFamily: ' Quicksand',),
                                            suffixIcon: InkWell(
                                              onTap: () async {
                                                TimeOfDay? selectedStartTime = await showTimePicker(

                                                  context: context,
                                                  initialTime: TimeOfDay.now(),


                                                );
                                                if (selectedStartTime != null) {
                                                  controller.selectStartTime(selectedStartTime);
                                                }
                                              },
                                              child: Icon(Icons.access_time,
                                                color: mycolor2,),
                                            ),
                                          ),
                                          controller: controller.startHoureController,
                                        ),
                                      ),
                                      //end houre

                                      Container(
                                        margin: EdgeInsets.all(10),
                                        child: TextFormField(
                                          decoration: InputDecoration(
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(color:mycolor2),
                                              borderRadius: BorderRadius.circular(45),
                                            ),
                                            labelText: "End Hours",
                                            labelStyle:
                                            TextStyle(fontSize: 20, color: Colors.black87,fontFamily: ' Quicksand',),
                                            suffixIcon: InkWell(
                                              onTap: () async {
                                                TimeOfDay? selectedEndTime = await showTimePicker(

                                                  context: context,
                                                  initialTime: TimeOfDay.now(),


                                                );
                                                if (selectedEndTime != null) {
                                                  controller.selectEndTime(selectedEndTime);
                                                }
                                              },
                                              child: Icon(Icons.access_time,
                                                color: mycolor2,),
                                            ),
                                          ),
                                          controller: controller.endHoureController,
                                        ),
                                      ),


                                    ],
                                  ),
                                ),

                                actions: [
                                  TextButton(onPressed: () {
                                    final start_hour = controller.startHoure;
                                    final end_hour = controller.endHoure;
                                    controller.updateItem(item.id, userToken, start_hour, end_hour);
                                    Navigator.pop(context);
                                  },
                                      child: Text('Update', style: TextStyle(
                                        color: mycolor4,
                                        fontFamily: 'Quicksand',
                                        fontSize: 18,
                                      ),))
                                ],

                              ));




                        },
                          backgroundColor: Colors.grey,
                          icon: Icons.edit,
                        )
                      ],


                    ),
                    child: InkWell(
                      onTap: () {

                        Get.to(CourseDetails(controller.courses[index],item.id));
                        

                      },
                      child: Padding(
                        padding: EdgeInsets.all(5.0,),

                        child: Container(
                          height: 140.0,
                          width: double.infinity,

                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: mycolor1,
                          ),
                          child: Row(
                            children: [

                              Expanded(child: Column(

                                children: [
                                  Expanded(child: Text(
                                    '${controller.courses[index].name}',

                                    style: TextStyle(fontSize: 20.0,
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FontStyle.italic,
                                      fontFamily: 'Qucksand',
                                    ),
                                  )),
                                  Expanded(child: Text(
                                    'Satrt Date:${controller.courses[index]
                                        .start_date}',

                                    style: TextStyle(fontSize: 20.0,
                                      fontFamily: 'Quichsand',

                                    ),
                                  )),
                                  Expanded(child: Text(
                                    'How much hours :${controller.courses[index]
                                        .hours}',

                                    style: TextStyle(fontSize: 20.0,
                                      fontFamily: 'Quichsand',

                                    ),
                                  )),



                                ],

                              )),


                            ],
                          ),

                        ),
                      ),
                    ),
                  );
                },
                itemCount: controller.courses.length,

              )),),

        ],
      ),


    );
  }
}





