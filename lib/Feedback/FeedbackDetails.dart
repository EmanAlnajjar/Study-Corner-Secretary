
import 'package:flutter/material.dart';

import '../constans.dart';
import '../models/Feedback.dart';
import 'package:get/get.dart';
import '../userInformation.dart';
import 'FeedbackController.dart';

class FeedbacksDetails extends StatelessWidget {
 final Feedbacks myfeed;
 final int feedbackId;

 FeedbacksDetails(this.myfeed,this.feedbackId);
 FeedbacksController controller = Get.put(FeedbacksController());
 String userToken = UserInformation.userToken;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar:AppBar(
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
            title: Text('Feedback Details',
          style: TextStyle(
              fontSize: 20.0,
              fontFamily: 'Quicksand',
              color:mycolor2),),
            elevation: 0.0,
            backgroundColor:Colors.white),
        body: Column(
          children: [
          SizedBox(
            height: MediaQuery.of(context).size.height*0.01,
          ),

          Text('${myfeed.details}',
            style: TextStyle(fontSize: 20,fontFamily: 'Quicksand'),),
          SizedBox(
            height: MediaQuery.of(context).size.height*0.01,
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: TextField(
              decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color:mycolor2),
                  ),
                  suffixIcon:  Icon( Icons.replay,
                    color: mycolor2,
                  ),

                  labelText: "Write Replay",
                  labelStyle:
                  TextStyle(fontSize: 20, color: Colors.black87,fontFamily: ' Quicksand',),
                  hintText: "Write Replay",
                  hintStyle:
                  TextStyle(fontSize: 15, color:mycolor2,fontFamily: ' Quicksand',)),
              keyboardType: TextInputType.name,
              onChanged: (value){
                 controller.rseponse = value;
              },


            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height*0.01,
          ),
          InkWell(
            onTap: () async{
              final myresponse = controller.rseponse;
              print ('${myresponse}');
              print ('${feedbackId}');
              print ('${userToken}');
              await controller.sendResponse(feedbackId, userToken, myresponse);

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
                  'Send',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontFamily: 'Quicksand',
                  ),
                ),
              ),
            ),
          ),

          
        ],),
      ),
    );
  }
}
