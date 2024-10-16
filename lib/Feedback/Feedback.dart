import 'package:flutter/material.dart';

import 'package:untitled5/DailyHallReservations/DailyHallReservationsService.dart';
import 'package:untitled5/Feedback/FeedbackDetails.dart';


import '../constans.dart';
import 'package:get/get.dart';
import 'FeedbackController.dart';

class Feedbacks extends StatelessWidget {
  FeedbacksController controller = Get.put(FeedbacksController());

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
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
          title: Text('Feedback',
      style: TextStyle(
          fontSize: 20.0,
          fontFamily: 'Quicksand',
          color:mycolor2),),
          elevation: 0.0,
          backgroundColor:Colors.white),

          body: Obx(() =>  ListView.builder(
                scrollDirection: Axis.vertical,

                itemBuilder: (context, index){
                  final item = controller.feed[index];
                  return  InkWell(
                    onTap: (){
                      Get.to(FeedbacksDetails(controller.feed[index],item.id));


                    },
                    child: Padding(
                      padding: EdgeInsets.all(10.0,),

                      child: Container(

                          height:MediaQuery.of(context).size.height*0.1,
                          width: double.infinity,

                          decoration: BoxDecoration(
                            border: Border.all(width: 1, color:mycolor1),
                            borderRadius: BorderRadius.circular(10.0),
                            color:Colors.white,
                          ),
                          child:  Text('${controller.feed[index].details}',

                            style: TextStyle(fontSize: 20.0,
                              fontFamily: 'Quicksand',

                            ),
                          )
                      ),));

                },

                itemCount:controller.feed.length,

              )),


    )
    );
  }
}
