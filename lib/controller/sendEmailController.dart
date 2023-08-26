import 'dart:convert';

import 'package:http/http.dart' as http;

class SendEmailController{
  
  static Future sendEmailFunc(
      {required String name, required int id, required int phonenumb, required String tripName})async{
    http.Response response=await http.post(Uri.parse("https://api.emailjs.com/api/v1.0/email/send"),
        headers: {
      'origin':'http://localhost',
        'Content-Type' : 'application/json'
        },
    body: json.encode({
      'service_id': 'service_4oaeobg',
      'template_id': 'template_s2glzi7',
      'user_id': 'jwsycbkMMhaaBoLrF',
      'template_params': {
        'user_name': "${name}",
        'user_id':   "${id}",
        'phone_numb':"${phonenumb}",
        'trip_name': "${tripName}"
      }
    })) ;
    print("response.bodyresponse.body${response.body}");
    return response.body.toString();
  } 
  
}