import 'dart:async';

import 'package:client_travel/controller/BloC.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../view/log_screen.dart';
import '../view/travels_page.dart';

BloC bloc=new BloC();
String? idToken;
DateTime? expiresIn;
String? email;


int? idNumb ;
String? name;
int? phoneNumb;
String? userdatabaseID;

bool this_user_is_login_before=false;


save_user_data({required String name, required int idNumb, required int phoneNumb,required String userdatabaseID}) async {
  // DateTime.now().add( Duration(seconds:expires! ));

  final prefs = await SharedPreferences.getInstance();
  await prefs.setString("name", name);
  await prefs.setInt("idNumb", idNumb);
  await prefs.setInt("phoneNumb", phoneNumb);
  await prefs.setString("userdatabaseID", userdatabaseID);

  print("save_user_data${name}");

}
get_user_data( ) async {
  // DateTime.now().add( Duration(seconds:expires! ));

  final prefs = await SharedPreferences.getInstance();
  name= await prefs.getString("name");
  idNumb= await prefs.getInt("idNumb");
  phoneNumb= await prefs.getInt("phoneNumb");
  userdatabaseID=await prefs.getString("userdatabaseID");
  print("name${userdatabaseID}");

}

save_login(String? Token,DateTime? expires,String? emaill ) async {
 // DateTime.now().add( Duration(seconds:expires! ));

  final prefs = await SharedPreferences.getInstance();
    await prefs.setString("idToken", Token!);
    await prefs.setString("email", emaill!);
  await prefs.setString("expiresIn",expires.toString() );

  print("expiresIn${expiresIn}");

}



check_login() async {
  print("first expiresIn${expiresIn}");

  final prefs = await SharedPreferences.getInstance();
  idToken=  await prefs.getString("idToken");
  //print("sec expiresIn${expiresIn}");

  email=  (await prefs.getString("email")) ;
//  print("troi expiresIn${expiresIn}");

  expiresIn=(await prefs.getString("expiresIn" )!=null? DateTime?.parse((await prefs.getString("expiresIn" )!)):null);
  print("end expiresIn${expiresIn}");
  print("idToken${idToken}");

}



save_user_login(bool i) async {
  final prefs = await SharedPreferences.getInstance();
  this_user_is_login_before=  await prefs.setBool('this_user_is_login_before', i);
  print("this_user_is_login_before${this_user_is_login_before}");

}

get_shared_prevrence_data() async {
  final prefs = await SharedPreferences.getInstance();
  this_user_is_login_before = prefs.getBool('this_user_is_login_before')==null?this_user_is_login_before:prefs.getBool('this_user_is_login_before')!;
  print("get_shared_prevrence_data${this_user_is_login_before}");

}