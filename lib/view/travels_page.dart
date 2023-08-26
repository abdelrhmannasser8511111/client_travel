import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:client_travel/controller/userController.dart';
import 'package:client_travel/view/AddNewItem.dart';
import 'package:client_travel/view/traelsDetails_page.dart';
import 'package:client_travel/view/updatePage.dart';
import 'package:client_travel/view/widgets/trips%20Card.dart';

import '../controller/glopal data repo.dart';
import '../controller/sendEmailController.dart';
import '../model/Trip_Data_model.dart';
import '../model/tripBookingStatus.dart';

class TravelPage extends StatefulWidget {
  const TravelPage({Key? key}) : super(key: key);

  @override
  State<TravelPage> createState() => _TravelPageState();
}

class _TravelPageState extends State<TravelPage> {
  @override
  void initState() {
    // TODO: implement initState
    setState(() {
      bloc.getTripStatus();
      get_user_data();
      bloc.getData_trip();
    });
  //  bloc.get_user_Id().then((value) =>setState((){Userid=value;}));



    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    print("userdatabaseID  ${userdatabaseID}");
    return Scaffold(
        body: StreamBuilder<UnmodifiableListView<TripDataModel>>(
            initialData: UnmodifiableListView<TripDataModel>([]),
            stream: bloc.TRipsStream,
            builder: (context, snapShot) {

              return StreamBuilder<UnmodifiableListView<TripBookingStatus>>(
                  initialData: UnmodifiableListView<TripBookingStatus>([]),
                  stream: bloc.trip_booking_Data_Stream,
                  builder: (context, trip_booking_Data_Stream_snapshot) {
                    print("trip_booking_Data_Stream_snapshot ${trip_booking_Data_Stream_snapshot.data}");
                    return RefreshIndicator(
                      onRefresh: () async {
                        await bloc.getData_trip();
                        print("expiresIn${expiresIn}");
                      },
                      child: ListView.builder(
                        itemBuilder: (context, count) {

                          return TipsCard(snapShot: snapShot.data![count],
                              status:
                              (trip_booking_Data_Stream_snapshot.data!
                                  .where((element)
                                  {
                                    if(element.UserId == userdatabaseID && element.TripId== snapShot.data![count].id){
                                      return true;
                                    }
                                    else{
                                      return false;
                                    }
                                  }
                             )).isEmpty==false?(trip_booking_Data_Stream_snapshot.data!
                                  .firstWhere((element)
                              {
                                if(element.UserId == userdatabaseID && element.TripId== snapShot.data![count].id){
                                  return true;
                                }
                                else{
                                  return false;
                                }
                              }
                              )).status:null

                               );



                        },
                        itemCount: snapShot.data!.length,
                      ),
                    );
                  }
              );
            }
        )

    );
  }
}
