import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../Home/Home.dart';
import '../constans.dart';

import 'ReserveWeeklySeatController.dart';
class DatePickerController4 extends GetxController {
  Rx<DateTime> selectedDate = DateTime.now().obs;

  void updateDate(DateTime newDate) {
    selectedDate.value = newDate;
  }

}

class ReserveWeeklySeat extends StatelessWidget {
  ReserveWeeklySeatController controller = Get.put(ReserveWeeklySeatController());
  final DatePickerController4 _datePickerController4 = Get.put(DatePickerController4());
  Future<void> _selectDate(BuildContext context) async {
    DateTime initialDate = DateTime.now();
    DateTime? newDate = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime(DateTime.now().year - 1),
      lastDate: DateTime(DateTime.now().year + 1),
    );

    if (newDate != null) {
      _datePickerController4.updateDate(newDate);
    }}

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            appBar: AppBar(title:
            Text('Reserve Monthly Seat',
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
                    Text('Price Per Week : 20.000 PS',style:  TextStyle(fontSize: 20, color: Colors.black87,fontFamily: ' Quicksand',),),
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
                            suffixIcon:  Icon( Icons.person,
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
                            suffixIcon:  Icon( Icons.person,
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
                          controller.lastName= value;
                        },


                      ),
                    ),

                    InkWell(
                        onTap: (){ _selectDate(context);},
                        child:Padding(
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
                                  DateFormat('yyyy-MM-dd').format(_datePickerController4.selectedDate.value);
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
                    SizedBox(height:MediaQuery.of(context).size.height*0.1,),

                    InkWell(
                      onTap: ()

                      async {
                        // final hallId='4';
                        // Replace with the actual user ID
                        final firstName = controller.firstName;
                        final lastName = controller.lastName;

                        final date= _datePickerController4.selectedDate.value;
                        // final formattedDateValue = DateFormat(${date}).format(date);
                        print('${firstName}');
                        print('${lastName}');
                        print('${date}');
                        // Call the confirmReservation method in the controller
                        await controller.confirmSeatWeeklyReservation( firstName,lastName,date );
                              Get.to(Home());
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
