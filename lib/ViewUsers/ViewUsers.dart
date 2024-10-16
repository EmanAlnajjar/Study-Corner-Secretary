import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constans.dart';
import '../userInformation.dart';
import 'UserDetailse.dart';
import 'ViewUsersController.dart';

class ViewUsers extends StatelessWidget {
  String userToken = UserInformation.userToken;
  ViewUsersController controller = Get.put(ViewUsersController());

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
          title: Text('View Users ',
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
            final item = controller.myuser[index];
                return  InkWell(
                  onTap: (){
                    Get.to(UserDetails(controller.myuser[index]));

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


                          Expanded(child:  Text('${controller.myuser[index].f_name} ${controller.myuser[index].l_name} ',

                            style: TextStyle(fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.italic,
                              fontFamily: 'Quicksand',
                            ),
                          )),



                          IconButton(onPressed: (){

                            controller.deleteItem(item.id, userToken);

                          }, icon: Icon(Icons.delete,))
                          // icons



                        ],
                      ),

                    ),
                  ),
                );
          },



          itemCount:controller.myuser.length,

        ),),



      )
    );
  }
}
