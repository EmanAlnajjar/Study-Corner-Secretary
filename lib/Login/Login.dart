import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../Home/Home.dart';

import '../Register/Register.dart';
import '../constans.dart';
import 'LoginController.dart';

class Login extends StatelessWidget {
  LoginController controller = Get.put(LoginController());

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
                title: Text('Login jjjjjj',
              style: TextStyle(
                fontSize: 20.0,
                fontFamily: 'Quicksand',
                color:mycolor2),),
                elevation: 0.0,
                backgroundColor:Colors.white),

            body: SingleChildScrollView(child: Column(
                  children:  [


                    Image.asset('assets/images/login.png',
                      width: 300,
                      height: 200,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height*0.001,
                    ),
                    Text('Login',
                      style: TextStyle(fontSize: 40,color: mycolor2,fontFamily: 'Quicksand',fontStyle: FontStyle.italic),
                    ),

                    //email
                    Container(
                      margin: EdgeInsets.all(10),
                      child: TextField(

                        decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color:mycolor2),
                              borderRadius: BorderRadius.circular(45),

                            ),
                            suffixIcon: Icon(Icons.email_outlined,
                              color:mycolor2,),
                            labelText: "Email",
                            labelStyle:
                            TextStyle(fontSize: 20, color: Colors.black87,fontFamily: ' Quicksand',),
                            hintText: "Enter Your Email",
                            hintStyle:
                            TextStyle(fontSize: 15, color:mycolor2,fontFamily: ' Quicksand',)),
                        keyboardType: TextInputType.emailAddress,
                        onChanged: (value){
                          controller.email= value;

                        },


                      ),
                    ),
                    // password
                    Container(
                      margin: EdgeInsets.all(10),
                      child: TextField(
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color:mycolor2),
                              borderRadius: BorderRadius.circular(45)),
                          suffixIcon: Icon(Icons.lock,color:mycolor2,),

                          labelText: "Password",
                          labelStyle:TextStyle(fontSize: 20, color: Colors.black87,fontFamily: ' Quicksand',),

                          hintText: "Enter Your Password",
                          hintStyle:
                          TextStyle(fontSize: 20, color: Colors.black87,fontFamily: ' Quicksand',),),
                        keyboardType: TextInputType.visiblePassword,

                        onChanged: (value){
                          controller.password= value;

                        },

                      ),




                      // other elements in the Column
                    ),

                    SizedBox(
                      height: MediaQuery.of(context).size.height*0.02,
                    ),
                    InkWell(
                        onTap: ()async {

                          final email = controller.email;

                          final password = controller.password;

                          await controller.login(email, password);
                        //  Get.to(Home());


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
                            'Login',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontFamily: 'Quicksand',
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height*0.02,
                    ),
                    Text('Don\'t have an ِccount?',
                      style: TextStyle(
                          fontSize: 18.0),
                    ),
                    InkWell(
                        onTap: () {
                        Get.to(Resgister());

                        },
                        child:Text('Create an Account',
                          style: TextStyle(color: mycolor2,fontSize: 18.0),)),



                  ],

                )
            )

        )


    );
  }
}
