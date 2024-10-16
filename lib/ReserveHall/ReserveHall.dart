import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../Home/Home.dart';
import '../ReserveHourlySeat/ReserveHourlySeat.dart';
import '../constans.dart';
import 'ReserveHallController.dart';

class DatePickerController5 extends GetxController {



  Rx<DateTime> selectedDate = DateTime.now().obs;

  void updateDate(DateTime newDate) {
    selectedDate.value = newDate;
  }

}


class ReserveHall extends StatelessWidget {


  final DatePickerController5 _datePickerController5 = Get.put(DatePickerController5());

  final int hallId;

  ReserveHall({required this.hallId});


  Future<void> _selectDate(BuildContext context) async {
    DateTime initialDate = DateTime.now();
    DateTime? newDate = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime(DateTime.now().year - 1),
      lastDate: DateTime(DateTime.now().year + 1),
    );

    if (newDate != null) {
      _datePickerController5.updateDate(newDate);
    }}

  ReserveHallController controller = Get.put(ReserveHallController());

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
                title: Text('Reserve Hall',
              style: TextStyle(
                fontSize: 20.0,
                fontFamily: 'Quicksand',
                color: mycolor2,),),
                elevation: 0.0,
                backgroundColor:Colors.white),
            body: SingleChildScrollView(
              child: Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height*0.1,),
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
                          controller.lastName = value;
                        },

                      ),
                    ),
                    //date
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
                                DateFormat('yyyy-MM-dd').format(_datePickerController5.selectedDate.value);
                                return Text(
                                  "Selected Date: $selectedDateFormatted",
                                  style: TextStyle(
                                    fontSize: 20, color: Colors.black87,fontFamily: ' Quicksand',
                                  ),
                                );
                              }),
                            )
                        ),
                      ),
                    ),
                    // Start Hour
                    Container(
                      margin: EdgeInsets.all(10),
                      child: TextFormField(
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: mycolor2),
                            borderRadius: BorderRadius.circular(45),
                          ),
                          labelText: "Start Hours",
                          labelStyle: TextStyle(
                            fontSize: 20,
                            color: Colors.black87,
                            fontFamily: 'Quicksand',
                          ),
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
                            child: Icon(
                              Icons.access_time,
                              color: mycolor2,
                            ),
                          ),
                        ),
                        // Set the value from the controller
                        controller: TextEditingController(text: controller.startHoureController.text),
                      ),
                    ),

// End Hour
                    Container(
                      margin: EdgeInsets.all(10),
                      child: TextFormField(
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: mycolor2),
                            borderRadius: BorderRadius.circular(45),
                          ),
                          labelText: "End Hours",
                          labelStyle: TextStyle(
                            fontSize: 20,
                            color: Colors.black87,
                            fontFamily: 'Quicksand',
                          ),
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
                            child: Icon(
                              Icons.access_time,
                              color: mycolor2,
                            ),
                          ),
                        ),
                        // Set the value from the controller
                        controller: TextEditingController(text: controller.endHoureController.text),
                      ),
                    ),

                    SizedBox(
                      height: MediaQuery.of(context).size.height*0.02,
                    ),
                    InkWell(
                      onTap: ()

                          async {

                        final firstName = controller.firstName;
                        final lastName = controller.lastName;
                        final startHoure = TimeOfDay(
                          hour: controller.selectedStatTime.value.hour,
                          minute: controller.selectedStatTime.value.minute,
                        );
                        final endHoure = TimeOfDay(
                          hour: controller.selectedEndTime.value.hour,
                          minute: controller.selectedEndTime.value.minute,
                        );
                        final date= _datePickerController5.selectedDate.value;


                        await controller.confirmHallReservation( firstName,lastName,date,startHoure,endHoure,hallId );
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
                            'Confirm!',
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
