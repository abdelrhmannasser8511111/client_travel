import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:client_travel/model/Trip_Data_model.dart';

import '../traelsDetails_page.dart';
class TipsCard extends StatefulWidget {
   TipsCard({
    required this.snapShot, this.status
   });
   TripDataModel snapShot;
   String? status;
  @override
  State<TipsCard> createState() => _TipsCardState();
}

class _TipsCardState extends State<TipsCard> {

  @override

  Widget build(BuildContext context) {
    Color color=widget.status=="تم الطلب"?Colors.orangeAccent:widget.status=="تم التأكيد"?Colors.green:Color(0xff01404f);

    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    // final appBarHeight =appBar.preferredSize.height;
    final statusBar = MediaQuery.of(context).padding.top;
    //  final intialHight=screenHeight-appBarHeight-statusBar;
    return Container(
        height: screenHeight * 0.35,
        width: double.infinity,
        child: Card(
          child: Column(
            children: [
              Container(
                height: screenHeight * 0.25,
                width: double.infinity,
                child: Row(
                  children: [
                    Image.network(
                      "${widget.snapShot.image}",
                      fit: BoxFit.cover,
                      height: screenHeight * 0.25,
                      width: screenWidth * 0.58,
                    ),
                    Container(
                        height: screenHeight * 0.25,
                        width: screenWidth * 0.4,
                        child: Column(
                          children: [
                            ListTile(
                              title: Text(
                                "${widget.snapShot.name}",
                                style: TextStyle(
                                    color: Color(0xff002134),
                                    fontSize: screenWidth * 0.05,
                                    fontWeight: FontWeight.bold),
                              ),
                              subtitle: Text(
                                "${widget.snapShot.summary}",
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: Color(0xff002134),
                                  fontSize: screenWidth * 0.02,
                                ),
                              ),
                            ),

                            Container(
                              padding: EdgeInsets.only(top: screenHeight*0.03),
                              alignment: Alignment.center,
                              child: Text(
                                "\$${widget.snapShot.price}",textAlign: TextAlign.start,
                                style: TextStyle(
                                    color: Color(0xff002134),
                                    fontSize: screenWidth * 0.06,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),

                          ],
                        )),

                  ],
                ),
              ),
              Container(
                width: double.infinity,height: screenHeight*0.084,
                child: ElevatedButton(onPressed: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (_)=>TravelDetails(snapShot: widget.snapShot,status: widget.status,)));
                },style: ElevatedButton.styleFrom(primary: color),
                  child: Text(widget.status=="تم الطلب"?"سبتم التواصل معك لتأكيد الحجز":widget.status=="تم التأكيد"?"تم التأكيد":'request this trip',style: TextStyle(color: Colors.white,fontSize: screenWidth*0.05),),),
              )

              // Container(height:  screenHeight * 0.08,
              //   child: Row(
              //
              //   children: [
              //     Container(
              //
              //     width: screenWidth*0.28
              //       ,   child:Row(children: [
              //         Icon(Icons.attach_money),Text("50",style: TextStyle( fontSize: screenWidth*0.05),)
              //     ],)
              //       ,)
              //   ],
              // ),
              //
              // )
            ],
          ),
        ));
  }
}
