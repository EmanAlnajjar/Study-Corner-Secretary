import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddStudentToCourseController extends GetxController{
  Rx<DateTime> selectedDate = DateTime.now().obs;

  void selectDate(DateTime date) {
    selectedDate.value = date;
  }

  final items =['mail','femail'].obs;
  String? value = 'mail';

  DropdownMenuItem<String> bulidMenuItem(String item) =>
      DropdownMenuItem(value :item, child: Text(item,style:  TextStyle(fontSize: 20, color: Colors.black87,fontFamily: ' Quicksand',)),);




}