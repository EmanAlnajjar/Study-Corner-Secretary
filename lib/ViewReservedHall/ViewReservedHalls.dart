import 'package:flutter/material.dart';
import 'package:get/get.dart';



import '../constans.dart';

import '../userInformation.dart';
import 'ViewReservedHallsController.dart';


class ViewReservedHalls extends StatelessWidget {
  String userToken = UserInformation.userToken;
  ViewReservedHallsController controller = Get.put(ViewReservedHallsController());

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
                title: Text('Reserved Halls',
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
                    final item = controller.hall[index];
                    return Padding(
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

                            Expanded(child: Padding(
                              padding: EdgeInsets.all(15),
                              child:  Column(
                                crossAxisAlignment: CrossAxisAlignment.start,

                                children: [

                                  Expanded(child:  Text('Name : ${controller.hall[index].f_name} ${ controller.hall[index].l_name}',

                                    style: TextStyle(fontSize: 20.0,
                                      fontFamily: 'Quicksand',

                                    ),
                                  )),
                                  Expanded(child:  Text('Date : ${controller.hall[index].date}',

                                    style: TextStyle(fontSize: 20.0,

                                      fontFamily: 'Quicksand',
                                    ),
                                  )),
                                  Expanded(child:  Text('Time to Come : ${controller.hall[index].start_hour}',

                                    style: TextStyle(fontSize: 20.0,
                                      fontFamily: 'Quicksand',

                                    ),
                                  )),
                                  Expanded(child:  Text('Time to leave : ${controller.hall[index].end_hour}',

                                    style: TextStyle(fontSize: 20.0,
                                      fontFamily: 'Quicksand',

                                    ),
                                  )),




                                ],

                              ),


                            ),),
                            IconButton(onPressed: (){

                               controller.deleteItem(item.id, userToken);


                            },

                              icon: Icon(Icons.delete,),)



                          ],
                        ),

                      ),
                    );
                  },

                  itemCount:controller.hall.length,

                )))));
  }






}

