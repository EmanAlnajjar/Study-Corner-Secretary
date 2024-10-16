import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';



import '../Home/Home.dart';
import '../Login/Login.dart';
import '../ViewCourses/ViewCourses.dart';
import '../constans.dart';
import '../constans.dart';
import '../constans.dart';
import 'RegisterController.dart';


class Resgister extends StatelessWidget {

  RegisterController controller = Get.put(RegisterController());


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
                title: Text('Create Account',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontFamily: 'Quicksand',
                    color: mycolor2,),),
                elevation: 0.0,
                backgroundColor: Colors.white),

            body: Center(


                child: SingleChildScrollView(child: Column(
                  children: [


                    Container(

                      child: Image.asset('assets/images/register.png',
                        width: 300,
                        height: 200,
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery
                          .of(context)
                          .size
                          .height * 0.001,
                    ),

                    Text('Create an Account',
                      style: TextStyle(fontSize: 40,
                          color: mycolor2,
                          fontFamily: 'Quicksand',
                          fontStyle: FontStyle.italic),
                    ),
                    Container(
                      margin: EdgeInsets.all(10),
                      child: TextField(
                        decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: mycolor2),
                              borderRadius: BorderRadius.circular(45),

                            ),
                            suffixIcon: Icon(Icons.person,
                              color: mycolor2,
                            ),

                            labelText: "First Name",
                            labelStyle:
                            TextStyle(fontSize: 20,
                              color: Colors.black87,
                              fontFamily: ' Quicksand',),
                            hintText: "Enter Your First",
                            hintStyle:
                            TextStyle(fontSize: 15,
                              color: mycolor2,
                              fontFamily: ' Quicksand',)),
                        keyboardType: TextInputType.name,
                        onChanged: (value) {
                          controller.firstName = value;
                        },


                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(10),
                      child: TextField(
                        decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: mycolor2),
                              borderRadius: BorderRadius.circular(45),

                            ),
                            suffixIcon: Icon(Icons.person,
                              color: mycolor2,
                            ),

                            labelText: "Last Name",
                            labelStyle:
                            TextStyle(fontSize: 20,
                              color: Colors.black87,
                              fontFamily: ' Quicksand',),
                            hintText: "Enter Your Last Name",
                            hintStyle:
                            TextStyle(fontSize: 15,
                              color: mycolor2,
                              fontFamily: ' Quicksand',)),
                        keyboardType: TextInputType.name,
                        onChanged: (value) {
                          controller.lastName = value;
                        },


                      ),
                    ),
                    //phone
                    Container(
                      margin: EdgeInsets.all(10),
                      child: TextField(

                        decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: mycolor2),
                              borderRadius: BorderRadius.circular(45),

                            ),
                            suffixIcon: Icon(Icons.phone,
                              color: mycolor2,),
                            labelText: "Phone",
                            labelStyle:
                            TextStyle(fontSize: 20,
                              color: Colors.black87,
                              fontFamily: ' Quicksand',),
                            hintText: "Enter Your Phone Number",
                            hintStyle:
                            TextStyle(fontSize: 15,
                              color: mycolor2,
                              fontFamily: ' Quicksand',)),
                        keyboardType: TextInputType.phone,
                        onChanged: (value) {
                          int? parsedPhone = int.tryParse(value);
                          if (parsedPhone != null) {
                            controller.phone = parsedPhone;
                          }
                        },


                      ),
                    ),
                    //email
                    Container(
                      margin: EdgeInsets.all(10),
                      child: TextField(

                        decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: mycolor2),
                              borderRadius: BorderRadius.circular(45),

                            ),
                            suffixIcon: Icon(Icons.email_outlined,
                              color: mycolor2,),
                            labelText: "Email",
                            labelStyle:
                            TextStyle(fontSize: 20,
                              color: Colors.black87,
                              fontFamily: ' Quicksand',),
                            hintText: "Enter Your Email",
                            hintStyle:
                            TextStyle(fontSize: 15,
                              color: mycolor2,
                              fontFamily: ' Quicksand',)),
                        keyboardType: TextInputType.emailAddress,
                        onChanged: (value) {
                          controller.email = value;
                        },


                      ),
                    ),
                    //first&last

                    //birthday

                    // password
                    Container(
                      margin: EdgeInsets.all(10),
                      child: TextField(
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: mycolor2),
                              borderRadius: BorderRadius.circular(45)),
                          suffixIcon: Icon(Icons.lock, color: mycolor2,),

                          labelText: "Password",
                          labelStyle: TextStyle(fontSize: 20,
                            color: Colors.black87,
                            fontFamily: ' Quicksand',),

                          hintText: "Enter Your Password",
                          hintStyle:
                          TextStyle(fontSize: 20,
                            color: Colors.black87,
                            fontFamily: ' Quicksand',),),
                        keyboardType: TextInputType.visiblePassword,

                        onChanged: (value) {
                          controller.password = value;
                        },

                      ),

                    ),


                    InkWell(
                      onTap: () async {
                        final firstName = controller.firstName;
                        final lastName = controller.lastName;
                        final email = controller.email;
                        final phone = controller.phone;
                        final password = controller.password;

                        print(phone);

                        await controller.register(
                            email, firstName, lastName, phone, password);
                        //Get.to(Login());


                      },
                      child: Container(
                        width: MediaQuery
                            .of(context)
                            .size
                            .width * 0.5,
                        height: MediaQuery
                            .of(context)
                            .size
                            .height * 0.05,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: mycolor2,
                        ),
                        child: Center(
                          child: Text(
                            'Create an account',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery
                          .of(context)
                          .size
                          .height * 0.01,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,

                      children: [
                        Text('Are you have an Account?',
                          style: TextStyle(fontSize: 18.0),),
                        InkWell(
                            onTap: () {
                              Get.to(Login());
                            },
                            child: Text('Login',
                              style: TextStyle(
                                  color: mycolor2,
                                  fontSize: 18.0),))
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery
                          .of(context)
                          .size
                          .height * 0.01,
                    ),


                  ],
                ),
                )
            )

        )


    );
  }

}