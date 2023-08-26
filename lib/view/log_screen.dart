// import 'package:flutter/material.dart';
// import 'package:client_travel/controller/userController.dart';
// class LogScreen extends StatefulWidget {
//   const LogScreen({Key? key}) : super(key: key);
//
//   @override
//   State<LogScreen> createState() => _LogScreenState();
// }
//
// class _LogScreenState extends State<LogScreen> {
//   TextEditingController email_Controller = TextEditingController();
//   TextEditingController password_Controller = TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     final screenHeight = MediaQuery
//         .of(context)
//         .size
//         .height;
//     final screenWidth = MediaQuery
//         .of(context)
//         .size
//         .width;
//     // final appBarHeight =appBar.preferredSize.height;
//     final statusBar = MediaQuery
//         .of(context)
//         .padding
//         .top;
//     //  final intialHight=screenHeight-appBarHeight-statusBar;
//     return Scaffold(
//       body: Container(
//         width: double.infinity,height: double.infinity,
//         alignment: Alignment.center,
//         padding: EdgeInsets.only(
//             left: screenWidth * 0.05, right: screenWidth * 0.05),
//         child: SingleChildScrollView(
//           child:
//           Center(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//
//                 TextField(
//                   controller: email_Controller,
//                   keyboardType: TextInputType.emailAddress,
//                   decoration: InputDecoration(
//                       border: OutlineInputBorder(),
//                       hintText: 'Enter your email',
//                       labelText: 'Enter your email',
//                       labelStyle: TextStyle(fontSize: screenWidth * 0.04)
//
//                   ),
//                 ),
//                 SizedBox(height: screenHeight * 0.08,),
//                 TextField(
//                   controller: password_Controller,
//                   keyboardType: TextInputType.visiblePassword,
//                   decoration: InputDecoration(
//                       border: OutlineInputBorder(),
//                       hintText: 'Enter your phone password',
//                       labelText: 'Enter your phone password',
//                       labelStyle: TextStyle(fontSize: screenWidth * 0.04)
//
//                   ),
//                 ),
//                 SizedBox(height: screenHeight * 0.06,),
//                 SizedBox(height: screenHeight * 0.2,),
//
//                 Container(
//                   width: screenWidth * 0.9, height: screenHeight * 0.07,
//                   child: ElevatedButton(
//                     onPressed: () async{
//                       UserController().sign_In("${email_Controller.text}", "${password_Controller.text}",context);
//
//                     },style: ElevatedButton.styleFrom(primary: Color(0xff01404f)),
//                     child: Text('Log-in', style: TextStyle(
//                         color: Colors.white, fontSize: screenWidth * 0.05),),),
//                 )
//
//               ],
//             ),
//           ),
//
//
//         ),
//       ),
//     );
//   }
// }
