

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../ReserveHall/ReserveHall.dart';
import '../constans.dart';
import '../models/AllHall.dart';
import 'ViewHallsController.dart';

class ViewHalls extends StatelessWidget {
  String getBoardeAndTable(AllHall allmyhall) {
   String table ;
   String boarde;

    if (allmyhall.has_meeting_table == 1) {
      table = 'Yse';
    }else{
      table = 'No';

    };
   if (allmyhall.has_board == 1) {
     boarde = 'Yse';
   }else{
     boarde = 'No';

   };
    return table;
   return boarde;
  }

  AllHall allHall = AllHall();



  ViewHallsController controller = Get.put(ViewHallsController());

  @override
  Widget build(BuildContext context) => DefaultTabController(
    length: 2,
    child: Scaffold
      ( appBar: AppBar(
      backgroundColor: Colors.white,
        //shadowColor: Colors.white,
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
        title: Text('View Halls',
          style:TextStyle(color: mycolor2 ,
            fontSize: 25.0,
            fontFamily: 'Quicksand'
          ) ,),
        elevation: 0.0,
      ),
        body:Container(

            child: Obx(() => ListView.builder(
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {

                return InkWell(
                  onTap: (){
                    Get.to(ReserveHall(hallId: controller.myallhall[index].id));

                  },
                  child:Padding(
                    padding: EdgeInsets.all(5.0,),

                    child: Container(
                      height: MediaQuery.of(context).size.height*0.2,
                      width: double.infinity,

                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color:mycolor1,
                      ),
                      child: Expanded(child: Padding(
                        padding: EdgeInsets.all(15),
                        child:  Column(
                          crossAxisAlignment: CrossAxisAlignment.start,

                          children: [

                            Expanded(child:  Text('Name : ${controller.myallhall[index].name} ',

                              style: TextStyle(fontSize: 20.0,
                                fontFamily: 'Quicksand',

                              ),
                            )),
                            Expanded(child:  Text('Seat Nummber : ${controller.myallhall[index].seats_number}',

                              style: TextStyle(fontSize: 20.0,

                                fontFamily: 'Quicksand',
                              ),
                            )),
                            Expanded(child:  Text('Price per Houre: ${controller.myallhall[index].price_hour_hall}',

                              style: TextStyle(fontSize: 20.0,
                                fontFamily: 'Quicksand',

                              ),
                            )),
                            Expanded(child:  Text('Has a Meeting Table : ${getBoardeAndTable(allHall)}',

                              style: TextStyle(fontSize: 20.0,
                                fontFamily: 'Quicksand',

                              ),
                            )),
                            Expanded(child:  Text('Has a Board : ${getBoardeAndTable(allHall)}',

                              style: TextStyle(fontSize: 20.0,
                                fontFamily: 'Quicksand',

                              ),
                            )),




                          ],

                        ),


                      ),),




                    ),
                  ) ,
                );
              },

              itemCount:controller.myallhall.length,

            )))));

}
