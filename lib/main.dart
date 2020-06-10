import 'package:diplom/ui/pages/BasicProgramming.dart';
import 'package:diplom/ui/pages/Autorization.dart';
import 'package:diplom/ui/pages/Home.dart';
import 'package:diplom/ui/pages/RoomStudent.dart';
import 'package:diplom/ui/pages/RoomTeacher.dart';
import 'package:diplom/ui/pages/TeamStudent.dart';
import 'package:diplom/ui/pages/TeamTeacher.dart';
import 'package:diplom/ui/pages/registration.dart';
import 'package:firebase/firebase.dart';
import 'package:firebase/firestore.dart';
import 'package:flutter/material.dart';


AuthService authService;
bool blIsSignedIn = false;
Firestore store = firestore();



void main() {
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/':(BuildContext context) => Home(),
        '/roomstudent':(BuildContext context) => RoomStudent(),
        '/roomteacher':(BuildContext context) => RoomTeacher(),
        '/basicprogramming':(BuildContext context) => BasicProgramming(),
        '/teamteacher':(BuildContext context) => TeamTeacher(),
        '/teamstudent':(BuildContext context) => TeamStudent(),
        '/dialoglogin':(BuildContext context) => DialogLogin(),
        '/registration':(BuildContext context) => Registration(),
      },
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}

