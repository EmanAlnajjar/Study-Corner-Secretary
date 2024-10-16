import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../Home/Home.dart';
import '../constans.dart';
import 'AddCourseController.dart';
class DatePickerController6 extends GetxController {
  Rx<DateTime> selectedDate = DateTime.now().obs;

  void updateDate(DateTime newDate) {
    selectedDate.value = newDate;
  }

}
class DatePickerController7 extends GetxController {
  Rx<DateTime> selectedendDate = DateTime.now().obs;

  void updateDate(DateTime newDate) {
    selectedendDate.value = newDate;
  }

}



class AddCourse extends StatelessWidget {
  AddCourseController controller = Get.put(AddCourseController());

  final DatePickerController6 _datePickerController6 = Get.put(DatePickerController6());
  Future<void> _selectDate(BuildContext context) async {
    DateTime initialDate = DateTime.now();
    DateTime? newDate = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime(DateTime.now().year - 1),
      lastDate: DateTime(DateTime.now().year + 1),
    );

    if (newDate != null) {
      _datePickerController6.updateDate(newDate);
    }}
  final DatePickerController7 _datePickerController7 = Get.put(DatePickerController7());
  Future<void> _selectEndDate(BuildContext context) async {
    DateTime initialDate = DateTime.now();
    DateTime? newDate = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime(DateTime.now().year - 1),
      lastDate: DateTime(DateTime.now().year + 1),
    );

    if (newDate != null) {
      _datePickerController7.updateDate(newDate);
    }}

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
            title: Text('Add Course',
          style: TextStyle(
            fontSize: 20.0,
            fontFamily: 'Quicksand',
            color: mycolor2,),),
            elevation: 0.0,
            backgroundColor:Colors.white),
          body: SingleChildScrollView(
            child: Column(
                children: [
              //    Stack(children: [
              //        CircleAvatar(
              //         radius: 60.0,
              //           backgroundImage: AssetImage('assets/images/slimme.jpg'),
              //         ),
              //         Positioned(
              //           bottom:0 ,
              //           right: 0,
              //           child: Icon(Icons.add_a_photo_rounded),)
              //
              // ],),
              //   InkWell(
              //     onTap: (){
              //       controller.image = Image.file(File(controller.selechtedimagepath.value),);
              //       Get.defaultDialog(
              //         title: 'choses sours',
              //         content: Container(
              //           height: MediaQuery.of(context).size.height*0.25,
              //           child: Column(
              //             children: [
              //               Divider(color: Colors.black,thickness: 2.0,),
              //              Container(
              //                 color: Colors.teal,
              //                 child: ListTile(
              //                   leading: Icon(Icons.image),
              //                   title: Text('Gallery'),
              //                   onTap: (){
              //                     controller.getImage(ImageSource.gallery);
              //                   },
              //                 ),
              //               ),
              //               SizedBox(
              //                 height: MediaQuery.of(context).size.height*0.01,
              //               ),
              //                Container(
              //                color: Colors.teal,
              //                child: ListTile(
              //                  leading: Icon(Icons.add_a_photo),
              //                  title: Text('camera'),
              //                  onTap: (){
              //
              //                    controller.getImage(ImageSource.camera);
              //                  },
              //                ),
              //              )
              //             ],
              //           ),
              //         ),
              //       );
              //
              //
              //     },
              //     child: Obx(() => Container(
              //       margin: EdgeInsets.all(25),
              //       height: MediaQuery.of(context).size.height*0.25,
              //       width: MediaQuery.of(context).size.width*0.5,
              //       decoration: BoxDecoration(
              //         color: Colors.grey,
              //         borderRadius: BorderRadiusDirectional.circular(20.0),
              //
              //       ),
              //       child:  Center(
              //           child:controller.selechtedimagepath.value ==''? Text('         + \n Add Image ',
              //             style: TextStyle(fontSize: 40.0),
              //           ):
              //           Image.file(File(controller.selechtedimagepath.value),)
              //
              //
              //
              //       ),
              //
              //
              //     )) )  ,


                  //name$$type
                  //name
                  //course name
                  Container(
                    margin: EdgeInsets.all(10),
                    child: TextField(
                      decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color:mycolor2),
                            borderRadius: BorderRadius.circular(45),

                          ),
                          suffixIcon:  Icon( Icons.abc,
                            color: mycolor2,
                          ),

                          labelText: "Course Name",
                          labelStyle:
                          TextStyle(fontSize: 20, color: Colors.black87,fontFamily: ' Quicksand',),
                          hintText: "Enter Course Name",
                          hintStyle:
                          TextStyle(fontSize: 15, color:mycolor2,fontFamily: ' Quicksand',)),
                      keyboardType: TextInputType.name,
                      onChanged: (value){
                        controller.couresName = value;
                      },


                    ),
                  ),
                  //hallName
                  Container(
                    margin: EdgeInsets.all(10),
                    child: TextField(
                      decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color:mycolor2),
                            borderRadius: BorderRadius.circular(45),

                          ),
                          suffixIcon:  Icon( Icons.abc,
                            color: mycolor2,
                          ),

                          labelText: "Hall Name",
                          labelStyle:
                          TextStyle(fontSize: 20, color: Colors.black87,fontFamily: ' Quicksand',),
                          hintText: "Enter Hall Name",
                          hintStyle:
                          TextStyle(fontSize: 15, color:mycolor2,fontFamily: ' Quicksand',)),
                      keyboardType: TextInputType.name,
                      onChanged: (value){
                        controller.hallName = value;
                      },


                    ),
                  ),
                  //category
                  Container(
                    margin: EdgeInsets.all(10),
                    child: TextField(
                      decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color:mycolor2),
                            borderRadius: BorderRadius.circular(45),

                          ),
                          suffixIcon:  Icon( Icons.category,
                            color: mycolor2,
                          ),

                          labelText: "Category",
                          labelStyle:
                          TextStyle(fontSize: 20, color: Colors.black87,fontFamily: ' Quicksand',),
                          hintText: "Enter Your Category",
                          hintStyle:
                          TextStyle(fontSize: 15, color:mycolor2,fontFamily: ' Quicksand',)),
                      keyboardType: TextInputType.name,
                      onChanged: (value) {
                        controller.category = value;
                      },


                    ),
                  ),
                  //teacher name
                  Container(
                    margin: EdgeInsets.all(10),
                    child: TextField(
                      decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color:mycolor2),
                            borderRadius: BorderRadius.circular(45),

                          ),
                          suffixIcon:  Icon( Icons.person,
                            color: mycolor2,
                          ),

                          labelText: "Teacher Name",
                          labelStyle:
                          TextStyle(fontSize: 20, color: Colors.black87,fontFamily: ' Quicksand',),
                          hintText: "Enter Teacher Name",
                          hintStyle:
                          TextStyle(fontSize: 15, color:mycolor2,fontFamily: ' Quicksand',)),
                      keyboardType: TextInputType.name,
                      onChanged: (value){
                        controller.teacherName = value;
                      },


                    ),
                  ),
                  //stsrt date
                  InkWell(
                    onTap: (){ _selectDate(context);},
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child:  Container(
                          width: MediaQuery.of(context).size.width,
                          height:MediaQuery.of(context).size.height*0.08,
                          decoration:BoxDecoration(
                            border: Border.all(width: 1,color: mycolor2),
                            borderRadius: BorderRadius.circular(45),
                          ),

                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child:


                            Obx(() {
                              final selectedDateFormatted =
                              DateFormat('yyyy-MM-dd').format(_datePickerController6.selectedDate.value);
                              return Text(
                                "Selected Start Date: $selectedDateFormatted",
                                style: TextStyle(
                                  fontSize: 20, color: Colors.black87,fontFamily: ' Quicksand',
                                ),
                              );
                            }),
                          )
                      ),
                    ),
                  ),
                  // end date
                  InkWell(
                    onTap: (){ _selectEndDate(context);},
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child:  Container(
                          width: MediaQuery.of(context).size.width,
                          height:MediaQuery.of(context).size.height*0.08,
                          decoration:BoxDecoration(
                            border: Border.all(width: 1,color: mycolor2),
                            borderRadius: BorderRadius.circular(45),
                          ),

                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child:


                            Obx(() {
                              final selectedDateFormatted =
                              DateFormat('yyyy-MM-dd').format(_datePickerController7.selectedendDate.value);
                              return Text(
                                "Select End Date: $selectedDateFormatted",
                                style: TextStyle(
                                  fontSize: 20, color: Colors.black87,fontFamily: ' Quicksand',
                                ),
                              );
                            }),
                          )
                      ),
                    ),
                  ),
                  // houre
                  Container(
                    margin: EdgeInsets.all(10),
                    child: TextField(
                      decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color:mycolor2),
                            borderRadius: BorderRadius.circular(45),

                          ),
                          suffixIcon:  Icon( Icons.timelapse_outlined,
                            color: mycolor2,
                          ),

                          labelText: "Houre",
                          labelStyle:
                          TextStyle(fontSize: 20, color: Colors.black87,fontFamily: ' Quicksand',),
                          hintText: "Enter How much Hours",
                          hintStyle:
                          TextStyle(fontSize: 15, color:mycolor2,fontFamily: ' Quicksand',)),
                      keyboardType: TextInputType.phone,
                      onChanged: (value){
                        int? parsedhours = int.tryParse(value); // تحويل النص إلى عدد صحيح
                        controller.houre = parsedhours ?? 0;
                      },


                    ),
                  ),
                  //start houre
                  Container(
                    margin: EdgeInsets.all(10),
                    child: TextFormField(
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color:mycolor2),
                          borderRadius: BorderRadius.circular(45),
                        ),
                        labelText: "Start Hours",
                        labelStyle:
                        TextStyle(fontSize: 20, color: Colors.black87,fontFamily: ' Quicksand',),
                        suffixIcon: InkWell(
                          onTap: () async {
                            TimeOfDay? selectedStartTime = await showTimePicker(

                              context: context,
                              initialTime: TimeOfDay.now(),


                            );
                            if (selectedStartTime != null) {
                              controller.selectStartTime(selectedStartTime);
                            }
                          },
                          child: Icon(Icons.access_time,
                            color: mycolor2,),
                        ),
                      ),
                      controller: controller.startHoureController,
                    ),
                  ),
                  //end houre

                  Container(
                    margin: EdgeInsets.all(10),
                    child: TextFormField(
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color:mycolor2),
                          borderRadius: BorderRadius.circular(45),
                        ),
                        labelText: "End Hours",
                        labelStyle:
                        TextStyle(fontSize: 20, color: Colors.black87,fontFamily: ' Quicksand',),
                        suffixIcon: InkWell(
                          onTap: () async {
                            TimeOfDay? selectedEndTime = await showTimePicker(

                              context: context,
                              initialTime: TimeOfDay.now(),


                            );
                            if (selectedEndTime != null) {
                              controller.selectEndTime(selectedEndTime);
                            }
                          },
                          child: Icon(Icons.access_time,
                            color: mycolor2,),
                        ),
                      ),
                      controller: controller.endHoureController,
                    ),
                  ),

                  //Price
                  Container(
                    margin: EdgeInsets.all(10),
                    child: TextField(
                      decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color:mycolor2),
                            borderRadius: BorderRadius.circular(45),

                          ),
                          suffixIcon:  Icon( Icons.monetization_on_outlined,
                            color: mycolor2,
                          ),

                          labelText: "Price",
                          labelStyle:
                          TextStyle(fontSize: 20, color: Colors.black87,fontFamily: ' Quicksand',),
                          hintText: "Enter Price",
                          hintStyle:
                          TextStyle(fontSize: 15, color:mycolor2,fontFamily: ' Quicksand',)),
                      keyboardType: TextInputType.phone,
                      onChanged: (value){
                        int? parsedPrice = int.tryParse(value); // تحويل النص إلى عدد صحيح
                        controller.price = parsedPrice ?? 0;
                      },

                    ),
                  ),
                  //days week
                  Text('Days of Week',
                    style: TextStyle(fontSize: 20, color: Colors.black87,fontFamily: ' Quicksand',),),
                  Container(
                    margin: EdgeInsets.all(10),
                    decoration:BoxDecoration(
                      border: Border.all(width: 1 ,color: mycolor2),
                      borderRadius: BorderRadius.circular(45),
                    ),
                    child:  Obx(()=>Column(
                        children: [
                          CheckboxListTile(
                            title: Text('Saturday'),
                            value: controller.saturday.value,
                            onChanged: (value) {
                              controller.saturday.value = value!;
                            },
                          ),
                          CheckboxListTile(
                            title: Text('Sunday'),
                            value: controller.sunday.value,
                            onChanged: (value) {
                              controller.sunday.value = value!;
                            },
                          ),
                          CheckboxListTile(
                            title: Text('Monday'),
                            value: controller.monday.value,
                            onChanged: (value) {
                              controller.monday.value = value!;
                            },
                          ),
                          CheckboxListTile(
                            title: Text('Tuesday'),
                            value: controller.tuesday.value,
                            onChanged: (value) {
                              controller.tuesday.value = value!;
                            },
                          ),
                          CheckboxListTile(
                            title: Text('wednesday'),
                            value: controller.wednesday.value,
                            onChanged: (value) {
                              controller.wednesday.value = value!;
                            },
                          ),
                          CheckboxListTile(
                            title: Text('Thursday'),
                            value: controller.thursday.value,
                            onChanged: (value) {
                              controller.thursday.value = value!;
                            },
                          ),
                          CheckboxListTile(
                            title: Text('Friday'),
                            value: controller.friday.value,
                            onChanged: (value) {
                              controller.friday.value = value!;
                            },
                          ),
                        ])),
                  ),

                  SizedBox(
                    height: MediaQuery.of(context).size.height*0.02,
                  ),
                  InkWell(
                    onTap: () async {
                      final courseName = controller.couresName;
                      final category = controller.category;
                      final teacher_name = controller.teacherName;
                      final satrtHoure = controller.startHoure;
                      final endtHoure = controller.endHoure;
                      final price = controller.price;
                      final houres = controller.houre;
                      final hallName = controller.hallName;
                      final startdate = _datePickerController6.selectedDate.value;
                      final enddate = _datePickerController7.selectedendDate.value;
                      final monday = controller.monday.value;
                      final tuesday = controller.tuesday.value;
                      final wednesday = controller.wednesday.value;
                      final thursday = controller.thursday.value;
                      final friday = controller.friday.value;
                      final saturday = controller.saturday.value;
                      final sunday = controller.sunday.value;

                      print('${courseName}');
                      print('${category}');
                      print('${teacher_name}');
                      print('${satrtHoure}');
                      print('${endtHoure}');
                      print('${price}');
                      print('${houres}');
                      print('${hallName}');
                      print('${startdate}');
                     print('${enddate}');
                      print('${monday}');
                      print('${tuesday}');
                      print('${wednesday}');
                      print('${thursday}');
                      print('${friday}');
                      print('${saturday}');
                      print('${sunday}');

                      await controller.addCourse(courseName, hallName, category, price, teacher_name,
                          houres, startdate, enddate ,satrtHoure, endtHoure,
                          monday, tuesday, wednesday, thursday, friday, saturday, sunday);

                      Get.toNamed('/Home');
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
                  SizedBox(
                    height: MediaQuery.of(context).size.height*0.02,
                  ),





                ]),),));


  }
}
