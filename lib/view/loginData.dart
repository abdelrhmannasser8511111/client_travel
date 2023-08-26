import 'package:flutter/material.dart';
import 'package:client_travel/view/travels_page.dart';

import '../controller/glopal data repo.dart';
import '../model/user_data_model.dart';

class LoginData extends StatefulWidget {
  const LoginData({Key? key}) : super(key: key);

  @override
  State<LoginData> createState() => _LoginDataState();
}

class _LoginDataState extends State<LoginData> {
  TextEditingController name_Controller = TextEditingController();
  TextEditingController ID_Controller = TextEditingController();
  TextEditingController phoneNumb_Controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery
        .of(context)
        .size
        .height;
    final screenWidth = MediaQuery
        .of(context)
        .size
        .width;
    // final appBarHeight =appBar.preferredSize.height;
    final statusBar = MediaQuery
        .of(context)
        .padding
        .top;
    //  final intialHight=screenHeight-appBarHeight-statusBar;
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(
            left: screenWidth * 0.05, right: screenWidth * 0.05),
        child: SingleChildScrollView(
          child:
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: screenHeight * 0.08,),
              Container(child: Text("welcome", style: TextStyle(
                  color: Color(0xff002134),
                  fontSize: screenWidth * 0.1,
                  fontWeight: FontWeight.bold),),),
              Container(child: Text("if you are a worlds best hotel and",
                style: TextStyle(
                  color: Color(0xff002134), fontSize: screenWidth * 0.04,),),),
              SizedBox(height: screenHeight * 0.06,),
              TextField(
                controller: name_Controller,
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter your name',
                    labelText: 'Enter your name',
                    labelStyle: TextStyle(fontSize: screenWidth * 0.04)

                ),
              ),
              SizedBox(height: screenHeight * 0.06,),
              TextField(
                controller: phoneNumb_Controller,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter your phone Number',
                    labelText: 'Enter your phone Number',
                    labelStyle: TextStyle(fontSize: screenWidth * 0.04)

                ),
              ),
              SizedBox(height: screenHeight * 0.06,),
              TextField(
                controller: ID_Controller,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter ID Number',
                    labelText: 'Enter ID Number',
                    labelStyle: TextStyle(fontSize: screenWidth * 0.04)

                ),
              ),
              SizedBox(height: screenHeight * 0.2,),

              Container(
                width: screenWidth * 0.9, height: screenHeight * 0.07,
                child: ElevatedButton(
                  onPressed: () async{
                    bloc.set_user_data(name_Controller.text,
                        int.parse(phoneNumb_Controller.text), int.parse(ID_Controller.text),context);


                  },style: ElevatedButton.styleFrom(primary: Color(0xff01404f) ),
                  child: Text('Next', style: TextStyle(
                      color: Colors.white, fontSize: screenWidth * 0.05),),),
              )

            ],
          ),


        ),
      ),
    );
  }
}
