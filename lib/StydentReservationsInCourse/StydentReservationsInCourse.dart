import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constans.dart';
import 'StydentReservationsInCourseController.dart';

class StydentReservationsInCourse extends StatelessWidget {

  StydentReservationsInCourseController controller = Get.put(StydentReservationsInCourseController());
final int sss;
  StydentReservationsInCourse(this.sss);
  @override
  Widget build(BuildContext context) {

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
          title: Text('Student Reservations In Course ',
        style: TextStyle(
          fontSize: 20.0,
          fontFamily: 'Quicksand',
          color: mycolor2,),),
          elevation: 0.0,
          backgroundColor:Colors.white),

      body: Container(
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) =>  Padding(
                padding: EdgeInsets.all(5.0,),

                child: Container(
                  height: 200.0,
                  width: double.infinity,

                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color:mycolor1,
                  ),
                  child: Row(
                      children: [

                         Expanded(child: Text('${controller.userReserveInCoures[index].f_name} ${controller.userReserveInCoures[index].l_name} ',

                           style: TextStyle(fontSize: 30.0,

                             fontFamily: 'Quicksand',
                           ),
                         )),





                        // Obx(() =>  Checkbox(value: controller.userReserveInCoures[index].isSelected.value,
                        //     onChanged: (value){
                        //       controller.userReserveInCoures[index].isSelected (!controller.reservartiosInCourse[index].isSelected.value) ;
                        //       //  if(controller.dailyReserve[index].isSelected.value == true){}
                        //
                        //
                        //     }
                        //
                        // ),
                        //    ),



                      ]),





                ),

              ),

          itemCount:controller.userReserveInCoures.length,


        ),

      ),




    );
  }
}
