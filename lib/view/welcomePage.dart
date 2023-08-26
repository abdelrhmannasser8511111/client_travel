import 'package:flutter/material.dart';

import 'loginData.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    final screenHeight=MediaQuery.of(context).size.height;
    final screenWidth=MediaQuery.of(context).size.width;
   // final appBarHeight =appBar.preferredSize.height;
    final statusBar =MediaQuery.of(context).padding.top;
  //  final intialHight=screenHeight-appBarHeight-statusBar;
    return Scaffold(
      body: Container(
        child: Column(children: [
          Container(height: screenHeight*0.6,),
          Container(child: Text("welcome",style: TextStyle(color: Color(0xff002134),fontSize: screenWidth*0.14,fontWeight: FontWeight.bold),),),
          Container(child: Text("if you are a worlds best hotel and",style: TextStyle(color: Color(0xff002134),fontSize: screenWidth*0.05,),),),
          Container(child: Text("if you are a worlds",style: TextStyle(color: Color(0xff002134),fontSize: screenWidth*0.05),),),
SizedBox(height: screenHeight*0.1,),
          Container(
            width: screenWidth*0.9,height: screenHeight*0.07,
            child: ElevatedButton(onPressed: (){
              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_)=>LoginData()));
            },style: ElevatedButton.styleFrom( primary: Color(0xff01404f)),
            child: Text('Next',style: TextStyle(color: Colors.white,fontSize: screenWidth*0.05),),),
          )
        ],),
      ),
    );
  }
}
