import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constans.dart';
import 'AddStudentToCourseController.dart';

class AddStudentToCourse extends StatelessWidget {
  AddStudentToCourseController controller = Get.put(AddStudentToCourseController());

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
              title: Text('Add Student To Course',
            style: TextStyle(
              fontSize: 20.0,
              fontFamily: 'Quicksand',
              color: mycolor2,),),
              elevation: 0.0,
              backgroundColor:Colors.white),
        body: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height*0.1,
            ),
            //fist & last name
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
                    hintText: "Enter Your First Name",
                    hintStyle:
                    TextStyle(fontSize: 15, color:mycolor2,fontFamily: ' Quicksand',)),
                keyboardType: TextInputType.name,


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
                    suffixIcon:  Icon( Icons.phone_sharp,
                      color: mycolor2,
                    ),

                    labelText: "Phone Number",
                    labelStyle:
                    TextStyle(fontSize: 20, color: Colors.black87,fontFamily: ' Quicksand',),
                    hintText: "Enter Your Phone Number",
                    hintStyle:
                    TextStyle(fontSize: 15, color:mycolor2,fontFamily: ' Quicksand',)),
                keyboardType: TextInputType.phone,


              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.02,
            ),
            InkWell(
              onTap: () {

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
                    'Add',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontFamily: 'Quicksand',
                    ),
                  ),
                ),
              ),
            ),


        ])

        ),


    );
  }
}
