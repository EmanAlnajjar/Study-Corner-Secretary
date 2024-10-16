import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../constans.dart';
import '../userInformation.dart';
import 'ReserveCourseController.dart';

class ReserveCourse extends StatelessWidget {
  String userToken = UserInformation.userToken;
  ReserveCourseController controller = Get.put(ReserveCourseController());
  final int sss;
  ReserveCourse(this.sss);

  @override
  Widget build(BuildContext context) {
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
                title: Text('Reserve Course',
              style: TextStyle(
                fontSize: 20.0,
                fontFamily: 'Quicksand',
                color: mycolor2,),),
                elevation: 0.0,
                backgroundColor:Colors.white),
            body: SingleChildScrollView(
              child: Column(
                  children: [
                  Image.asset('assets/images/adduser.png',
                   height: 250,
                    width: 250,
                  ),
                    //fistr & last name
                    Container(
                      margin: EdgeInsets.all(10),
                      child: TextField(
                        decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color:mycolor2),
                              borderRadius: BorderRadius.circular(45),

                            ),
                            suffixIcon:  Icon( Icons.add_reaction_outlined,
                              color: mycolor2,
                            ),

                            labelText: "First Name",
                            labelStyle:
                            TextStyle(fontSize: 20, color: Colors.black87,fontFamily: ' Quicksand',),
                            hintText: "Enter Your First",
                            hintStyle:
                            TextStyle(fontSize: 15, color:mycolor2,fontFamily: ' Quicksand',)),
                        keyboardType: TextInputType.name,
                        onChanged: (value){
                             controller.firstName = value;
                        },


                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(10),
                      child: TextField(
                        decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color:mycolor2),
                              borderRadius: BorderRadius.circular(45),

                            ),
                            suffixIcon:  Icon( Icons.add_reaction_outlined,
                              color: mycolor2,
                            ),

                            labelText: "Last Name",
                            labelStyle:
                            TextStyle(fontSize: 20, color: Colors.black87,fontFamily: ' Quicksand',),
                            hintText: "Enter Your Last Name",
                            hintStyle:
                            TextStyle(fontSize: 15, color:mycolor2,fontFamily: ' Quicksand',)),
                        keyboardType: TextInputType.name,
                        onChanged: (value){
                          controller.lasttName= value;

                        },


                      ),
                    ),


                    // is payment
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                    Padding(padding: EdgeInsets.all(10.0),child: Text('The Payment was made ',style: TextStyle(fontSize: 20, color: Colors.black87,fontFamily: ' Quicksand',),),
                    ),
                      Obx(() => Checkbox(value: controller.checkBoxState.value,
                          onChanged: (value){
                            controller.ChangeBoxState();
                            print('${controller.checkBoxState.value}');
                          }

                      ))
                    ],),


                    SizedBox(
                      height: MediaQuery.of(context).size.height*0.02,
                    ),
                    InkWell(
                      onTap: () async {
                        final firstName = controller.firstName;
                        final lastName = controller.lasttName;
                        final is_paid = controller.checkBoxState.value;



                        await controller.addStudentTocourse(sss, userToken, firstName, lastName, is_paid);


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
                            'Reserve a Course',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontFamily: 'Quicksand',
                            ),
                          ),
                        ),
                      ),
                    ),







                  ]),
            )
        )
    );
  }
}
