import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server/gmail.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../view/log_screen.dart';
import '../view/loginData.dart';
import '../view/travels_page.dart';
import 'glopal data repo.dart';

class UserController {
//   Future<Null> sign_up(String email, String password,BuildContext context) async{
//
//     http.Response response = await http.post(
//         Uri.parse(
//             "https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=AIzaSyCiz-a-kBqfFxdOd6lnp7HqzWD22hUQJBU"),
//         body: {
//          // "idToken" :idToken,
//           "email":email,
//           "password":password,
//           "returnSecureToken":"true"
//         });
// print("response signUP ${response.body}");
//     if(response.statusCode==200){
//
//       Map<String,dynamic> data=json.decode(response.body);
//       idToken=data["idToken"];
//       expiresIn = DateTime.now().add( Duration(seconds:int.parse(data["expiresIn"]) )) ;
//       email=data["email"];
//       Navigator.of(context).pushReplacement(
//           MaterialPageRoute(builder: (_) => LoginData()));
//       save_login(idToken,expiresIn,email);
//     }
//   }

  // Future<Null>  sign_In(String email, String password,BuildContext context) async{
  //
  //   http.Response response =await http.post(
  //       Uri.parse(
  //           "https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=AIzaSyCiz-a-kBqfFxdOd6lnp7HqzWD22hUQJBU"),
  //       body: {
  //         "email":email,
  //         "password":password,
  //         "returnSecureToken":"true"
  //       }) as http.Response;
  //   print("${response.body}");
  //   if(response.statusCode==200){
  //
  //     Map<String,dynamic> data=json.decode(response.body);
  //     idToken=data["idToken"];
  //     expiresIn = DateTime.now().add( Duration(seconds:int.parse(data["expiresIn"]) )) ;
  //     email=data["email"];
  //     Navigator.of(context).pushReplacement(
  //         MaterialPageRoute(builder: (_) => TravelPage()));
  //     save_login(idToken,expiresIn!,email);
  //   }
  //
  //
  // }
  //  Timer?  timer;
  // Log_out_with_timer(BuildContext context){
  //   if(expiresIn !=null){
  //    final timer= Timer.periodic(Duration(seconds: 20),(_){
  //       if(DateTime.now().isAfter(expiresIn!) ){
  //         log_out(context);
  //
  //
  //       }
  //     });
  //
  //   }
  //
  //
  // }

//   log_out(BuildContext context) async {
//     print("A&A ${expiresIn}");
//     idToken=null;
//     expiresIn=null;
//     email=null;
// timer !=null? timer!.cancel():null;
//     final prefs = await SharedPreferences.getInstance();
//       await prefs.remove("idToken");
//      (await prefs.remove("email")) ;
//     await prefs.remove("expiresIn" );
//     print("secccc expiresIn${expiresIn}${email}${expiresIn}");
//     Navigator.of(context).pushReplacement(
//         MaterialPageRoute(builder: (_) => LogScreen()));
//   }

}

// sendMail() async {
//
//   String username = 'mailsend411@gmail.com';
//   String password = '01228506525';
//
//   final smtpServer = gmail('mailsend411@gmail.com', 01228506525.toString());
//   print(gmail('mailsend411@gmail.com', 01228506525.toString()));
//   // Create our message.
//   final message = Message()
//     ..from = Address(username, 'Send Mail')
//     ..recipients.add('abdelrhmannasser85111@gmail.com')
//    // ..ccRecipients.addAll(['destCc1@example.com', 'destCc2@example.com'])
//     ..bccRecipients.add(Address('abdelrhmannasser85111@gmail.com'))
//     ..subject = 'Test Dart Mailer library :: 😀 :: ${DateTime.now()}'
//     ..text = 'This is the plain text.\nThis is line 2 of the text part.'
//     ..html = "<h1>Test</h1>\n<p>Hey! Here's some HTML content</p>";
//
//
//   try {
//     final sendReport = await send(message, smtpServer);
//     print('Message sent: ' + sendReport.toString());
//   } on MailerException catch (e) {
//     print('Message not sent.');
//     for (var p in e.problems) {
//       print('Problem: ${p.code}: ${p.msg}');
//     }
//   }
//   final equivalentMessage = Message()
//     ..from = Address(username, 'Your name 😀')
//     ..recipients.add(Address('abdelrhmannasser85111@gmail.com'))
//    // ..ccRecipients.addAll([Address('destCc1@example.com'), 'destCc2@example.com'])
//    //  ..bccRecipients.add('abdelrhmannasser85111@gmail.com')
//     ..subject = 'Test Dart Mailer library :: 😀 :: ${DateTime.now()}'
//     ..text = 'This is the plain text.\nThis is line 2 of the text part.'
//     ..html = '<h1>Test</h1>\n<p>Hey! Here is some HTML content</p><img src="cid:myimg@3.141"/>';
//     // ..attachments = [
//     //   FileAttachment(File('exploits_of_a_mom.png'))
//     //     ..location = Locat ion.inline
//     //     ..cid = '<myimg@3.141>'
//     // ];
//   // Create a smtp client that will persist the connection
//   var connection = PersistentConnection(smtpServer);
//
//   // Send the first message
//   await connection.send(message);
//   await connection.send(equivalentMessage);
//
//   // close the connection
//   await connection.close();
// }
// sendMail2(){
//   String username = 'mailsend411@gmail.com';
//   String password = '01228506525';
//   // If you want to use an arbitrary SMTP server, go with `new SmtpOptions()`.
//   // This class below is just for convenience. There are more similar classes available.
//   var options = new GmailSmtpOptions()
//     ..username = 'mailsend411@gmail.com'
//     ..password = '01228506525'; // Note: if you have Google's "app specific passwords" enabled,
//   // you need to use one of those here.
//
//   // How you use and store passwords is up to you. Beware of storing passwords in plain.
//
//   // Create our email transport.
//   var emailTransport = new SmtpTransport(options);
//
//   // Create our mail/envelope.
//   var envelope = new Envelope()
//     ..from = 'foo@bar.com'
//     ..recipients.add('abdelrhmannasser85111@gmail.com')
//     ..bccRecipients.add('abdelrhmannasser85111@gmail.com')
//     ..subject = 'Testing the Dart Mailer library'
//    // ..attachments.add(new Attachment(file: new File('path/to/file')))
//     ..text = 'This is a cool email message. Whats up?'
//     ..html = '<h1>Test</h1><p>Hey!</p>';
//
//   // Email it.
//   emailTransport.send(envelope)
//       .then((envelope) => print('Email sent!'))
//       .catchError((e) => print('Error occurred: $e'));
// }