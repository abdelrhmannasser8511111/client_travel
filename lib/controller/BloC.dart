import 'dart:async';
import 'dart:collection';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:rxdart/rxdart.dart';

import '../model/Trip_Data_model.dart';
import '../model/tripBookingStatus.dart';
import '../model/user_data_model.dart';
import '../view/log_screen.dart';
import '../view/travels_page.dart';
import 'glopal data repo.dart';

class BloC {
  List<TripDataModel> trips = [];
  List<UserDataModel> user_Data = [];
  List<TripBookingStatus> _trip_booking_Data = [];

  final _trip_bookingStream =
      new BehaviorSubject<UnmodifiableListView<TripBookingStatus>>();

  final _TripsStream =
      new BehaviorSubject<UnmodifiableListView<TripDataModel>>();

  Stream<UnmodifiableListView<TripDataModel>> get TRipsStream =>
      _TripsStream.stream;

  Stream<UnmodifiableListView<TripBookingStatus>>
      get trip_booking_Data_Stream => _trip_bookingStream.stream;

  Future<Null> getData_trip() async {
    Response response = await http.get(Uri.parse(
            "https://trips-app-fa5b1-default-rtdb.firebaseio.com/trips_data.json"))
        as http.Response;
    if (response.statusCode == 200) {
      Map<String, dynamic> data = json.decode(response.body);
      print("vvvvvvv ${response.body}");
      bloc.trips.clear();
      data.forEach((key, value) async {
        trips.add(TripDataModel.fromJson(value, key));
      });
      _TripsStream.add(UnmodifiableListView(trips));
      getTripStatus();
    }

    // List<dynamic> cat_trip = data["1"]  ;
//   final a= data.map((k,e)=> trips.add(TripDataModel.fromJson(value))).;
    // _TripsStream.add(UnmodifiableListView(trips));
  }

  Future<Null> set_user_data(
      String name, int phoneNumb, int IDnumb, BuildContext context) async {
    //?auth=$idToken
    Response response = await http.post(
        Uri.parse(
            "https://trips-app-fa5b1-default-rtdb.firebaseio.com/user_data.json"),
        body: json.encode(
            UserDataModel(name: name, idNumb: IDnumb, phoneNumber: phoneNumb)));

    print("json.encode(user_Data)  ${response.body}");

    if (response.statusCode == 200) {
      Map<String, dynamic> data = json.decode(response.body);

      print("data[ ] ${data["name"].toString()}");
      save_user_data(
          name: name,
          idNumb: IDnumb,
          phoneNumb: phoneNumb,
          userdatabaseID: data["name"].toString());
      // save_user_login(true);
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (_) => TravelPage()));
    }
  }

  Future get_user_Id() async {
    //?auth=$idToken
    Response response = await http.get(
      Uri.parse(
          "https://trips-app-fa5b1-default-rtdb.firebaseio.com/user_data.json"),
    );

    if (response.statusCode == 200) {
      List<UserDataModel> f = [];
      Map<String, dynamic> data = json.decode(response.body);

      data.forEach((key, value) => f.add(UserDataModel.fromJson(value, key)));

      return f.firstWhere((element) {
        return element.idNumb == idNumb;
      }).DatabaseId!;
    }
  }

  Future<bool> sendTripStatus(
    String userId,
    String tripId,
  ) async {
    Response response = await http.post(
        Uri.parse(
            "https://trips-app-fa5b1-default-rtdb.firebaseio.com/trips_booking_status_data.json"),
        body: json.encode(TripBookingStatus(
          UserId: userId,
          TripId: tripId,
          status: 'تم الطلب',
        )));
    print("sendTripStatus ${response.body}");

    if (response.statusCode == 200) {
      print("sendTripStatus ${response.body}");
      getTripStatus();
      return true;
    } else
      return false;
  }

  Future<Null> getTripStatus() async {
    Response response = await http.get(Uri.parse(
        "https://trips-app-fa5b1-default-rtdb.firebaseio.com/trips_booking_status_data.json"));
    // print("response.statusCode ${response.body}");
    if (response.statusCode == 200) {
      var data = json.decode(response.body);

      _trip_booking_Data.clear();
      data.forEach((key, value) =>
          _trip_booking_Data.add(TripBookingStatus.fromJson(value, key)));
      _trip_bookingStream.add(UnmodifiableListView(_trip_booking_Data));
    }
  }

// Future<Null> updateData_trip(var id,
//     {String? name, String? summary, int? price, String? imageLink,required BuildContext context}) async {
//   if (trips.length >= 0) {
//     int i = trips.indexWhere((element) => id == element.id);
//     Response response = await http.patch(
//         Uri.parse(
//             "https://trips-app-fa5b1-default-rtdb.firebaseio.com/trips_data/$id.json?auth=$idToken"),
//         body: json.encode(TripDataModel(
//             name: name,
//             summary: summary,
//             price: price,
//             image: imageLink))) as http.Response;
//     print("update ${response.body}");
//     if (response.statusCode == 200) {
//       Map<dynamic, dynamic> data = json.decode(response.body);
//
//       print("data ${data}");
//
//       trips[i] = TripDataModel(
//           name: name,
//           price: price,
//           summary: summary,
//           image: imageLink);
//       _TripsStream.add(UnmodifiableListView(trips));
//
//       Navigator.of(context).pop();
//     }
//   }
//
// }

// Future<Null> removeData_trip(var id, BuildContext context) async {
//   int i = trips.indexWhere((element) => id == element.id);
//
//   Response response = await http.delete(
//     Uri.parse(
//         "https://trips-app-fa5b1-default-rtdb.firebaseio.com/trips_data/$id.json?auth=$idToken"),
//   ) as http.Response;
//   if (response.statusCode == 200) {
//     print("remove ${response.body}");
//
//     trips.removeAt(i);
//     _TripsStream.add(UnmodifiableListView(trips));
//
//     Navigator.of(context).pop();
//     //حل مؤقت
//     await getData_trip();
//   }
// }

//   Future<Null> newTripData(
//       {String? name,
//       String? summary,
//       int? price,
//       String? imageLink,
//       required BuildContext context}) async {
//     Response response = await http.post(
//         Uri.parse(
//             "https://trips-app-fa5b1-default-rtdb.firebaseio.com/trips_data.json?auth=$idToken"),
//         body: json.encode(TripDataModel(
//             name: name,
//             summary: summary,
//             price: price,
//             image: imageLink))) as http.Response;
//     print("update ${response.body}");
//     if (response.statusCode == 200) {
//       Map<dynamic, dynamic> data = json.decode(response.body);
//       print("dataupdate ${data}");
//       data.forEach((key, value) async {
//         print(
//             "hhhhh${TripDataModel(id: key, name: data["name"], price: data["price"], summary: data["summary"], image: data["image"])}");
//
//         trips.add(TripDataModel(
//             id: key,
//             name: name,
//             price: price,
//             summary: summary,
//             image: imageLink));
//       });
//       _TripsStream.add(UnmodifiableListView(trips));
//
//       Navigator.of(context).pop();
//     }
//
//     // _TripsStream.add(UnmodifiableListView(trips));
//
//     // List<dynamic> cat_trip = data["1"]  ;
// //   final a= data.map((k,e)=> trips.add(TripDataModel.fromJson(value))).;
//     // _TripsStream.add(UnmodifiableListView(trips));
//   }
}
