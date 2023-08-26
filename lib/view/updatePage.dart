// import 'dart:collection';
//
// import 'package:flutter/material.dart';
//
// import '../controller/glopal data repo.dart';
// import '../model/Trip_Data_model.dart';
//
// class UpdatePage extends StatefulWidget {
//   UpdatePage(
//       {required this.snapShot,
//       required this.count,
//       });
//
//   AsyncSnapshot<UnmodifiableListView<TripDataModel>> snapShot;
//   int count;
//
//   @override
//   State<UpdatePage> createState() => _UpdatePageState();
// }
//
// class _UpdatePageState extends State<UpdatePage> {
//   @override
//   void initState() {
//     name_Controller = new TextEditingController(
//         text: "${widget.snapShot.data![widget.count].name!}");
//     summary_Controller = new TextEditingController(
//         text: "${widget.snapShot.data![widget.count].summary!}");
//     imageLink_Controller = new TextEditingController(
//         text: "${widget.snapShot.data![widget.count].image!}");
//     price_Controller = new TextEditingController(
//         text: "${widget.snapShot.data![widget.count].price!}");
//     super.initState();
//   }
//
//   TextEditingController? name_Controller;
//   TextEditingController? summary_Controller;
//   TextEditingController? imageLink_Controller;
//
//   TextEditingController? price_Controller;
//
//   @override
//   Widget build(BuildContext context) {
//     final screenHeight = MediaQuery.of(context).size.height;
//     final screenWidth = MediaQuery.of(context).size.width;
//     // final appBarHeight =appBar.preferredSize.height;
//     final statusBar = MediaQuery.of(context).padding.top;
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Color(0xff01404f),
//       ),
//       body: Container(
//         // padding: EdgeInsets.only(
//         //     left: screenWidth * 0.05, right: screenWidth * 0.05),
//         child: SingleChildScrollView(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               // SizedBox(height: screenHeight * 0.08,),
//               // Container(child: Text("welcome", style: TextStyle(
//               //     color: Color(0xff002134),
//               //     fontSize: screenWidth * 0.1,
//               //     fontWeight: FontWeight.bold),),),
//               // Container(child: Text("if you are a worlds best hotel and",
//               //   style: TextStyle(
//               //     color: Color(0xff002134), fontSize: screenWidth * 0.04,),),),
//               SizedBox(
//                 height: screenHeight * 0.06,
//               ),
//
//               Container(
//                 margin: EdgeInsets.only(
//                     left: screenWidth * 0.05, right: screenWidth * 0.05),
//                 child: TextField(
//                   controller: name_Controller,
//                   keyboardType: TextInputType.name,
//                   decoration: InputDecoration(
//                       border: OutlineInputBorder(),
//                       hintText: 'Enter new name',
//                       labelText: 'Enter new name',
//                       // helperText: "djhjkhdsk",
//
//                       labelStyle: TextStyle(fontSize: screenWidth * 0.04)),
//                 ),
//               ),
//
//               SizedBox(
//                 height: screenHeight * 0.06,
//               ),
//
//               Container(
//                 margin: EdgeInsets.only(
//                     left: screenWidth * 0.05, right: screenWidth * 0.05),
//                 child: TextField(
//                   controller: summary_Controller,
//                   maxLines: 6,
//                   onChanged: (t) {},
//                   keyboardType: TextInputType.phone,
//                   decoration: InputDecoration(
//                       border: OutlineInputBorder(),
//                       //hintText: 'Enter new summary Number',
//                       labelText: 'Enter new summary Number',
//                       labelStyle: TextStyle(fontSize: screenWidth * 0.04)),
//                 ),
//               ),
//               SizedBox(
//                 height: screenHeight * 0.06,
//               ),
//
//               Container(
//                 margin: EdgeInsets.only(
//                     left: screenWidth * 0.05, right: screenWidth * 0.05),
//                 child: TextField(
//                   controller: imageLink_Controller,
//                   keyboardType: TextInputType.number,
//                   decoration: InputDecoration(
//                       border: OutlineInputBorder(),
//                       hintText: 'Enter new Image Link',
//                       labelText: 'Enter new Image Link',
//                       labelStyle: TextStyle(fontSize: screenWidth * 0.04)),
//                 ),
//               ),
//               SizedBox(
//                 height: screenHeight * 0.06,
//               ),
//               Container(
//                 margin: EdgeInsets.only(
//                     left: screenWidth * 0.05, right: screenWidth * 0.05),
//                 child: TextField(
//                   controller: price_Controller,
//                   keyboardType: TextInputType.number,
//                   decoration: InputDecoration(
//                       border: OutlineInputBorder(),
//                       hintText: 'Enter new price',
//                       labelText: 'Enter new price',
//                       labelStyle: TextStyle(fontSize: screenWidth * 0.04)),
//                 ),
//               ),
//               SizedBox(
//                 height: screenHeight * 0.05,
//               ),
//
//               Container(
//                 width: screenWidth * 0.9,
//                 height: screenHeight * 0.07,
//                 child: RaisedButton(
//                   onPressed: () async {
//                    bloc.updateData_trip(widget.snapShot.data![widget.count].id,
//                         name: "${name_Controller!.text}",
//                         summary: "${summary_Controller!.text}",
//                         imageLink: "${imageLink_Controller!.text}",
//                         price: int.parse(price_Controller!.text), context: context);
//                   },
//                   color: Color(0xff01404f),
//                   child: Text(
//                     'Update Data',
//                     style: TextStyle(
//                         color: Colors.white, fontSize: screenWidth * 0.05),
//                   ),
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
