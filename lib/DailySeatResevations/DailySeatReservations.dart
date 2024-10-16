import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';

import '../constans.dart';
import '../userInformation.dart';
import 'DailySeatReservationsController.dart';


class DailySeatReservations extends StatelessWidget {
  String userToken = UserInformation.userToken;
  DailyReservationsController controller = Get.put(DailyReservationsController());

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
        snackBarTheme: SnackBarThemeData(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(20),
            ),
          ) ,
        backgroundColor: Colors.white,
        contentTextStyle: TextStyle(
        color: mycolor2,
        fontSize: 16.0,

    ),
    ),
        ),
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
          title: Text('Daily Seat Reservations',
      style: TextStyle(
        fontSize: 20.0,
        fontFamily: 'Quicksand',
        color: mycolor2,),),
    elevation: 0.0,
    backgroundColor:Colors.white),

        body:Container(
            child: Obx(() => ListView.builder(
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                final item = controller.dailySeat[index];
                return  Slidable(
                  endActionPane: ActionPane(motion: const ScrollMotion(),
                    key:Key('${controller.dailySeat[index]}'),
                    children: [
                      SlidableAction(onPressed:(context) {

                        controller.deleteItem(item.id, userToken);

                      },
                        backgroundColor: Colors.red,
                        icon: Icons.delete,
                      )
                    ],


                  ),


                  child: Padding(
                    padding: EdgeInsets.all(5.0,),

                    child: Container(
                      height: MediaQuery.of(context).size.height*0.2,
                      width: double.infinity,

                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color:mycolor1,
                      ),
                      child: Row(
                        children: [

                          //detalis

                          Padding(
                            padding: EdgeInsets.all(15),
                            child:  Column(
                              crossAxisAlignment: CrossAxisAlignment.start,

                              children: [
                                Expanded(child:  Text('Name : ${controller.dailySeat[index].f_name} ${controller.dailySeat[index].l_name}',

                                  style: TextStyle(fontSize: 20.0,

                                    fontFamily: 'Quicksand',
                                  ),
                                )),
                                Expanded(child:  Text('Time to Come : ${controller.dailySeat[index].start_hour}',

                                  style: TextStyle(fontSize: 20.0,

                                    fontFamily: 'Quicksand',
                                  ),
                                )),
                                Expanded(child:  Text('Time to Leave: ${controller.dailySeat[index].end_hour}',

                                  style: TextStyle(fontSize: 20.0,
                                    fontFamily: 'Quicksand',

                                  ),
                                )),
                                SizedBox(
                                  height: MediaQuery.of(context).size.height*0.02,
                                ),
                                Expanded(child: Row(children: [
                                  InkWell(
                                    onTap: () {
                                         controller.chickInSeat(item.id, userToken);

                                    },
                                    child: Container(
                                      width:MediaQuery.of(context).size.width*0.3,
                                      height:MediaQuery.of(context).size.height*0.05,
                                      decoration: BoxDecoration(
                                        border:Border.all(width: 2,color: mycolor4),
                                        borderRadius: BorderRadius.circular(25),
                                        color: Colors.white,
                                      ),
                                      child: Center(
                                        child: Text(
                                          'check in',
                                          style: TextStyle(
                                            color: mycolor4,
                                            fontSize: 18,
                                            fontFamily: 'Quicksand',
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width*0.1,
                                  ),
                                  InkWell(

                                            onTap: () async {
                                            String responseMessage = await controller.chickOutSeat(item.id, userToken);

                                            ScaffoldMessenger.of(context).showSnackBar(
                                            SnackBar(
                                            content: Text(responseMessage), // استخدام قيمة الرسالة هنا
                                            duration: Duration(seconds: 5),
                                            )
                                            );
                                            },
                                    child: Container(
                                      width:MediaQuery.of(context).size.width*0.3,
                                      height:MediaQuery.of(context).size.height*0.05,
                                      decoration: BoxDecoration(
                                        border: Border.all(width: 2, color:mycolor4),
                                        borderRadius: BorderRadius.circular(25),
                                        color: Colors.white,
                                      ),
                                      child: Center(
                                        child: Text(
                                          'check out',
                                          style: TextStyle(
                                            color: mycolor4,
                                            fontFamily: 'Quicksand',
                                            fontSize: 18,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),

                                ],))




                              ],

                            ),



                          ),
                          SizedBox(width: 10.0,),
                          // Obx(() => Checkbox(value: controller.dailySeatReserve[index].isSelected.value,
                          //     onChanged: (value){
                          //       controller.dailySeatReserve[index].isSelected (!controller.dailySeatReserve[index].isSelected.value) ;
                          //    //  if(controller.dailyReserve[index].isSelected.value == true){}
                          //
                          //
                          //     }
                          //
                          // )),




                        ],
                      ),

                    ),
                  ),);
              },

              itemCount:controller.dailySeat.length,



            )
        ),),



          



    ));
  }
}
